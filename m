Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E3A2648D1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 17:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E166E109;
	Thu, 10 Sep 2020 15:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760048.outbound.protection.outlook.com [40.107.76.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2B76E109;
 Thu, 10 Sep 2020 15:34:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMb2pCeXxvDuHzTLe/5M5OzwgmA+6e81dhWr7Vh8MkdFHNJa6NAgFZensPYgtqDbWX3S+q9BBing2Ji3JEDz/5mYd3RaoinWD6NWxe7G8YyLDAnLGr35ttwQ+LKigaaiyZN7XFC8gAselm+cildoYWGE39opYyhXSaB22+wVzL+JqYc7qJaD4HjZ9M2PQ8Qpy14CfxIwRL7pYU0dQuimshLsjyeuM3dI3iPUK9EgNOWFrhSAUu4XLVDQkSFRND/SKpAGnzd2a1G121tB2MgprmIBS9z/yThWbUKLUiZOPP2QzOJmVPfut9EnUd4y8mm0wCzGSh08+/jsmQlHRS5ghA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDQvN2Wf7R8oj8Cj5LTY4US5V4A/UCxCVK2fc6qpAYw=;
 b=S0el9BFB8nx0OL9Vs+ArARGyZABiAvwRnrbSrlS4TE/SYAzXjN/2+Fzin06MQdBNXrVw0ZyHCCeHKJ9aXJDhb1fYsjDZ1QXPkySP4Mihyc+kVGOp1j/ACVAJz5fPxlx5Fu+h6669bUmyT506UqyU54l2ATVTg5YQ2H7zAQQwekYoCFj4eYVC7Y9KpBmYkWy/3a7mL0+2gn3N6eZrEZpTLsBXI0pKYalKiTJtfSdh0JD5lhjFB17K/BPglsSMJ2a2rcZqCUWJllT9v872FGPxaqkbugExMvwB7FlJ7ply5JxE9BlVg2t764qguYBffr5wD5XjWyexsTwjIqV+e+4csw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDQvN2Wf7R8oj8Cj5LTY4US5V4A/UCxCVK2fc6qpAYw=;
 b=Tzaw1A2aqbnjxqPZzGklE3UfIn9Fgs4unT6vZCeEFiO9ZbFM0cqHW7BMXY4He1IzF4g8gmG6rOqDmQFoVMYlQzzGkRRO2xb/2KbcYXdbYzcwPTiME4GmQJle2wULHeyR2lNLi+3B2DMrxX0SOEr+CzjKP4W3ePV0HdcCnYf/57Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR12MB1694.namprd12.prod.outlook.com (2603:10b6:301:11::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 15:34:37 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe%2]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 15:34:37 +0000
Subject: Re: [PATCH -next] drm/amd/display: Fix possible memleak in
 dp_trigger_hotplug()
To: YueHaibing <yuehaibing@huawei.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, mikita.lipski@amd.com, eryk.brol@amd.com
References: <20200910032636.27296-1-yuehaibing@huawei.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <62c4312b-9e92-23bb-0823-7f1aca125c0f@amd.com>
Date: Thu, 10 Sep 2020 11:34:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200910032636.27296-1-yuehaibing@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::27) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.29.235.206] (165.204.55.250) by
 YT1PR01CA0148.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 15:34:35 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 294fd88d-10da-45b5-3612-08d8559f0662
X-MS-TrafficTypeDiagnostic: MWHPR12MB1694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB16949BBDC03A31EFA489CF4E8C270@MWHPR12MB1694.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lhNoKU2TARfga15JzKfNFfRxxw6Fyjj1rfv8omMoHxO51sfQ3TCdgFsv9pCThkM0tTrncF6k9AXZV9ZmI4Dd0DuQrmp7zrAkwe9r11279z9eGgGYElkp6s3wusgoQmi9yUJZm6+BWNBWEo+1d2/2r6rCADtQtqhqpEuukVBy3iB4kDUbBwIx8h5m9oxfg9kEfC6x0qMu5ojzHhCr48JVXIOEadIqZ5q2hhKIhQHPHf4Rz2UYhcukVD2PbQ3FuOPuKqOyaCX2ykR1vd6koZ9jKJ9n2jA/fmyfsHVU6/AiPmqIE0yE8+vxcQ353AOx1JK7chfrrKttSQl5XqQqrge0260Ifa432gd34pve4Gp2kIGkPzE+D1ZvFoiHL3kCmJLL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(66556008)(16576012)(36756003)(53546011)(16526019)(478600001)(8936002)(6636002)(186003)(4326008)(6486002)(66476007)(956004)(316002)(66946007)(83380400001)(44832011)(52116002)(31686004)(26005)(8676002)(31696002)(5660300002)(86362001)(2616005)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: uNwPU5UyzaF3Zx4OqeNcjt4+hyNUb7i0eY3T1a/BC+556jG8llP+9LUB5g91MFPj2KjS2TlqMXCsBN/13byXJwHr5ODNvn3c6/rvLGbhey0yxOF1YKCcmBaZgM+xyKpHz6mgQ2nAq7L8ap7YOXLDNv/FpaNLKTzJ3WrOVGyV9NIyp67U0I1WwK8mf2PM7RBvahxcnny6gl23asOUyTY4qjqHu2tMNqjIrVglhhTZKeuBsz40ZJ1lOqw8bChWRB7LHPn4iw9O5vwIJxHR9urE8XkefrshyTG+bWUpnrlMdBSY4FHWSHKuGYCYndDLXA13GQ5ea/9/dKaoSTzmivyCBe0rRrd4RSfBBqc0k00svJa6YArsdf2kk5Qjksn5JHE1/WOQ3SAv8Qi38een+QQWD4UjT6lA2GOU1/SpjLhX2hxuBjpP+77BYKWRjOpEthi7zLOuzmBwJfaDHquHSoXDV4gGFVO2TqFnjHg8dkd48J4YCn7uZHmZ5Pm7cvCnPPLhfTV3rqyoGvmxwDrBuPNrvk2tlkYCVRzgJlLqqQa9fRM6Oufuuv+do7mx+T/K+yF90jDOwRcJey/BUP9H+KLIsyg8xgZnXyrrTDBcfVysKpmu64sunL/uA7yfreoVscPvZEppfgnm5P3wV6L7AOYdVQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294fd88d-10da-45b5-3612-08d8559f0662
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 15:34:37.0137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnwJHbnljMRAuq0bnH0efeEo07sewBv6w/Hk2VgTO/845LvKmIjnruodQFZqBxRrFWgz4q1coJKtBMou/SWLfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1694
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-09 11:26 p.m., YueHaibing wrote:
> If parse_write_buffer_into_params() fails, we should free
> wr_buf before return.
> 
> Fixes: 6f77b2ac6280 ("drm/amd/display: Add connector HPD trigger debugfs entry")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 83da24aced45..11e16fbe484d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -1089,8 +1089,10 @@ static ssize_t dp_trigger_hotplug(struct file *f, const char __user *buf,
>   	if (parse_write_buffer_into_params(wr_buf, wr_buf_size,
>   						(long *)param, buf,
>   						max_param_num,
> -						&param_nums))
> +						&param_nums)) {
> +		kfree(wr_buf);
>   		return -EINVAL;
> +	}
>   
>   	if (param_nums <= 0) {
>   		DRM_DEBUG_DRIVER("user data not be read\n");
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
