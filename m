Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2172665CC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 19:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364346EABD;
	Fri, 11 Sep 2020 17:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB796EABD;
 Fri, 11 Sep 2020 17:13:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKjRuL3vGPQNc7NWPkmHHFyklpciUKAZxZS4/GY+353SwYlPcA1BFSr484CiweF2O3i9QKEsQuKRvYxA+yfZ0nKaR5fVAmRAtmCjgCD+BP5kYKJq+2Hj5SW+ThR7JBm3Kb1NvzE1tu/pvfyAkR715+QkttiENbuCsKBjIwAc7VERkWSQLVbzZTPec//NxxbsMomihnPNDJ/YIlTRsy07SPgrmRkkxflA3kGHXBp2jraAvzGTW1pcdb3MSJKzHmZS+8CKHN8UbFyneNltOD9VcXqWzyQVBvcazy7bRRY6lSVi1kFNFGEq9k/R+830rGNKuZjnkRGMie5ROJGgy5DxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/cQd8bJaKOn1nyLKAELAKwzTq7dbsOLCReVTV9IKNM=;
 b=L4JWcPF9vtkoGHYSfMRlzsvhVB6JYZ27rQGW6T5hygjrsnVFw8zcmW7zfUp3WXC973mxTjVndZaNIYRPZTjctThhIBktZX5goHoIZTwZOGG9usNeV3ptazvuLAGFTD5TzPrllI8N4yAvPxXglcUjMuHdgvckJ5QTq5IEaWn0n/kjVWXxBWZB6h9J+hQjvT4k54Zs9YlPIx3NFACc7dLlFbaLfeUV61m8sBh86tVmkrea4gsFr8cWrkVCKFM0BrISnE4C+c/UZG6EFKX+KAL3E8+XpKVwx0SOZOXVyTPB4IJwGHDCkmN3iCovxm1kvFHYPIgnjvr1XWfJIHSc14FseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/cQd8bJaKOn1nyLKAELAKwzTq7dbsOLCReVTV9IKNM=;
 b=IxhnJcFMFHRHKQc+klhY0K+hbaAIMZ14QT6l0ULtLxPbkrjfHCZPJkoAaq+cjcqd3usKfg3aWCE6PTxD+aQ/ZIsS76XbvK4cqk8zKr8Yw6Yl8/+bNQu82QbnM1HYpEvynb6KMZZdIjbId5LIZ+7E9FqOLleXCjJdy8HTx71MlPo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3143.namprd12.prod.outlook.com (2603:10b6:a03:a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 17:13:34 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::754e:8f27:157a:9101]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::754e:8f27:157a:9101%6]) with mapi id 15.20.3326.030; Fri, 11 Sep 2020
 17:13:34 +0000
Subject: Re: [PATCH v2 1/4] drm/amd/display: Rework registers tracepoint
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
 <20200911145927.401322-2-Rodrigo.Siqueira@amd.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <c1eacedd-056d-d6a8-0407-2dea63f47bd9@amd.com>
Date: Fri, 11 Sep 2020 13:13:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20200911145927.401322-2-Rodrigo.Siqueira@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 17:13:32 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7106d2f5-7bd5-42ce-f6df-08d85676039d
X-MS-TrafficTypeDiagnostic: BYAPR12MB3143:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB3143D846FCAD5C9D89655F24EC240@BYAPR12MB3143.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UmI0HGNPiEB4Zb0Dxd6vtIJK5QSW4Lwknmu1hLp9/NBTN828yplHBS6LtNHDF9+uqqjGc8YO9S86w9sr1ISB4UUZ1lhD6E7DiFtupidnZUdgjj6l3tX6/X/8ba2qcKZhSeKOEynHjiHA2Hfh9m8jcFWYkpvsxZ18t+xYArbPZdbuFeOcs/rXmdwzHQtBPN2+/MaaDxMSP/Qp8+k2D3S98TetfObWjvoqEv0TUTa0UTeu0hRBq0pCpR0EpgjEgKs7G/TEgcV5/f5mKj88pg8EZrGoIedFr7WEwooeVd1XkQGsv8k3qgBZ5GO5eYCU7ARgvle8e+18lS+3Dp0iP27anhXV25zW9hgMrl/8wy/Z51ZsWMYHsfUWLsV3ZrCn8xDU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(52116002)(2906002)(66556008)(66476007)(36756003)(31686004)(26005)(53546011)(86362001)(31696002)(4326008)(5660300002)(186003)(8676002)(16526019)(54906003)(16576012)(8936002)(2616005)(66946007)(316002)(956004)(478600001)(6486002)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: K+CjuJSx8YGH4JVl7LvESfRbd4hARWpz7Tjb0ovUraOTcD6mZACfsBJaNSNsXNYBOmO9nc0PHzc9xI3EdNccB22VeDWJdApgGKh4sE0RJfJKFxEDLu74XKcTXAwtYzCXKWfiOcFijbt3Iv1wNZqnaH11PZVtkgS3SM5Qud6iD+ZtNLW56No1bCt/I6VmTgH3eh39WC6lK+L85IFIhS97zTdcrAR4kFGYKTQzQTln5RtaYn43jBjLv73NVVUeNbNvlfC0qjzr70nyd+h34erkts4SBU4RT8aMVuwtR7GUAcSPwkOZp/lx8HoY6jgozedJcV6RrrxqtOoLuVs1Z2yNGZnHoh6tsvAgKJ/dGebv3Zb9b6/I93MOxUJAq5XuUWbpUf32rEhjt049t0EkPGeXxVwD0eUhrhIcYvomCZJZx1VQyUSK2rkLbZKMgRn+gstlPvHrcdg8HtOPaFhl1gOk1emegwEl6ld3FmWxxYnjGMO9ftH3jbpJ8pqBMDKi5EPxmrgY++nP1Im0BXHhiaa45PtlxASABVFnkA26xaxgVAj+PwOwVSi6tCC8PIi6DsUpx/nflXyhtF7zn4eDuBUO0DfUZh5EVSdsNpbU2kRVykMcxxgooobMKKD7ye+EZ83h5tHxIwUo+lpXBMriwu3W8Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7106d2f5-7bd5-42ce-f6df-08d85676039d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 17:13:34.2417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/TTOKUcD0SUFI9TS7nNM8i7ipnh1BBC6O1Z4o8vPAbhdim7AM6iMulMefujo1PHTYBy3Am+9vtQEBe7W42rAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3143
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
Cc: Leo Li <sunpeng.li@amd.com>, David Airlie <airlied@linux.ie>,
 hersenxs.wu@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-11 10:59 a.m., Rodrigo Siqueira wrote:
> amdgpu_dc_rreg and amdgpu_dc_wreg are very similar, for this reason,
> this commits abstract these two events by using DECLARE_EVENT_CLASS and
> create an instance of it for each one of these events.
> 
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

This looks reasonable to me. Does this still show up as 
amdpgu_dc_rrreg/amdgpu_dc_wreg in the captured trace log?

As long as we can still tell this apart you can consider this patch:

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Regards,
Nicholas Kazlauskas

> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 55 ++++++++-----------
>   1 file changed, 24 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index d898981684d5..dd34e11b1079 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -31,40 +31,33 @@
>   
>   #include <linux/tracepoint.h>
>   
> -TRACE_EVENT(amdgpu_dc_rreg,
> -	TP_PROTO(unsigned long *read_count, uint32_t reg, uint32_t value),
> -	TP_ARGS(read_count, reg, value),
> -	TP_STRUCT__entry(
> -			__field(uint32_t, reg)
> -			__field(uint32_t, value)
> -		),
> -	TP_fast_assign(
> -			__entry->reg = reg;
> -			__entry->value = value;
> -			*read_count = *read_count + 1;
> -		),
> -	TP_printk("reg=0x%08lx, value=0x%08lx",
> -			(unsigned long)__entry->reg,
> -			(unsigned long)__entry->value)
> -);
> +DECLARE_EVENT_CLASS(amdgpu_dc_reg_template,
> +		    TP_PROTO(unsigned long *count, uint32_t reg, uint32_t value),
> +		    TP_ARGS(count, reg, value),
>   
> -TRACE_EVENT(amdgpu_dc_wreg,
> -	TP_PROTO(unsigned long *write_count, uint32_t reg, uint32_t value),
> -	TP_ARGS(write_count, reg, value),
> -	TP_STRUCT__entry(
> -			__field(uint32_t, reg)
> -			__field(uint32_t, value)
> -		),
> -	TP_fast_assign(
> -			__entry->reg = reg;
> -			__entry->value = value;
> -			*write_count = *write_count + 1;
> -		),
> -	TP_printk("reg=0x%08lx, value=0x%08lx",
> -			(unsigned long)__entry->reg,
> -			(unsigned long)__entry->value)
> +		    TP_STRUCT__entry(
> +				     __field(uint32_t, reg)
> +				     __field(uint32_t, value)
> +		    ),
> +
> +		    TP_fast_assign(
> +				   __entry->reg = reg;
> +				   __entry->value = value;
> +				   *count = *count + 1;
> +		    ),
> +
> +		    TP_printk("reg=0x%08lx, value=0x%08lx",
> +			      (unsigned long)__entry->reg,
> +			      (unsigned long)__entry->value)
>   );
>   
> +DEFINE_EVENT(amdgpu_dc_reg_template, amdgpu_dc_rreg,
> +	     TP_PROTO(unsigned long *count, uint32_t reg, uint32_t value),
> +	     TP_ARGS(count, reg, value));
> +
> +DEFINE_EVENT(amdgpu_dc_reg_template, amdgpu_dc_wreg,
> +	     TP_PROTO(unsigned long *count, uint32_t reg, uint32_t value),
> +	     TP_ARGS(count, reg, value));
>   
>   TRACE_EVENT(amdgpu_dc_performance,
>   	TP_PROTO(unsigned long read_count, unsigned long write_count,
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
