Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF559DA86
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 12:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC6BB2F51;
	Tue, 23 Aug 2022 10:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720DF14ABC9;
 Tue, 23 Aug 2022 10:16:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCTUrKJiHZ2+Y9EGkJSkYOziRQG8p6wSmU203PEFpz0BgDNuYQ7oKfYkXwz5P9gvXwr4UmSNEfsASLvrRiJB9jMwhiHHVa+yKS+TFpgnnF8zKTomIb41RhlUM18caF/ky5HffZSTFM3X8+lkbb+rNHoY+gLUH5RJ3DZRy/1lK9h1tJJtYpNeN5oGKGVR2xGpajbus3/ohM5wTaOSb9ijIVnFx4TYrJOCXeQWy0oyWiFYjvmaB0wOQD2OpL++rkjbxCN/B1K8qnUyKuMPg5y+5PomFtuhSgxN00mrEfJf/9gmHUjOzVKS19dXDtjE0ZGcUoelLCAEZ8w0YnpSLoRp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgh9j51VIKTYA8VCki3fubV4+QGlVBW1NoqVmtktAzg=;
 b=nEIY5ft2Ms1dbhwtCykXBP/oRgYViSWz4kRMh5CaHc5LPcHg+CPZReGeZkVE6YoW1nTD+N8paMAcxMTtmmKEWuk2ogAmF8J2Ji5QjW/GH9Wj7A3EZNMKVimAnbGBSV74XcE/aFjgkHVBntaIOFlvnLjHs7Zu8c0AYdcD2A+1i6jD7FbGbC2ax4POTZG4HN5qGsLqw6y8A6MscokfIig4UK45OwkyVtRI8fZwRpglRIVL8MSFN61mKijrRUnmzlX8omrhk9GWeT95fnOQ6zWqYqMGs4aGf/9N+5vGvuiO4kSb/jVFrRxSn0eCfo41zlmV296E6pfNOZOwOvAhPYUmxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgh9j51VIKTYA8VCki3fubV4+QGlVBW1NoqVmtktAzg=;
 b=PySxqCDC9edDkYRDWI/Cw2S6SPBrKZiSnPtmaCvjwGq1tVi/VvbIvHwvUVllUCob6qc299lKAwktT/UaBFdIa0xStuIOB2bKu1POCVrjam7/Wrb9dJV6olwumAdbydA8eN8yaCqVTJAvLrQFnTE8RaQ6bwf2ep57xMqcw5x4bXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1201.namprd12.prod.outlook.com (2603:10b6:404:20::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 10:15:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 10:15:56 +0000
Message-ID: <945ff305-61a8-b3d1-1712-7243d8001d9b@amd.com>
Date: Tue, 23 Aug 2022 12:15:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/6] amdgpu: Allow explicitly synchronized submissions.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
 <c83f20bd-a753-ddcb-d4f3-fb5348189153@amd.com>
 <CAP+8YyGU1=MRt_ycn4U2npeVdsgLQjfo66jWU4DtODjiAhxQ4w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyGU1=MRt_ycn4U2npeVdsgLQjfo66jWU4DtODjiAhxQ4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f9a9e82-3476-446c-36dc-08da84f077bb
