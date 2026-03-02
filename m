Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKkWLt5lpWmx+wUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 11:26:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693951D6734
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 11:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAD210E47C;
	Mon,  2 Mar 2026 10:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Oo3T/vt6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1636210E073;
 Mon,  2 Mar 2026 10:26:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPDVjupWaXDonaC49POLHFtEG89T80KSwoLNYoHrHImo6DAbYLx7zv8ovnW0QnUaCO5ti8L0M2ecyC+ve7D7Fssn3vMejax1sAPyHGjiiYrRAg9AUQ0qayBm2krg3V2O5LPNe+YLg0pCmTqhctVH9Y0awqqOrNeIEDq/Xohsjw9pO1dNnY/KbaPr5tdWXO6E/mYYIA2E3F6HKCW0mQ1b2a/jd/gyYcyASLZnRWcaENhPKJRzhOd56fENHoaRMT7wqfGlxVEPHNPV0GN82mq8YlhnI4RoSfbJ1bTFcZG/3ck9BesEK+8kPsH6Vjhb5hDDXdivxXlQfuSOU/tsXf8rCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utjescEvm88lyjAN0DlbMnX4Mh1/Iyy71/igFtPPP5k=;
 b=MXh1tHAsxIFdUYMINJrEJcQPZZ8HY01rKj0CvvPVVOy3IYV6VxGzlA1nOi7U0Rc2fKzrvF7OpBYaBtB8TKmJTBAdDF257nkPW0NXbupaSc/RH67uMF35Yt9mwyeMhyzdFoto4LQxWBlUyOLmv+Mi3tarjIsLEVRBv/8+BkAiH7yNt6gT6w2lrwY56Bj7q8rDeJ/iln8qbEXGTcOBy2XEdwnvzMpEtDWnNpv896sebh4qFu+dzk3grvCcRjWyWRmt8imUE/zVdgfGEKW26OCOq5+zAs1brziB4o9f05lWpFZ7tSMpz9bec31JYJzNbF3t/tZbf9gFJ8tIPleGyR+3ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utjescEvm88lyjAN0DlbMnX4Mh1/Iyy71/igFtPPP5k=;
 b=Oo3T/vt6EhskeBrOUmNUvGF80fRylExpSu7Pf9KeKi4dReQ/3XA2iVNfxvlHoZh/NML+tJW9BNeGeE3OfTDKfN/nGnVDbanbdg2/dmUw4L7d1ciybcN7VhxPPizAYbVW1OtXkOovxYIRfNV7m8+FOmYqYKTFiuUHjcSY1UzmdHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Mon, 2 Mar
 2026 10:26:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 10:26:30 +0000
