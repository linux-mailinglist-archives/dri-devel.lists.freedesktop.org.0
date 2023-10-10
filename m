Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374747C0109
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 18:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1CE10E39F;
	Tue, 10 Oct 2023 16:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8076B10E39F;
 Tue, 10 Oct 2023 16:03:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AymOXgH+pcwuPnmhbGFhpsEeWS+w5Q8rbKlXIc08AIXOBTgcz2qMR2Yn5AnsJdTTFR/sO3Y7jm8g04njTVXIlULhitc4Gp1XRvaDdEgHeM9/b4mOiruj9Zo/hTU+3y5C056XRpBHilJMwMKAvpbTLC0iJVu4kmpmPaB92IgTnYpJt13kzPSoXspAmEvGnmOgOoS288XGlhcyEgI+cnAPajSSyhMudIai4Gp6P95Zrznaa+Fk1s6Hy81/p31fyupkZKywmZy1BuQEXRidvmB+CQ3uuHB+/IVomOjgUcbUXdXQxZOo5aCT9l1wUmsnaDSPu6VEckIJIkR1feT9/BGY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXmvMIAS7hfeb7tV/QSbdr9ITf/k9ghq4qWvQ7vzAPg=;
 b=SEyqJ+zVWuTusbikGxSzWSernSN2dMpjUpiMcHSfgkzsU6tvj76g5NsiECx9/yOG1nOwCn++tnXuEyo4RpzgMON7Ad6gGyxTOFGL+Ictp5AEqMOfovJh194q4nU8/IgLlJoD3WjWRwyx7EwiARJX6qEUMPLjyW5JGyJZr1x90FJUgeZHc1ilWGywnZfJ03fKL2pOyNipv5bX7AVjMMd0emi2mIoMFYgjc7nLKIrvdyQKquFhodYp6jsgYAWjtLfnyPhFUUGiMLPNbmWIs+GCsOY318VoiFSGlGHDm1F0X84oDysmvoG5jpImmLrfAda+s+Z3bP+kVCrxkUN4xxP2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXmvMIAS7hfeb7tV/QSbdr9ITf/k9ghq4qWvQ7vzAPg=;
 b=4YP8uSxS/rz9Ox2Gyslt7On7lZGPESVhv4Om/nsC+LHoSGSr2kjfAoYYybgbIx5BnslkfQf9eucI9Unsc4HmrDCEeQtQj4YWxyaV45ykux0FUg+L8Yz/EclSRXse9ImWXWxoNfRNAjrqDnXEB67nzWe2JvzxEVvLWdcYcxkMngM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH0PR12MB8549.namprd12.prod.outlook.com (2603:10b6:610:182::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 16:03:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 16:03:09 +0000
Message-ID: <0345caec-ccbc-4c54-a095-4fcef24fee25@amd.com>
Date: Tue, 10 Oct 2023 11:03:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/16] platform/x86/amd/pmf: Add support to update
 system state
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
 <20231010125917.138225-9-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231010125917.138225-9-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0192.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH0PR12MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: abd8d8dd-6f70-46db-a66d-08dbc9aa65b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1TaXEgQ7LAAPyhSaDcfoNdlrHGyjwgACD8iBgpuNbHxT/pqoSYX0WGwodRCLlHsZ6YUkAeg7kxc8mqPFSMO97rkbH1hgtYKCHFCQwTCoqEUmFWLy4L+uwF6HYT1NZUKfF/Of97T8ig6ragezpflKeJbY728Ss4BPwVmAzgAgcfnL5OSv/CYa2j09v1hgfHmdOLd6W6y5YECSfHlAKIhHyMG7sMy4ydQLtlwwLXoPVkloXPrY9Ej+PkEFGzJ3hBGxVB+m5c7WddZqiO/20kLETwAiAmPoyCyqbdY97AIcXz++JxcMD2j+06+2YzXDRYe/2lU6H16tdmr/2+7E114Mz8UGBO94mYrzfquNH62jv2Qqcry1kWm7NzwHtivGPBOJK5eoBoDGSFBl6cl8ysFCjMOqJs6N1753I5UZCRqw+4x/CxWHjKwVha4KyxQsPQZyzkidHqknbXwmw85Yod+JVvCpQletpTuPL7jctTTLSvLAuKW8s7dq/4V3ug2Nz+pAQtT6Z6BxmcBDduo0TrkTySjGGntAOrhoFIpAGdbq9JtI6yDmOFALodSRNcf8EAcHSXitOgrlY0FqQcWcUKuD+e1pJJrys+Bx8O+AeC6wNnG4/u7AmFn2brQPEK0ko0RAPgOaI/0m5w5MOV2jMPDYzVdJNpx2dCFSDJlffINb790=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39860400002)(396003)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(7416002)(86362001)(15650500001)(2906002)(31696002)(921005)(38100700002)(66476007)(6512007)(66946007)(6506007)(316002)(53546011)(66556008)(26005)(2616005)(478600001)(6486002)(36756003)(6666004)(41300700001)(44832011)(31686004)(83380400001)(5660300002)(8936002)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkY2UlFiRWMwTHE5bStoQVJqUUpaM05zSXM1amhtU1d2VERZSlY0SHNycCtG?=
 =?utf-8?B?c3BNNE9RTmNtdnJWK0RxMG5yMUtXRkgxN0FWa0luUTdobFBQZmpTQ3pHNnpj?=
 =?utf-8?B?T2cwalVhY0NiQ01kTTIySW9XbC9DL3ZlWCs4Y3g1Y0Z0RlZrNFhUZkNDSTl4?=
 =?utf-8?B?SUxWVHFMRGpPU09RcXNGQ0lsWW1TSlBOWitFcFF5SUVpNkZSK2p0OGpvWnlM?=
 =?utf-8?B?NHEyNyt4c0ZIRXI0SE5lRUcwUDkrNkxhM2JhNDZhdmdHL3dBY3NobVliV0pS?=
 =?utf-8?B?cVZHSm8ybCtvbjNmQXFybE5ZbFBGbzhibWV4cmtSSExwaDZnQzV3ZENjUCsv?=
 =?utf-8?B?MDkrUk91SGxISTFtYWlkb2paN2FmandjNVFzQ2MwR0tOdmhkaVpYZzlRR2Rp?=
 =?utf-8?B?Sjk3dzV4ekxDMzdiaUJxS3ZmbWEvWSt5ZHFLbit1Q2FYWXZiK001d2RDang0?=
 =?utf-8?B?amlxRGR1VmV5UEtJbllra1hZdU9NNUVoOE9TNjFxZ01uOHdiQkQrNGJYb24v?=
 =?utf-8?B?QytJRzlTRld4dWRnRjgrWm5wZzNJdDcvRDdHUlVZb3FXZ3prd000UXdEc2FD?=
 =?utf-8?B?MEFpOG9tWnVqbU55M3JPRUpvTTVlYlBJVDFSbng5cG5iQlRBMHdZaTZFc1Bv?=
 =?utf-8?B?dE5NWDQzeG9hWGtvZC9GOVRpeG14aXBLVzJFSnVmTEpaV2ZKQlNTVStjbVlP?=
 =?utf-8?B?bUNUUzVsZkZvcHhSYkRPcktnUnJRcTJEbEVLdy80VGowWVN2STh0SmdvMlZ6?=
 =?utf-8?B?dTJFTUM0ZWozZnk0WjI5SGt5ZStRVThiRUdrU2UrbUc5WENLVmxMSW5PaUNJ?=
 =?utf-8?B?Tzc3aVl3YklzLzMxajZzQUFsVEFmUURERTR2UFZQcHVyUjJaa1o4SnRtZW51?=
 =?utf-8?B?clZ6TDZhaDg4bXIxcGVNVWllZnMyWm02MW94cytXMitWZVd4aTNmYnZMdGc2?=
 =?utf-8?B?R3Y1cjVmWlg2Z1RuME90ZFk3dyttSWc3eDlzeVRqVjI3aUhUbkhhaTJFRS9m?=
 =?utf-8?B?cU92OU5xWEliSG9wOU9WaS9Xd0R5d05nd0srZ3V1MU1PUVRlSks1VGlOTHMr?=
 =?utf-8?B?alkveWFCQzFQczcwMzUxWjRzS1BybVhQOHQ3em1jRzJ4OWRRdElQYlM1dHRy?=
 =?utf-8?B?L2pSU2MyeVU3VnhXMDdXdWIzZTloVmJoZUJPSkhpZ2dXa3NBZHQ3ekVaL1FH?=
 =?utf-8?B?c3lYT0pCaHZoN1ExZksvT0p4RG9KTkxaYXBvRzNRS2lTcWlCS3poalBjYkNh?=
 =?utf-8?B?bExkaHpjZ0paN2lYaUhHWnVISzZUY0kwQUZjNWl6UzNhWHBkQllFT1M1WVY1?=
 =?utf-8?B?THBaY1BjMGcxNTV2NCtrZzgvb1pFejgzb3pkejFtaEcxNnFCcXZZYkZKVjli?=
 =?utf-8?B?ZlRod2ZPUXlVSkN1VU1uSENKQVQ4SVhDNUE3aXJITjA0ZU4wTlNOT1ZvRisr?=
 =?utf-8?B?NTJObjU0NkpRc29TaERtMVE1MDJ1OWRwalllanZqSFVPZU1FdDA1VUYvd0k1?=
 =?utf-8?B?TVQ1cU4yU2ozR1VSWk1uY0FYOE1TU1dXRkpVdWljdFBySUE2SWxaU09Db0ZQ?=
 =?utf-8?B?NGRSbHdndnBZeTdkdHRFR3ZFTklqNWZYa3Q4a1MzampYRW5FbTRJZlpOK0hz?=
 =?utf-8?B?TTRnVE1pZWszdGVheCtVNlJNT0U2eXVQTTFrZCtUQUxxdk8xN0xXNngwdk9K?=
 =?utf-8?B?STNlRExTdGxOTjJPL21yWC9BMFZlTnJRVmdXTVNLa3d6UWxXVkxsZzd3aGVm?=
 =?utf-8?B?OU9Rd3djWTdLaHViYkJqcXBPRGtnSWt3NlVXL0NrL01TSVk2cDRvTllLemlC?=
 =?utf-8?B?dEdIK0Vudzk4ZlFYNFhDdkJ6MDZBaCsxRlBOVGJQMGdGd0JtZzQ2TVpWSXJz?=
 =?utf-8?B?eDRqaXVwSnptanhmZm4vUnFWNVY0elRlSGRQbnpWdEtrU1NjT0RqenRQT1Vv?=
 =?utf-8?B?SXZrZXZ4bEZwMTVzMG1KOTRvTEQveXZKYktVRjVjU2wzR2lZQWJmZkxobVBm?=
 =?utf-8?B?bTI0djVVKzBGTFp6N2VKWmRxdHk4L21Gb2h6OVJSS09FZENXdWdXanhDMkJ3?=
 =?utf-8?B?SG1NM1d2TnlrWFRCNDhiNFZNQ1pRbHhBNStpT3lYaGdMaWFUR3FwMDUyVTNS?=
 =?utf-8?Q?IozEg34QmXdByZaIbCqX6DhCE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd8d8dd-6f70-46db-a66d-08dbc9aa65b1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 16:03:09.2249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXpRM0LAy+fuJkH2FE1dcc/xbzHCl85w7Haxm6Ye99A38CMM7KKCChPVoFZh+JcIymnsovClzSVnR4zlrWSlpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8549
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
Cc: dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Patil.Reddy@amd.com,
 platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/2023 07:59, Shyam Sundar S K wrote:
> PMF driver based on the output actions from the TA can request to update
> the system states like entering s0i3, lock screen etc. by generating
> an uevent. Based on the udev rules set in the userspace the event id
> matching the uevent shall get updated accordingly using the systemctl.
> 
> Sample udev rules under Documentation/admin-guide/pmf.rst.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

One minor nit below.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   Documentation/admin-guide/index.rst   |  1 +
>   Documentation/admin-guide/pmf.rst     | 25 +++++++++++++++++++
>   drivers/platform/x86/amd/pmf/pmf.h    |  9 +++++++
>   drivers/platform/x86/amd/pmf/tee-if.c | 36 ++++++++++++++++++++++++++-
>   4 files changed, 70 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/admin-guide/pmf.rst
> 
> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
> index 43ea35613dfc..fb40a1f6f79e 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -119,6 +119,7 @@ configure specific aspects of kernel behavior to your liking.
>      parport
>      perf-security
>      pm/index
> +   pmf
>      pnp
>      rapidio
>      ras
> diff --git a/Documentation/admin-guide/pmf.rst b/Documentation/admin-guide/pmf.rst
> new file mode 100644
> index 000000000000..6985bb5b9452
> --- /dev/null
> +++ b/Documentation/admin-guide/pmf.rst
> @@ -0,0 +1,25 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Set udev rules for PMF Smart PC Builder
> +---------------------------------------
> +
> +AMD PMF(Platform Management Framework) Smart PC Solution builder has to set the system states
> +like S0i3, Screen lock, hibernate etc, based on the output actions provided by the PMF
> +TA (Trusted Application).
> +
> +In order for this to work the PMF driver generates a uevent for userspace to react to. Below are
> +sample udev rules that can facilitate this experience when a machine has PMF Smart PC solution builder
> +enabled.
> +
> +Please add the following line(s) to
> +``/etc/udev/rules.d/99-local.rules``::
> +
> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="0", RUN+="/usr/bin/systemctl suspend"
> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl hibernate"
> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/bin/loginctl lock-sessions"
> +
> +EVENT_ID values:
> +0= Put the system to S0i3/S2Idle
> +1= Put the system to hibernate
> +2= Lock the screen
> +
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 20f3e16b0a32..67f11113d5a7 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -73,6 +73,7 @@
>   #define PMF_POLICY_STT_MIN					6
>   #define PMF_POLICY_STT_SKINTEMP_APU				7
>   #define PMF_POLICY_STT_SKINTEMP_HS2				8
> +#define PMF_POLICY_SYSTEM_STATE					9
>   #define PMF_POLICY_P3T						38
>   
>   /* TA macros */
> @@ -440,6 +441,13 @@ struct apmf_dyn_slider_output {
>   } __packed;
>   
>   /* Smart PC - TA internals */