X-MS-TrafficTypeDiagnostic: BN6PR12MB1201:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ch/oijQakya4gOA/0GFxKOUuc+M3ppHaIx6SZqkMbzoKDXhhFixM1EPzz25l0+vOGdbBzDbCxuC38ooqS0WfCnUo7V3JYD6ZNKOGeImI1Kw6/hodvD8faxbAxGolqjsonLb30d+6WhjYZncL+iLx20wQIfGQQhabHrmvEW//ohnJxqgr6wARP0VlgruNeK199C+L/clERH3J03/NpHUw0X9sc8+ZYJGoT9ITHEvEoRK/GXbKEjdEo2A1bAws2lFxQ704YO3mHHdmrVaapDNXjv5WEtdgX8ahd1Cq1wDfQi1rdCsy2q2zR9/n1z4jBzE1KdvfqBYORKQQ5opkjsbB8YpNaxGOsZc5tBM3B/RQ4oMU3IIQ1JcDXHe57abXAls7BpIW4tP1rm+9T/mqpagAmKrHIPFko22g44tgrOTm3xutD0akMFBeKzilLZDDMampF7fHONyTqzJRNAXF854w12D5nQNiDBF3f9VsypStHDe4jlNmJRVxQRLre9H2UvvXupLqOYIi7nKz7b4xz2Wk54xzRbiW1Cgl3asFP/o8OScfNhc8rhnYK7scZPJudiaFuOlFZIzpBkWoytkspwC5tEFU6kzU1Y7EWQtkjzN5Uv4p3jQ9DgPC99J/FnUAwsuE4sKA0lMdCz3L0HI59VoBBUViUh8n1sQZso4C94h9mfkHSn7xb0vuQPhWx9sh4oeBMUed5mKIsXHcyT8CIfGzxAzx0huZ2ZzqaDIaq4w4NCXMMvKmdPI4SaXpPZEKPSnEc2z3VZbc+jTZRwxk6Rg6VUVWuxDDdl0GsgO4tY1eTDpDc+YThMn9qQaEFeSirz3AfU2w+0NWXHk+RYj5Rbaw4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(36756003)(31686004)(5660300002)(2906002)(478600001)(45080400002)(2616005)(6486002)(966005)(83380400001)(8936002)(30864003)(6916009)(86362001)(66574015)(31696002)(186003)(316002)(66556008)(66476007)(66946007)(4326008)(8676002)(38100700002)(6512007)(26005)(6666004)(41300700001)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzNyM0JaanIwVFQ3eEdtMXFOdmxLZDhqSE9RYWtNV2NxWFJ5M0FUdFkwYTky?=
 =?utf-8?B?cGtod2RzaFNLdlA3cHg4dUlVRk8zTkFsRlRMbmJ0UUFxalJLUUlSRzhKaGlS?=
 =?utf-8?B?Z0YxMFZ4cTdWL0NHWGdYdENacW05T3dMME40MGg5MjliZDduVEdhYnBLMjF5?=
 =?utf-8?B?Y0F5TW44aWd5Zm9VMHBCT3Q0MkFrKzNjYWJVMk5DbEZlL3VFNnVuNjA4dXpr?=
 =?utf-8?B?OG1VclF6MFdWOXpHRkR0SEpzaFNmSlZkQUNSNFVxcE1vTHVVWE9yYXpYK3FZ?=
 =?utf-8?B?UFYvMnBRNTdFQU9GSUpLR09nUnVCdUthNVJBK08xS3h4dTlhWEZIN3F6ckUz?=
 =?utf-8?B?S1BiY3QvTDBRamRMdlU0QkdJS1NKZlplNTJOakg5T3ZqeVpvTm5PNEtreEw1?=
 =?utf-8?B?VTY5S1JFTFhGZXN4V05oWWhVcjU2L1RwdjNQUEdTL3Y5SzcvVHFuV0M2T0Z0?=
 =?utf-8?B?MzRZT0wyMm5ZcVhmcUo1NjhteTVwdTd0U3RBMWdkYW9mWG9ZL3kyb1U0UFla?=
 =?utf-8?B?VllhaGVKcldjeDUrRjFNNmJqOGNOaU1KQjhuVWI2WjlXMW9sc3Y3R1RhYlgw?=
 =?utf-8?B?Y1daN2szSUk2T0k1QUpIZXUwa0JIYmxiRFNWWEg2YUVndjdIYkgvRWVNQ24w?=
 =?utf-8?B?UktjY3I4MzltSTlIaWhCTG92MHhLelNUODVQOHljVFVOVkhNNnI0RGlWYkx4?=
 =?utf-8?B?b3pUdXBZZGh3cWc5TU1UdzB6R3lCQkNPbHAxUmJJMjBlalhUTDBva2FVWlFt?=
 =?utf-8?B?SVFRVTh5VEFKT1pSZkNOKzUvdVF1TVQxSG5uZlBrdE16OWx1c24yM21uYVpw?=
 =?utf-8?B?aEh2TWhNVWE0QmlPcTc3bWg1eGNrYndvdTdSQXBwdGpHelVjczNTSVpWaTJ1?=
 =?utf-8?B?RnBLVGhKR3VSaFB2NUg4THByeEFBOUVOaEJmejdJS1V4b1pFVXNsckZSN3ls?=
 =?utf-8?B?eVdoTGpkS1BqNnY3eUdLbWNXam1pbXJqbldhTmxFTEptL0M1S0VLbExRdVdN?=
 =?utf-8?B?SXluVUhjVjJRQXQ3aXhaRWpHSy9KTzcwNk1pYWpRQ0xhMTFIVU9qamV1L3Vo?=
 =?utf-8?B?Y0V0SDVPUUxRMGEya0wyeThyeEFJMmNSRDNyZ0twVGlYaFRzSEVKZ3RhU2dO?=
 =?utf-8?B?NWdPMk9QNU9nYTdxMlJpQUlZNkFTeGo1QU95eTFOU3dzN0JiWW5IeVpUS1hY?=
 =?utf-8?B?MW9YOEdBU3lyK01Nc1BvdEd1ejNSTmVtbk9BK2xSOWVUUFRZN3hwUkhMNzhJ?=
 =?utf-8?B?bUEzTTVxOUlRMXJkcXZlV2oxcndsdlpyTTZzK3pLUkhqMG5MZzR4dE1abm1m?=
 =?utf-8?B?Q2tTRlFkVnFlZ2Ftblc0UXNNS0VNU0ZxeHg0aGxGN3pTclRXc0RodE5vb1pO?=
 =?utf-8?B?WDdGRGR2ZlFXaENOY2tYbUhYODVsY2RpT3QzaHBtcjJMVWx4cHhueFlQOUV0?=
 =?utf-8?B?dGZGSGM3aFRtb25rMXNXeGtFb0kzcys1REMvNEJ5SzlWQ2pnTGZ5SVFoU3Zr?=
 =?utf-8?B?MC90b0VwZHlHS25ucFJWazZXQlkwclJEZmVaWmJ3RDhLdjliMldKL3F1aGVz?=
 =?utf-8?B?RW9ZdGc5Vm1nVHNBM0NwdlFiY2tKUVhudUZ5UklCaExZRXZlTE1qSGtpTFJV?=
 =?utf-8?B?QUtibmZkdmpYd1Raa2ZoWlFLVHdoUUlhT3N2aG9Ua0x3cS8rbit2dHpuZXlM?=
 =?utf-8?B?RWFscEJQMTZhZmZKajY3ZDg1Y3grTHk2eE1mcVVBbnMzcm42U0NKYzJIbXpM?=
 =?utf-8?B?dGJvaXFYQ1JiODZ3Z0lFaXhBTmNQalFqVGF3YWRBSmZCZmlCeTFIeXc1OTlN?=
 =?utf-8?B?MTdkY2xkY3E4RkU3Q2s5aTh0aDhnNDhKdnBMbExWakl6cUxNWjZFSVF6NkZu?=
 =?utf-8?B?MmkzemphbVQvSW9FcXord3NzRFRJVUgwdXc1RWp2MnRIL2p3SUVwQTM2M2la?=
 =?utf-8?B?a1FSa1JOdWEyRGJoQWFwVzdNUHUrbTh0NU1uK2cxd0o4UUZMOEMzU2oxc0Jt?=
 =?utf-8?B?ckZzRlpBbDJMbXBNeUdMcElOSUU2Mk4vRWR0Skxoc3BWVGZoTTYyaDZMbTFz?=
 =?utf-8?B?WDFuU3B2UFczODRWVUdqZnVoaWFXaW5YQzVweDZaV3JNNXNrV1BDOS9SYnE1?=
 =?utf-8?Q?g/HcypOTntYt8xGmATWHw0Odo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9a9e82-3476-446c-36dc-08da84f077bb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 10:15:56.4934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZJR12L5aGeImdovYjyaGpIsQkY5s8cE94Y9KxlmBFiiThTmGGONnTzPgSqTZTw4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1201
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bas,