Message-ID: <4c32e7c3-71e8-4ad3-a1c0-a06d42a00e50@amd.com>
Date: Mon, 2 Mar 2026 11:26:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: amdgpu.h: fix all kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260228071856.2664080-1-rdunlap@infradead.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260228071856.2664080-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4391:EE_
X-MS-Office365-Filtering-Correlation-Id: 4933bc20-f976-40e5-a966-08de78462b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: Bx8U0YxG7s+y5nd/1sCV1QYGLesKOYU2+dXGa4sxSaPm1PG8HqT7WNQIsYqOIdcGZXQlXZQOzqRa1HRnbCkbrOkZkocHszI6d83JGsDo5zwFpHAHNe+E71gamNA7PNY5eIcPkEhn/Y8VJW9l11B4+UiMnEHAJHUHLhbTcSf/ADkpPg5zjxekIYk78XQDBBFUYkszSgkze3igjgKtk+EtyD6fze5wqwmjCtTR04hB+6yvFy3TCNuYstRpdmduc7u2sn6ALcZmu5bkc8faw1OWUdLn6RUe9TalFIDD7ZCqOsRktmtLZ6AjArj7LyI+d75ITnL8QBt6xdoZm9rxXwQr6whzibfXVDgzTtiiCgwMLDeFCQS64l6UbelK26+UD3rzlYR3+WIKenA36mqCRAh7D/MAmxfdMnvzlM6U9kGGoxKvNoQW3GJIoucYiKoQdDGcE/Bu62Y86s1x/g5EJ++9wO44W0pXYGqT7zkQWnC89IeZhC8XPx11F5+QSFwFZyVzl78KXmV3DrpjuN1wFTBnb8ejWyFtqDL3JnqZoxQTnnhdQx6za7ZYU8Vf+Y2iLHAYhzLqffMdQVOhfBLmgpXL6477VJYyNVNatTxTHthIn/btiNcbgPcZAZ/mybGo9J44K4R+0SOQxo5Up3nawRTIeNIs/yljzhb+NP4Kvfx7s+ZWaPEwg0IFQVKbXcCxhNJe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG1HUWRBSlNVYVk1N0djQXEva1I0aEVpVGIvZ3pGL1BBcHY0Zm9iSGhtU0du?=
 =?utf-8?B?dTEydVFQVElBcmFza0psWmRVVDg4TEFQOGRqdUF4L3huS0Iyc1JiNDJhdlhG?=
 =?utf-8?B?UWFwZFB1b3F0K1NMZytzandCOEFnVlh5OWdQOVJoaGEvUExyK0p2NGllSmh1?=
 =?utf-8?B?UFdqUDFCSk5OajRJWFhSaEhGUitjWDV1c2l1SnRlNVlEV2x3dmNLM0VtS1BG?=
 =?utf-8?B?UVd6OE5rK0FQcXZaQVRnZkJvMWh2dHlnV0tPUEVRczRNSHpUUDRsdFdxN25k?=
 =?utf-8?B?aE9KUEhQSEdZNXBXZWJxVmlWWHNaaUFlTmpsZEdPdHYyelZqWXJqQ1puWWxL?=
 =?utf-8?B?eUlIQkI1eTR2cmRFUlNMTE1seVBaM2FxUnI2Y3o5K0hNbTUzSEpPaVlMWG5H?=
 =?utf-8?B?YTRvTU5sRlRyRDVPcVYxT1RGRk1MT0FaaVRiWGx4d2szMGRuK2tTeEtoeG9z?=
 =?utf-8?B?VFJ2ZmJjT2YzcUdmRXFRZVpOcmlrWS9mSTYrR0JzSDQ1d05BcFQrVkZsTk9h?=
 =?utf-8?B?VyswUUxuUk8rSWM2NnZlZEFselg5bitsWUxmWjVUSWVSbDBQYWZ2RUNmQkdR?=
 =?utf-8?B?NXpyQVhweXNrZHArNG1jMFZLYThZU20wYTN6M3EzemZHYUdoTjR5aXozSlgr?=
 =?utf-8?B?QUt1aEFRcU1nL2Z4bjNUR2lwWnpQN2hBcGVyOXRURmZXRmZLL2FzV3NVeHV3?=
 =?utf-8?B?b1Q4TEFBM1RXMmhlN0pWa0hNeFZpZlJibm1wcWhJV2k2MkdJbUJXaFpUTGl5?=
 =?utf-8?B?TmxmZGdMUlpsZWs0S0VoMnpjdmJPZ0xmYmhxRlc1aURsVkhxOXIxd1hyR2tr?=
 =?utf-8?B?bzhXVjlFRFM3N01ZZ0ErdlNEYkVWTzVpczR6enRzalhCcGx4OExrTEVTWnB2?=
 =?utf-8?B?OWZjNEMrc3o0TVJLSjd6NHJQRnRBMkEwY1dDcWswVDNrLzNaOUh4eWxCd2FK?=
 =?utf-8?B?VlVzRUhMakRUbnIvOHVKL3B3RUJyQWg0UTVuMTF4d2VINFJaL056ZzI3VUFE?=
 =?utf-8?B?RzV4QkdaYlgxT0dZeDFhQVJtQlNUWGQwTGRwZ0wvZVB0SmlQbDk2T3BST1lC?=
 =?utf-8?B?NDFqemdhMlVKem9lbFA0b1FlRzJOWlFsR05uRlJPRjlUanJFdXpJY2d3eDF3?=
 =?utf-8?B?WmhFY2NpZlJaRk0xS1VZTzhkUGwyRjJVcWp3c0hpS0VWVDBlMEx5RWp6VFk0?=
 =?utf-8?B?VUE3MzU5UHhVaUpXN2k1aFRDUDBiQUx0aHlEZWtjNCtLYUVHZFhYOEdoUWUv?=
 =?utf-8?B?WmRzcTJVMElSQ29KMk9BSmRtYjgxZVQxbnlQR29pZDFkNGI1aGhwMUFaN05F?=
 =?utf-8?B?SnhrSnNkdU9UbmxIMmMwOVRTNjdob1cvMXc0aVNRUWo5dHcrRFltT2poMWRV?=
 =?utf-8?B?alhiV2NSOUM4UVpjY2Q3MWxMWWJuc0RPQXVwRUpFNnl2VFJRK1Z3U2pqWWR3?=
 =?utf-8?B?ajMydGgrNnNWeDhldnc5TitsWXZoV25IVVkwK0dFUEpqRzNEcTRJUmYxWlFB?=
 =?utf-8?B?Wk9HeXMwSjdwaU84dVYxb1RDSE9FVFVtQUk1ZXo0VVBoem9YbkVqTzh2d2Ri?=
 =?utf-8?B?cE5ObGxKN0JIeitOeHlmazRQVUZCWEMxSERmTzZXeERyeXZFWkoyWFBjbzFo?=
 =?utf-8?B?cWIxZEhMTGdsdlJTUWN0UnVWcGZnOWZkYkNrem5aT3VUOWIzMTJybTlrUFNT?=
 =?utf-8?B?RkJ4Uk5ncEcvVkQwbEw0MVp5TUNRRDJPUFpRN3RWd0g5V29lc05GYkVPZUNM?=
 =?utf-8?B?QUd3ejROMHFLU1Nydm9Dd0xBTEZNS3BIaFFsQXcyU3B2R2g5QXVYeHdLNDN5?=
 =?utf-8?B?ZGRXNjFCVGRkcEU1aVZVYmJyR3FoOE9uODYxMHQ3WTJtZnFQc2NxSXNWR1ht?=
 =?utf-8?B?NU40MWpCUlljTGR5a2JpVDVDZEx0L2pCZjljWXFvVGpCZUx3eUVSdmhxanpC?=
 =?utf-8?B?UklsMXBGZGdqOWo4VXQydmZ1Sk0zZWpFSUM4TmdxeWtiTTFSQTV5SXZiSzdY?=
 =?utf-8?B?V0J0NXBXYUwwMk81NTlsR2FzZkYzTFAvaUtrWDZmdmxBdE9wamZ3WFRZcFFh?=
 =?utf-8?B?QWlTZTkxazBzaHFSclNoclczUUp1Vm1qbUFPOU45N0grL1JuZ2hxQ0l6MGxS?=
 =?utf-8?B?WnN1MitkNTZDcFFZWTdhcTZYUlNPTFZ2WCtQUkF2VFhvSHZXczJBK3NPRVMz?=
 =?utf-8?B?bCtGcW1TSVViRkZNR1VyMEQ2ME1pNHJrdVNiUHNaazEwZEFKKzRoNFFOekdz?=
 =?utf-8?B?Qm5mUUpPb083WmxwK3Y3dkp4bUtXNVZ6Y0J6TjViNjNJNTJ3azFtRXFBTDB4?=
 =?utf-8?Q?wITaCa5AHM5ZdH5VrX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4933bc20-f976-40e5-a966-08de78462b01
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:26:29.9761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvgAcFxGsm9u4stgkez+bf+OQQC1B/LxadjMNoiayrwX0gksf2tweFeZZHGAHbIe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email,intel.com:email]
X-Rspamd-Queue-Id: 693951D6734
X-Rspamd-Action: no action

