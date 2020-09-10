Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCE82648D4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 17:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897C46E10C;
	Thu, 10 Sep 2020 15:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750059.outbound.protection.outlook.com [40.107.75.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400C96E10C;
 Thu, 10 Sep 2020 15:35:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sq3FmL6PfgQkoZ5OTvFHXmtIda03ZOvyoPVdrOXRidRKQ61a1ARVVQoH2FWLzBm5HpE9BUIDUy3xluukMvXz4ADv/13jtpzHiVFf6FghvLwevaUyz7br4Y77U0r43/p9mMJXgSefBZNFI+AhL7y7XZq5JvwAo2aKHb2yvNKmvJHetmbnTAUwGtCN4SyKkvvS6+7fI3SH+pMdY+fJ+Z42Kf5/I2w90+G6j3Tb0ZTHdGr4K/uTUEo2TGV9WFPOCIaspJ53763Xdk7K2P/1CCZfjlssLo9vAGpnRFe4JxYfrHnghgZORX/2CmUHtman+N6hb4vaSOG+3HQ5755cbb5Zfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIV3+JJlx7srWtGGABzob7MYMJ7FcNqDiitRjtd+mGo=;
 b=SBzh6yoBLPyHmMrrbotlfjQqY17Iel7LXx9DszBSP9YURYfOGzblQ6D/gmyhTG4irxlAtl8kEgkcMVhqDfGC58sn+oI7/6j8dAQ1BmVyD2yA7b4PuQUDY5ZNvAdK1s1nNnZYRrQRn3WRLg0GkRQKuofMRuGF52XAUO+vf/r2LuFxjYDYNTudXrt00kkwbaCipN66/ed3lNm90HXPtlDMEDg7lLkf50TxF/5O0MU/7+7NwEH5IEvTKFQyoN29CHWZEK973fqtGZyDjWET5FD3qk8TI4Kklp1KKX+CPdN4/aK2IJnfR6BdltnVB8O0mRJY1mxVQIj5wLYKmQ2j1+PNIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIV3+JJlx7srWtGGABzob7MYMJ7FcNqDiitRjtd+mGo=;
 b=RZyE479epyiylW2I8CMGtyWs8r2ocEQ8udBM9Qpkix5C0vcDU057pvZvxDumr8s4bWvCtIBQUaL3vgV+fPT41xDo1es7vOcwObWxvedNrC0G6erU/SB1YZCIPZADJtwHNGQipqz2rorQXlD7iRAH90VsRB5sQH7gRLLpExiJ4gc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 15:35:18 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe%2]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 15:35:18 +0000
Subject: Re: [PATCH -next] drm/amd/display: Create trigger_hotplug entry
To: YueHaibing <yuehaibing@huawei.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, mikita.lipski@amd.com, eryk.brol@amd.com
References: <20200910031352.39992-1-yuehaibing@huawei.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <dcdc327c-c0d1-85cb-28fa-5b7cb5d4e555@amd.com>
Date: Thu, 10 Sep 2020 11:35:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200910031352.39992-1-yuehaibing@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::26) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.29.235.206] (165.204.55.250) by
 YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 15:35:17 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7d431826-ef87-476f-0d57-08d8559f1f13
X-MS-TrafficTypeDiagnostic: MW3PR12MB4379:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4379CDE5871D14CCC007D3CF8C270@MW3PR12MB4379.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2LF79ldZOjaHWcPxbffaso1OqNaV+svLC/v2/ugcGTkxzHh87MhVzTHnhUu4/ukmKiCEay7EgaRqWP7sVLX3k06rtENl+kP5XzMuoa2+V8ZwRUInSqbP/XJVi0Li6RfIvns7qBWC5txGX9O9neZmrCuyq0fAQPeyqtLoFMIZDZJa54VcHm3SqFFXUfWMIxhqQ/ikyw8ZmGeSVhEQrSNcH0MvSaBRwp4+jX6izTXgJcSuvGiIhBKz0mJkpEyLUSIhqKstaf7nTLfnAmUS4zZp8IaLq1PPbhxt05kDisWEBGREkUYdkOqUnJaAg4B4KjrFTI1JMJLMf5KtaHWKNWlbXt7mjIOLMNtDE0uc52dwXwBX/31RKa7A9B3qhPHClTJd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(26005)(2616005)(66946007)(956004)(36756003)(86362001)(6636002)(6486002)(8936002)(8676002)(66476007)(66556008)(4326008)(478600001)(31686004)(31696002)(186003)(44832011)(5660300002)(53546011)(16526019)(2906002)(316002)(16576012)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: IvXRaheIc0EmL1/gxqEjgtIv6HqunWa9lMXBy/miEyUj80CVpACy1+/t3n/PjgNEDd/nktmW+FAjOo9SEbJxE+nO30H52A3Ib+O3AFS8CUSp3Xd43cj5ypxPoyz78GUFwqdK5QaRjF9mLmINEiakJse8ZIP7G7Z1/CSioz7KPFd+ZYe+nkLyBSj3/WzGd/1Rd+LLUppuQOpKlbmjnNN15gu1yD3PUUxoIj194hvwPGeALrFb+WvaHo1tDkXK2pgS5gD4lzrR5g2mK6fEN7lODE/WB6qPKrypichETFCLfHg2jbri/S+CA8BwL8YKQKl00z4rMC0r/1zuv4gNVOpuRdr3cm10vAEOhQeinbzDWZDhLTml561/LBk7vINNKPASW5nBZToNs1asCR9x1pd2UiyzlB9+0fJF4ZXHrlSE0WpIUv+FgE+AkOhdTi2Nf7uPI1/fXCH9Vp4jgXukFMcW2YM/98CUaVSQN7kpmag6RhyU1uPhS/sO/uF5Dzyqc6ikjClWcyEvd6+4LrqEkwMm1QUNmjcayqWUBsgpRiaBMsGhasMuY0TKRKyCHmfU0VWuQI9HJMjXpewW5uhl3r5Xh+U6yzQahCCNUPgXJefgZTm4CBqtpdbbXRN6tmqptSfYZ4MT/Jo1j386qp6M9/MP4w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d431826-ef87-476f-0d57-08d8559f1f13
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 15:35:18.4325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYJOFPP0E/PE4atlOLRKmcOAISYA0GU3gX/ErLSt1bSb23gF3rgI0H5CEeVvt/7Tjigja5itoRvmabFU+xSaCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4379
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

On 2020-09-09 11:13 p.m., YueHaibing wrote:
> Add trigger_hotplug debugfs entry.
> 
> Fixes: 6f77b2ac6280 ("drm/amd/display: Add connector HPD trigger debugfs entry")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 94fcb086154c..83da24aced45 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -2098,6 +2098,7 @@ static const struct {
>   	const struct file_operations *fops;
>   } dp_debugfs_entries[] = {
>   		{"link_settings", &dp_link_settings_debugfs_fops},
> +		{"trigger_hotplug", &dp_trigger_hotplug_debugfs_fops},
>   		{"phy_settings", &dp_phy_settings_debugfs_fop},
>   		{"test_pattern", &dp_phy_test_pattern_fops},
>   #ifdef CONFIG_DRM_AMD_DC_HDCP
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