I've just pushed an updated drm-exec branch to fdo which should now 
include the bo_list bug fix.

Can you please test that with Forza? I'm still fighting getting a new 
kernel on my Steamdeck.

Thanks,
Christian.

Am 22.08.22 um 01:08 schrieb Bas Nieuwenhuizen:
> On Thu, Aug 18, 2022 at 3:20 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Hi Bas,
>>
>> I've just pushed the branch drm-exec to my fdo repository:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fckoenig%2Flinux-drm.git&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Ccc04d790d774485a5cbd08da83ca03f4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637967200920376906%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=8ZaXIdEQZe3oNCQtxoNjuBezB4YmPeDR2cLfXfxraZk%3D&amp;reserved=0
>>
>> This branch contains all the gang submit patches as well as the latest
>> drm-exec stuff. VCN3/4 video decoding has some issues on it, but that
>> probably shouldn't bother your work.
> Hi Christian,
>
> The drm-exec branch doesn't seem to be capable of running Forza
> Horizon 5. First bad commit seems to be
>
> commit 8bb3e919ce0109512f6631422f3fe52169836261
> Author: Christian König <christian.koenig@amd.com>
> Date:   Thu Jul 14 10:23:38 2022 +0200
>
>     drm/amdgpu: revert "partial revert "remove ctx->lock" v2"
>
>     This reverts commit 94f4c4965e5513ba624488f4b601d6b385635aec.
>
>     We found that the bo_list is missing a protection for its list entries.
>     Since that is fixed now this workaround can be removed again.
>
>     Signed-off-by: Christian König <christian.koenig@amd.com>
>
>
> and
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F497679%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Ccc04d790d774485a5cbd08da83ca03f4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637967200920376906%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=0F7jd61YEApKySKpqIgODHM1x0JB83coaHgjzFeVPoU%3D&amp;reserved=0 ("drm/amdgpu: Fix
> use-after-free on amdgpu_bo_list mutex")
>
> seems to fix things at that patch, but I'm not seeing the obvious
> rebase over "drm/amdgpu: cleanup and reorder amdgpu_cs.c" yet (and/or
> whether further issues were introduced).
>
>
> Error logs:
>
> [  124.821691] ------------[ cut here ]------------
> [  124.821696] WARNING: CPU: 3 PID: 2485 at
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:667
> amdgpu_ttm_tt_get_user_pages+0x15c/0x190 [amdgpu]
> [  124.821955] Modules linked in: uinput snd_seq_dummy snd_hrtimer
> snd_seq snd_seq_device ccm algif_aead cbc des_generic libdes ecb md4
> cmac algif_hash algif_skcipher af_alg bnep intel_rapl_msr
> intel_rapl_common snd_soc_acp5x_mach snd_acp5x_i2s snd_acp5x_pcm_dma
> edac_mce_amd kvm_amd kvm rtw88_8822ce rtw88_8822c rtw88_pci irqbypass
> rapl rtw88_core pcspkr joydev mac80211 btusb s
> nd_hda_codec_hdmi btrtl libarc4 snd_hda_intel btbcm btintel
> snd_intel_dspcfg btmtk snd_pci_acp5x i2c_piix4 snd_soc_nau8821
> snd_intel_sdw_acpi snd_rn_pci_acp3x cfg80211 bluetooth snd_soc_core
> snd_hda_codec snd_acp_config snd_soc_acpi snd_pci_acp3x ecdh_generic
> snd_hda_core cdc_acm mousedev snd_compress ecc rfkill snd_hwdep
> ac97_bus snd_pcm_dmaengine ina2xx_adc snd_pcm kfifo_buf
> spi_amd snd_timer opt3001 ina2xx snd industrialio soundcore mac_hid
> acpi_cpufreq fuse ip_tables x_tables overlay ext4 crc16 mbcache jbd2
> mmc_block vfat fat usbhid amdgpu drm_ttm_helper ttm agpgart drm_exec
> gpu_sched i2c_algo_bit
> [  124.822016]  drm_display_helper drm_kms_helper syscopyarea
> sysfillrect sysimgblt fb_sys_fops drm serio_raw atkbd crct10dif_pclmul
> libps2 crc32_pclmul vivaldi_fmap sdhci_pci ghash_clmulni_intel i8042
> ccp cqhci sdhci aesni_intel hid_multitouch xhci_pci crypto_simd cryptd
> wdat_wdt mmc_core cec sp5100_tco rng_core xhci_pci_renesas serio video
> i2c_hid_acpi 8250_dw i2c_hid btrfs
> blake2b_generic libcrc32c crc32c_generic crc32c_intel xor raid6_pq
> dm_mirror dm_region_hash dm_log dm_mod pkcs8_key_parser crypto_user
> [  124.822051] CPU: 3 PID: 2485 Comm: ForzaHorizon5.e Not tainted
> 5.18.0-1-neptune-00172-g067e00b76d9c #23
> [  124.822054] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0105 03/21/2022
> [  124.822055] RIP: 0010:amdgpu_ttm_tt_get_user_pages+0x15c/0x190 [amdgpu]
> [  124.822262] Code: e1 ef c0 48 c7 c7 10 4a 0c c1 e8 5f f7 3e dd eb
> 9c 48 c7 c6 85 0a f6 c0 bf 02 00 00 00 e8 8c 74 e2 ff 41 be f2 ff ff
> ff eb 8b <0f> 0b eb f4 41 be fd ff ff ff e9 7c ff ff ff 48 83 b8 a0 00
> 00 00
> [  124.822264] RSP: 0018:ffffa257827afb98 EFLAGS: 00010282
> [  124.822267] RAX: ffff8b82240e6000 RBX: ffff8b8200a31100 RCX: 0000000000000001
> [  124.822268] RDX: 0000000000000dc0 RSI: ffff8b82240e6000 RDI: ffff8b82a4c7e800
> [  124.822269] RBP: ffff8b82ee809320 R08: 0000000000001000 R09: ffff8b82240e6000
> [  124.822270] R10: 0000000000000006 R11: 0000000000000000 R12: ffff8b82ee6dc9c0
> [  124.822272] R13: 0000000031880000 R14: 0000000000000001 R15: ffff8b823face440
> [  124.822273] FS:  000000002773f640(0000) GS:ffff8b852fec0000(0000)
> knlGS:000000001aba0000
> [  124.822275] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  124.822276] CR2: 0000000003ff4000 CR3: 00000001f1c2e000 CR4: 0000000000350ee0
> [  124.822278] Call Trace:
> [  124.822281]  <TASK>
> [  124.822285]  amdgpu_cs_ioctl+0x9cc/0x2070 [amdgpu]
> [  124.822496]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
> [  124.822701]  drm_ioctl_kernel+0xc5/0x170 [drm]
> [  124.822728]  ? futex_wait+0x18f/0x260
> [  124.822733]  drm_ioctl+0x229/0x400 [drm]
> [  124.822757]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
> [  124.822963]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
> [  124.823165]  __x64_sys_ioctl+0x8c/0xc0
> [  124.823169]  do_syscall_64+0x3a/0x80
> [  124.823174]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  124.823177] RIP: 0033:0x7f5525e1059b
> [  124.823180] Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d
> 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00
> 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a5 a8 0c 00 f7 d8 64 89
> 01 48
> [  124.823182] RSP: 002b:000000002773d548 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  124.823185] RAX: ffffffffffffffda RBX: 000000002773d5d0 RCX: 00007f5525e1059b
> [  124.823186] RDX: 000000002773d5d0 RSI: 00000000c0186444 RDI: 0000000000000021
> [  124.823187] RBP: 00000000c0186444 R08: 00007f54a4043c80 R09: 000000002773d590
> [  124.823188] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f54a4043d50
> [  124.823190] R13: 0000000000000021 R14: 00007f54a4043cb0 R15: 00007f54a4043d20
> [  124.823192]  </TASK>
> [  124.823193] ---[ end trace 0000000000000000 ]---
> [  124.823197] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
> process the buffer list -14!
> [  124.823410] ------------[ cut here ]------------
> [  124.823411] refcount_t: underflow; use-after-free.
> [  124.823418] WARNING: CPU: 3 PID: 2485 at lib/refcount.c:28
> refcount_warn_saturate+0xa6/0xf0
> [  124.823424] Modules linked in: uinput snd_seq_dummy snd_hrtimer
> snd_seq snd_seq_device ccm algif_aead cbc des_generic libdes ecb md4
> cmac algif_hash algif_skcipher af_alg bnep intel_rapl_msr
> intel_rapl_common snd_soc_acp5x_mach snd_acp5x_i2s snd_acp5x_pcm_dma
> edac_mce_amd kvm_amd kvm rtw88_8822ce rtw88_8822c rtw88_pci irqbypass
> rapl rtw88_core pcspkr joydev mac80211 btusb s
> nd_hda_codec_hdmi btrtl libarc4 snd_hda_intel btbcm btintel
> snd_intel_dspcfg btmtk snd_pci_acp5x i2c_piix4 snd_soc_nau8821
> snd_intel_sdw_acpi snd_rn_pci_acp3x cfg80211 bluetooth snd_soc_core
> snd_hda_codec snd_acp_config snd_soc_acpi snd_pci_acp3x ecdh_generic
> snd_hda_core cdc_acm mousedev snd_compress ecc rfkill snd_hwdep
> ac97_bus snd_pcm_dmaengine ina2xx_adc snd_pcm kfifo_buf
> spi_amd snd_timer opt3001 ina2xx snd industrialio soundcore mac_hid
> acpi_cpufreq fuse ip_tables x_tables overlay ext4 crc16 mbcache jbd2
> mmc_block vfat fat usbhid amdgpu drm_ttm_helper ttm agpgart drm_exec
> gpu_sched i2c_algo_bit
> [  124.823485]  drm_display_helper drm_kms_helper syscopyarea
> sysfillrect sysimgblt fb_sys_fops drm serio_raw atkbd crct10dif_pclmul
> libps2 crc32_pclmul vivaldi_fmap sdhci_pci ghash_clmulni_intel i8042
> ccp cqhci sdhci aesni_intel hid_multitouch xhci_pci crypto_simd cryptd
> wdat_wdt mmc_core cec sp5100_tco rng_core xhci_pci_renesas serio video
> i2c_hid_acpi 8250_dw i2c_hid btrfs
> blake2b_generic libcrc32c crc32c_generic crc32c_intel xor raid6_pq
> dm_mirror dm_region_hash dm_log dm_mod pkcs8_key_parser crypto_user
> [  124.823516] CPU: 3 PID: 2485 Comm: ForzaHorizon5.e Tainted: G
>   W         5.18.0-1-neptune-00172-g067e00b76d9c #23
> [  124.823519] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0105 03/21/2022
> [  124.823520] RIP: 0010:refcount_warn_saturate+0xa6/0xf0
> [  124.823523] Code: 05 2d c4 6d 01 01 e8 90 68 58 00 0f 0b c3 80 3d
> 1d c4 6d 01 00 75 95 48 c7 c7 b8 db ba 9e c6 05 0d c4 6d 01 01 e8 71
> 68 58 00 <0f> 0b c3 80 3d fc c3 6d 01 00 0f 85 72 ff ff ff 48 c7 c7 10
> dc ba
> [  124.823524] RSP: 0018:ffffa257827afba8 EFLAGS: 00010286
> [  124.823526] RAX: 0000000000000000 RBX: ffffa257827afc58 RCX: 0000000000000027
> [  124.823527] RDX: ffff8b852fee0768 RSI: 0000000000000001 RDI: ffff8b852fee0760
> [  124.823528] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffa257827af9b8
> [  124.823529] R10: 0000000000000003 R11: ffffffff9f2c5168 R12: 00000000ffffffff
> [  124.823530] R13: 0000000000000018 R14: 0000000000000001 R15: ffff8b823face440
> [  124.823531] FS:  000000002773f640(0000) GS:ffff8b852fec0000(0000)
> knlGS:000000001aba0000
> [  124.823533] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  124.823534] CR2: 0000000003ff4000 CR3: 00000001f1c2e000 CR4: 0000000000350ee0
> [  124.823535] Call Trace:
> [  124.823537]  <TASK>
> [  124.823537]  amdgpu_cs_parser_fini+0x11e/0x160 [amdgpu]
> [  124.823745]  amdgpu_cs_ioctl+0x40a/0x2070 [amdgpu]
> [  124.823954]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
> [  124.824159]  drm_ioctl_kernel+0xc5/0x170 [drm]
> [  124.824185]  ? futex_wait+0x18f/0x260
> [  124.824189]  drm_ioctl+0x229/0x400 [drm]
> [  124.824213]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
> [  124.824444]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
> [  124.824651]  __x64_sys_ioctl+0x8c/0xc0
> [  124.824655]  do_syscall_64+0x3a/0x80
> [  124.824660]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  124.824663] RIP: 0033:0x7f5525e1059b
> [  124.824665] Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d
> 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00
> 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a5 a8 0c 00 f7 d8 64 89
> 01 48
> [  124.824667] RSP: 002b:000000002773d548 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  124.824670] RAX: ffffffffffffffda RBX: 000000002773d5d0 RCX: 00007f5525e1059b
> [  124.824671] RDX: 000000002773d5d0 RSI: 00000000c0186444 RDI: 0000000000000021
> [  124.824673] RBP: 00000000c0186444 R08: 00007f54a4043c80 R09: 000000002773d590
> [  124.824674] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f54a4043d50
> [  124.824675] R13: 0000000000000021 R14: 00007f54a4043cb0 R15: 00007f54a4043d20
> [  124.824677]  </TASK>
> [  124.824678] ---[ end trace 0000000000000000 ]---
>
>
>
>> Please rebase this work on top. It should at least make the TTM changes
>> unnecessary.
>>
>> Going to take a closer look into the VM sync changes now.
>>
>> Regards,
>> Christian.
>>
>> Am 13.08.22 um 03:27 schrieb Bas Nieuwenhuizen:
>>> This adds a context option to use DMA_RESV_USAGE_BOOKKEEP for userspace submissions,
>>> based on Christians TTM work.
>>>
>>> Disabling implicit sync is something we've wanted in radv for a while for resolving
>>> some corner cases. A more immediate thing that would be solved here is avoiding a
>>> bunch of implicit sync on GPU map/unmap operations as well, which helps with stutter
>>> around sparse maps/unmaps.
>>>
>>> This has seen a significant improvement in stutter in Forza Horizon 5 and Forza
>>> Horizon 4. (As games that had significant issues in sparse binding related stutter).
>>> I've been able to pass a full vulkan-cts run on navi21 with this.
>>>
>>> Userspace code for this is available at
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fmesa%2F-%2Fmerge_requests%2F18032&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Ccc04d790d774485a5cbd08da83ca03f4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637967200920533109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=6vpUn1APkYZKO0xA7ixEpJgG7%2B1gHynGv1iO5BPfZe4%3D&amp;reserved=0 and a branch
>>> for the kernel code is available at
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FBNieuwenhuizen%2Flinux%2Ftree%2Fno-implicit-sync-5.19&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Ccc04d790d774485a5cbd08da83ca03f4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637967200920533109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=KV0DTPt35fuduIU4qFroTHGmsZ%2FSD9yWk8F6YjzEu4c%3D&amp;reserved=0
>>>
>>> This is a follow-up on RFC series https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F104578%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Ccc04d790d774485a5cbd08da83ca03f4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637967200920533109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=ymhUQZPFcBhd0qHyt%2BawAwQYx9hUZjviF5T90ks0MEQ%3D&amp;reserved=0 .
>>>
>>> The main changes were:
>>>
>>> 1) Instead of replacing num_shared with usage, I'm just adding usage, since
>>>      num_shared was actually needed.
>>> 2) We now agree that DMA_RESV_USAGE_BOOKKEEP is reasonable for this purpose.
>>>
>>> Please let me know if I missed anything, especially with the change to VM updates,
>>> as we went back and forth a ton of times on that.
>>>
>>>
>>> Bas Nieuwenhuizen (6):
>>>     drm/ttm: Add usage to ttm_validate_buffer.
>>>     drm/amdgpu: Add separate mode for syncing DMA_RESV_USAGE_BOOKKEEP.
>>>     drm/amdgpu: Allow explicit sync for VM ops.
>>>     drm/amdgpu: Refactor amdgpu_vm_get_pd_bo.
>>>     drm/amdgpu: Add option to disable implicit sync for a context.
>>>     drm/amdgpu: Bump amdgpu driver version.
>>>
>>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 16 +++++++---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 20 +++++++++---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  3 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       | 32 +++++++++++++++++--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h       |  1 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  3 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 12 ++++---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  3 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 11 ++++---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  3 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      | 11 +++++--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h      |  4 +--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  1 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |  2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  5 ++-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  3 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    |  3 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  3 +-
>>>    drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  1 +
>>>    drivers/gpu/drm/qxl/qxl_release.c             |  1 +
>>>    drivers/gpu/drm/radeon/radeon_cs.c            |  2 ++
>>>    drivers/gpu/drm/radeon/radeon_gem.c           |  1 +
>>>    drivers/gpu/drm/radeon/radeon_vm.c            |  2 ++
>>>    drivers/gpu/drm/ttm/ttm_execbuf_util.c        |  3 +-
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  7 +++-
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |  1 +
>>>    include/drm/ttm/ttm_execbuf_util.h            |  2 ++
>>>    include/uapi/drm/amdgpu_drm.h                 |  3 ++
>>>    28 files changed, 122 insertions(+), 37 deletions(-)
>>>