I know that Ilpo had a comment about this in an earlier version that 
there is a "__" instead of "_".  I know this is intended behavior for 
consistency with internal usage, but maybe it's worth having a comment 
somewhere mentioning it's intended behavior?  I'm not sure where.

> +enum system_state {
> +	SYSTEM_STATE__S0i3,
> +	SYSTEM_STATE__S4,
> +	SYSTEM_STATE__SCREEN_LOCK,
> +	SYSTEM_STATE__MAX
> +};
> +
>   enum ta_slider {
>   	TA_BEST_BATTERY,	/* Best Battery */
>   	TA_BETTER_BATTERY,	/* Better Battery */
> @@ -471,6 +479,7 @@ enum ta_pmf_error_type {
>   };
>   
>   struct pmf_action_table {
> +	enum system_state system_state;
>   	u32 spl;		/* in mW */
>   	u32 sppt;		/* in mW */
>   	u32 sppt_apuonly;	/* in mW */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 92879ae4f8f0..c08ef13a1494 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -24,6 +24,20 @@ MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (defau
>   static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
>   						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
>   
> +static const char *amd_pmf_uevent_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case SYSTEM_STATE__S0i3:
> +		return "S0i3";
> +	case SYSTEM_STATE__S4:
> +		return "S4";
> +	case SYSTEM_STATE__SCREEN_LOCK:
> +		return "SCREEN_LOCK";
> +	default:
> +		return "Unknown Smart PC event";
> +	}
> +}
> +
>   static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>   				 struct tee_ioctl_invoke_arg *arg,
>   				 struct tee_param *param)
> @@ -42,9 +56,23 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>   	param[0].u.memref.shm_offs = 0;
>   }
>   
> +static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
> +{
> +	char *envp[2] = {};
> +
> +	envp[0] = kasprintf(GFP_KERNEL, "EVENT_ID=%d", event);
> +	if (!envp[0])
> +		return -EINVAL;
> +
> +	kobject_uevent_env(&dev->dev->kobj, KOBJ_CHANGE, envp);
> +
> +	kfree(envp[0]);
> +	return 0;
> +}
> +
>   static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>   {
> -	u32 val;
> +	u32 val, event = 0;
>   	int idx;
>   
>   	for (idx = 0; idx < out->actions_count; idx++) {
> @@ -113,6 +141,12 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>   				dev->prev_data->p3t_limit = val;
>   			}
>   			break;
> +
> +		case PMF_POLICY_SYSTEM_STATE:
> +			amd_pmf_update_uevents(dev, event);
> +			dev_dbg(dev->dev, "update SYSTEM_STATE : %s\n",
> +				amd_pmf_uevent_as_str(event));
> +			break;
>   		}
>   	}
>   }