On 2/28/26 08:18, Randy Dunlap wrote:
> Use the struct keyword for kernel-doc struct comments.
> Use the correct enum names in enum amd_reset_method.
> 
> This eliminates these warnings:

I was expecting that there would be a few more.

...
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h |   39 ++++++++++++++------------
>  1 file changed, 21 insertions(+), 18 deletions(-)
> 
> --- linux-next-20260227.orig/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ linux-next-20260227/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -462,7 +462,7 @@ int amdgpu_file_to_fpriv(struct file *fi
>  #define AMDGPU_MAX_WB 1024	/* Reserve at most 1024 WB slots for amdgpu-owned rings. */
>  
>  /**
> - * amdgpu_wb - This struct is used for small GPU memory allocation.
> + * struct amdgpu_wb - This struct is used for small GPU memory allocation.
>   *
>   * This struct is used to allocate a small amount of GPU memory that can be
>   * used to shadow certain states into the memory. This is especially useful for
> @@ -540,23 +540,26 @@ struct amdgpu_allowed_register_entry {
>   * enum amd_reset_method - Methods for resetting AMD GPU devices
>   *
>   * @AMD_RESET_METHOD_NONE: The device will not be reset.
> - * @AMD_RESET_LEGACY: Method reserved for SI, CIK and VI ASICs.
> - * @AMD_RESET_MODE0: Reset the entire ASIC. Not currently available for the
> - *                   any device.
> - * @AMD_RESET_MODE1: Resets all IP blocks on the ASIC (SDMA, GFX, VCN, etc.)
> - *                   individually. Suitable only for some discrete GPU, not
> - *                   available for all ASICs.
> - * @AMD_RESET_MODE2: Resets a lesser level of IPs compared to MODE1. Which IPs
> - *                   are reset depends on the ASIC. Notably doesn't reset IPs
> - *                   shared with the CPU on APUs or the memory controllers (so
> - *                   VRAM is not lost). Not available on all ASICs.
> - * @AMD_RESET_LINK: Triggers SW-UP link reset on other GPUs
> - * @AMD_RESET_BACO: BACO (Bus Alive, Chip Off) method powers off and on the card
> - *                  but without powering off the PCI bus. Suitable only for
> - *                  discrete GPUs.
> - * @AMD_RESET_PCI: Does a full bus reset using core Linux subsystem PCI reset
> - *                 and does a secondary bus reset or FLR, depending on what the
> - *                 underlying hardware supports.
> + * @AMD_RESET_METHOD_LEGACY: Method reserved for SI, CIK and VI ASICs.
> + * @AMD_RESET_METHOD_MODE0: Reset the entire ASIC. Not currently available
> + *			    for the any device.
> + * @AMD_RESET_METHOD_MODE1: Resets all IP blocks on the ASIC (SDMA, GFX, VCN,
> + *			    etc.) individually. Suitable only for some discrete
> + *			    GPU, not available for all ASICs.
> + * @AMD_RESET_METHOD_MODE2: Resets a lesser level of IPs compared to MODE1.
> + *			    Which IPs are reset depends on the ASIC. Notably
> + *			    doesn't reset IPs shared with the CPU on APUs or
> + *			    the memory controllers (so VRAM is not lost).
> + *			    Not available on all ASICs.
> + * @AMD_RESET_METHOD_LINK: Triggers SW-UP link reset on other GPUs
> + * @AMD_RESET_METHOD_BACO: BACO (Bus Alive, Chip Off) method powers off and on
> + *			   the card but without powering off the PCI bus.
> + *			   Suitable only for discrete GPUs.
> + * @AMD_RESET_METHOD_PCI: Does a full bus reset using core Linux subsystem
> + *			  PCI reset and does a secondary bus reset or FLR,
> + *			  depending on what the underlying hardware supports.
> + * @AMD_RESET_METHOD_ON_INIT: Does a device reset during the driver init
> + *			  sequence.

Looks like a good idea in general, but I'm really wondering why we have the define in amdgpu.h in the first place.

While at it please move the enum to amdgpu_reset.h and eventually only forward declare it in amdgpu.h

Apart from that the patch looks good to me.

Thanks,
Christian.

>   *
>   * Methods available for AMD GPU driver for resetting the device. Not all
>   * methods are suitable for every device. User can override the method using

