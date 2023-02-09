Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69445690F03
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 18:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835DE10E234;
	Thu,  9 Feb 2023 17:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3481110E0F4;
 Thu,  9 Feb 2023 17:17:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gj0jqogA91oBU2zAmW4tE6Y4wd01XpaUcTGQ0amS6x182olNnyb2I/gAxrhevEm5VsmhXUgB3s1DyD9A2/9fg8t4fOJ4ZdgUq0f6JOZ5CA4mFv0NAborBQsm+4SyTqxT3GD7pqALGDXhxKLijbQlOl5WMFZaHaNa5mYV9KiGY6JD5hyv7JvopWEzeutD1gYs9NCrshLCc2TstQAnlEfzf9EY01HnXP+Pf83uMnBKt09MRkYMXUjm9Q+V98xxxERCo0A7HkIdxzkePp9Ac2wrJkg2WHejiEOFJq05ZxA2xC24yKE6GTRwBbPMn2notReAkUYeAv9qRqkQ0EIoyldnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35yFGk8V93VStG9QEzF+W+nF5wb3+/qcwsxutU5Bsqs=;
 b=g4dNuwOvTvha8kDQwddArfy25aKCMZzbPZ7lHl77pCdEbKTuZSoMu6xwbqzyMSrM9CQMSvUPma7b6Wy0nZ5Ge7Nqi86W67pQhgXKy2gwDFS8IZDGbeJMmf3Fh6Z1Basp8/oFD84ZRS+8sQzKRZR4xrR0UbBNea10tLFwnhen9KHuR+V2187mjPNvwCKrCSlGwyCNqUyd4QcDO6sVHmoYOj9fgfD4fZ2LXv1TneLq/sLHT9ANLraHdjJxKHkjsi0ow7pTsyul1ofStwLUUqc6vEBkm18OOkdvH7SYYdwLL/N/2DpLsDlYxYq0QVA147uSfkeWzBddDXs7X5ZTJvvcoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35yFGk8V93VStG9QEzF+W+nF5wb3+/qcwsxutU5Bsqs=;
 b=FtZvqMqgcTSP5G/GIxkR4feKJWvRpiEinJU29rBpEAoUa4dIXCJN2fZa4mkGqMNaeBs0jWiWC16B15/f91b8+Jcmpef0VFCzScYPxbEpKNne5s7Zw5IzlkqBoCVjcJ8EYLYQ+YDo+rshh4tjKLop+ptWFHDJ7I6JQ3gva/gt1YM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17; Thu, 9 Feb 2023 17:17:16 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::5111:39f5:5a04:b088]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::5111:39f5:5a04:b088%9]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 17:17:16 +0000
Message-ID: <c91340d4-7065-cdcb-18cf-a3adbf757e79@amd.com>
Date: Thu, 9 Feb 2023 12:17:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [regression][6.0] After commit
 b261509952bc19d1012cf732f853659be6ebc61e I see WARNING message at
 drivers/gpu/drm/drm_modeset_lock.c:276 drm_modeset_drop_locks+0x63/0x70
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Bhawanpreet.Lakha@amd.com, wayne.lin@amd.com, daniel.wheeler@amd.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Harry Wentland <harry.wentland@amd.com>, Harry Wentland <hwentlan@amd.com>
References: <CABXGCsNFRQ9A1Vx6_qsP7NqedhG7QScOG4-Eupvz3etgykJt=Q@mail.gmail.com>
 <CABXGCsM5mz-FgMPteziwDVrfFG51pMJXxKk9W9TSE+Mao4_6qg@mail.gmail.com>
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <CABXGCsM5mz-FgMPteziwDVrfFG51pMJXxKk9W9TSE+Mao4_6qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0089.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::26) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|PH7PR12MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 7586103a-11e5-41a4-c628-08db0ac17e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4oCjMZ91CRt09FJKJIb8IzB1JoAOF9ethbAlOew/d2/RZA+A3bJsP6Bel8mVSLD19Yq5U77O7ob25cfgydBRFCoBIVaeDlcqmfehmCWxVmw7o7WqOFLDzDMvk2NgWEsDvZWOm6p39WTNUuUU56WdNJtmn8nqNYKFMLA5jXUSD1ye0EOCN1pd3pfVTvkyuCR/P0KL8yEeP1FO4qg3FZ499y8fKOVe+fQEEWcFnSC9FeZXi+rMD3f/Ns9vIWlkPSk9NAn4COv65C9RuaU/6v5XnDXB0gFSNL6SS/jAC3E/vJDoSnQqi+6qmyF2avXIst1I8XSVW5AG+B+6ngiGQLf78SpBcAiUSO1Gvhvl25jFQCEBoBoK4b5dbBrMfWCgDClv+7BfTT3nPdvZTNzS04kdHu6y8DgPKqDl1FYoZ9M+2cwLFKdho+tuVonb5vj7ellUGKOBgYKaiG5ymdLlc01pxy8e6zYsCZOKOweDrgSl1L37F4iruUfCuux/nTsV6O1pKI+vCRZ8tSrKhmQIRgBkKIL77j5Xw/vweZ2EeslHIbEPpM8rmYP5/sc+IlQ0qOU7x4k00jpqArQsJ6QvwDf8FUSZqUHz+1dll2ixfnR4nPN3UaDOHwKr3FRwgFGNqsfs0byhqTsAq3aDxfB1+bbyxS0xBXk183TUcegquppe5YPa/EvrmOApYiVJtfTCFWiWgTKqUBQNbRntfrLJzOVSjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199018)(921005)(36756003)(316002)(86362001)(31696002)(110136005)(66556008)(6636002)(2616005)(66946007)(478600001)(8676002)(66476007)(83380400001)(6486002)(966005)(45080400002)(31686004)(15650500001)(2906002)(38100700002)(53546011)(6506007)(41300700001)(26005)(5660300002)(8936002)(6512007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em1KZG03Y2FYL1RKRGJwZGRiRzFPL1JPeWF5MG1FQWhDV0RWeFlLb2pRUmJ3?=
 =?utf-8?B?azJ0RFlvSGVhUHE1ZmxBYUdHSnRJSXRzS0dTWmF5WlYrellrcUlrdk9hSVdi?=
 =?utf-8?B?dmpkcFkrZjR5cnh5N0tvclA5Rlp4UWF2QTBjdVdrdDd5aElwRElwTFVXcDVQ?=
 =?utf-8?B?bG5XQlk5bDdoMm8vSXlReEZCVWFTTzYxeDVLMFBRMnZ2VXVmL2hhOVIzdVZZ?=
 =?utf-8?B?YzdLeDJ2MDN4MTJWWTA2T3huMVZLN2JsQWlMWUxXTi90NTRkNjVGUjVuZVJu?=
 =?utf-8?B?bW52ZXQrTEZNcUdDZ1lJcllUV0x4cC8vNnM0UUNNVnh6cnA5cEtEOXBBZ2JL?=
 =?utf-8?B?M3NZY0lIbVdyMG92d0ZEY0xJUitxR1BnSjdlRDk5ZlVQOWRpVm1ZZE5QRTNw?=
 =?utf-8?B?S0lGUGIyWXRBK2d5eU5NeGo3cjZrRFNuRzQveVZabVFsZHZ1VFY2QTRxRmhB?=
 =?utf-8?B?SERRUWJEeVJvMmlUQzVweGxOZ0Rka3dzTTBwWXlJUUZoUEZRQjlCM0QxdEd5?=
 =?utf-8?B?ZmoycmgzQk81bnJxMVRpQVVLcE5NaUg4TVJKZmxKQTMxbmVhNjZPWnV1NXFC?=
 =?utf-8?B?NiswckRUY0hlS2JyUGo4M2t4MXUrOFBNLzUyV0hDNG5xR01LTHZVenljTzlC?=
 =?utf-8?B?a3pmVWVRSmVxTlJwZmRUcmVFZnBndWFzTUx2TTNaMXhxNldIQWtnZ1U4Umwy?=
 =?utf-8?B?b2lIRkYwK3ZNNTBpV2I3WFNmZ2ZwQVAyMW13bmh5SW5sY1c5UkNaUjdQdzdO?=
 =?utf-8?B?MXBNN2FPS2tZN1dVamZkUGtWU2dCKzFPVmJOd0dzU2FyREROUldaa29aT0tx?=
 =?utf-8?B?ejJXZDdPVGdTSkVDWHVNQjdCTVVsbE9RNkswcG1NdW9SUUdjVlNHamUrVDFq?=
 =?utf-8?B?K3NOZmo4VThlbEJjdHNHcVpnc1dOdTl1aWNrTVVyRGFzbkdsMWpucDJGcW5v?=
 =?utf-8?B?UWlCWEY4OFhCRUdPVjhuMmE5SVRtc2huU1BPYk9SZ3J0d29URFptcUlQd1BZ?=
 =?utf-8?B?V3dJV2Y2V2pRZW51NkRoQmVRb1E2L3RvV00vd1FCZ2ZPeFJpb0xNRnVwd2Zn?=
 =?utf-8?B?QTAvb3pIb2pEd0xab2VyWmRFZG9mTkYrWWNXTXJGZ3VMN3Y1MFExeFhRNkdR?=
 =?utf-8?B?eWQrVW9Ub0VLN0FTcy8rOGNKQlA3QzZIUTA2ejdFSHZJNjg5S09mTnVDVWoy?=
 =?utf-8?B?eHI2YkZxVjZaS2g4K1N6WG5sYkk0bFlRaEhWKzdXdlBsTzYybzRlZHJ2RXBQ?=
 =?utf-8?B?OG41ZWVjbkVPeGwzV0FTZ3ltQ3dJNk0wMGlCekhxWDlFVmdWNlBEUzhoSlV0?=
 =?utf-8?B?ZDlNaE9wdFExL0JHamRLeTBRN0psWUc3bEJPMG9iaHZwSFI5bE90SVhrYUVm?=
 =?utf-8?B?VldEbFhXUTlPaFR0UTNaNU5uVlltaDg3QUtPT1luNksrY2hXVnJCVzI3Nysz?=
 =?utf-8?B?YllFWEdTcUFOWWNhUHdiWDkzQm9RRGkrVzQ1aktXWDZpT25WRXBSNjZXRk1E?=
 =?utf-8?B?NGZackZHZTdCQ2NLM2FTclFxMm5QUjhaTzlMenZzWXZvY0MyYUR5N0VZbktI?=
 =?utf-8?B?RkRwUXFBbENXY0M3aUtwS1JJcDhPTmFkUGc4UmdwUFlDRXgwU2ZhZDNzN2E5?=
 =?utf-8?B?SUMwV3RoZ3NuT2RqQW50UVJVT2pLeklmMWFBeGoyc0Y3Q0ZwTnZrR0dSRmh5?=
 =?utf-8?B?dDJMRG5MQnBhN3Y1L0RIQnZwMHE4cXJlWWxWNCtQZUhVMkM5Q0FabUtqb2NC?=
 =?utf-8?B?YlJROHd6cGptZzlYekJyb2piekRPRVQ2bWFESG9UZ0JZTndha2pIcnV6KzJq?=
 =?utf-8?B?elRyNmJ1dHEyaUNiTHRiRnc2UzBwOHViRnZOK08wRkRDMStTUVNSUHkzeFZU?=
 =?utf-8?B?S21vbGtJK2RpR2tCdjJBWXZEM0tLb3Rva2MwRmptL2VVUk5OUFY0cGg4MmN0?=
 =?utf-8?B?WWdNVUxUdXpHeTczdzJRMjdBNmFwbVdjWXpmMUJYak5RTXJ3ZzZHSEo4QXBY?=
 =?utf-8?B?c2ZYVjBNcmVtMVVSMmE0Ump4NTRrRlRURkE4NzNqcHl0T0FaM1R2d2M0Tmlu?=
 =?utf-8?B?Q2NMZ0lxbHpVaUpNbXZKMCtmVTJmdEhVVFc5TDVQdmRUdTdIRjd1aktUMzVI?=
 =?utf-8?Q?kb5kDshcKH/i6rUG7IH4FpEs3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7586103a-11e5-41a4-c628-08db0ac17e06
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 17:17:16.4739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbGh1GtCZMDMC3U6EoLArzc75jSE+tYAJJAeClQXBzpdV0wtdZBn70uhvHK+unU5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308
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

Hi Mikhail, seems like your report flew past me, thanks for the ping.

This might be a simple issue of not backing off when deadlock was hit.
drm_atomic_normalize_zpos() can return an error code, and I ignored it
(oops!)

Can you give this patch a try?
https://gitlab.freedesktop.org/-/snippets/7414

- Leo

On 2/9/23 04:27, Mikhail Gavrilov wrote:
> Harry, please don't ignore me.
> This issue still happens in 6.1 and 6.2
> Leo you are the author of the problematic commit please don't stand aside.
> Really nobody is interested in clean logs without warnings and errors?
> I am 100% sure that reverting commit
> b261509952bc19d1012cf732f853659be6ebc61e will stop these warnings. I
> also attached fresh logs from 6.2.0-0.rc6.
> 6.2-rc7 I started to build without commit
> b261509952bc19d1012cf732f853659be6ebc61e to avoid these warnings.
> 
> 
> On Thu, Oct 13, 2022 at 6:36 PM Mikhail Gavrilov
>>
>> Hi!
>> I bisected an issue of the 6.0 kernel which started happening after
>> 6.0-rc7 on all my machines.
>>
>> Backtrace of this issue looks like as:
>>
>> [ 2807.339439] ------------[ cut here ]------------
>> [ 2807.339445] WARNING: CPU: 11 PID: 2061 at
>> drivers/gpu/drm/drm_modeset_lock.c:276
>> drm_modeset_drop_locks+0x63/0x70
>> [ 2807.339453] Modules linked in: tls uinput rfcomm snd_seq_dummy
>> snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
>> nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
>> nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
>> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
>> qrtr bnep intel_rapl_msr intel_rapl_common snd_sof_amd_renoir
>> snd_sof_amd_acp snd_sof_pci snd_hda_codec_realtek sunrpc snd_sof
>> snd_hda_codec_hdmi snd_hda_codec_generic snd_sof_utils snd_hda_intel
>> snd_intel_dspcfg mt7921e snd_intel_sdw_acpi binfmt_misc snd_soc_core
>> mt7921_common snd_hda_codec snd_compress vfat ac97_bus edac_mce_amd
>> mt76_connac_lib snd_pcm_dmaengine fat snd_hda_core snd_rpl_pci_acp6x
>> snd_pci_acp6x mt76 btusb snd_hwdep kvm_amd btrtl snd_seq btbcm
>> mac80211 snd_seq_device kvm btintel btmtk libarc4 snd_pcm
>> snd_pci_acp5x bluetooth snd_timer snd_rn_pci_acp3x irqbypass
>> snd_acp_config snd_soc_acpi cfg80211 rapl snd joydev pcspkr
>> asus_nb_wmi wmi_bmof
>> [ 2807.339519]  snd_pci_acp3x soundcore i2c_piix4 k10temp amd_pmc
>> asus_wireless zram amdgpu drm_ttm_helper ttm hid_asus asus_wmi
>> crct10dif_pclmul iommu_v2 crc32_pclmul ledtrig_audio crc32c_intel
>> gpu_sched sparse_keymap platform_profile hid_multitouch
>> polyval_clmulni nvme ucsi_acpi drm_buddy polyval_generic
>> drm_display_helper ghash_clmulni_intel serio_raw nvme_core ccp
>> typec_ucsi rfkill sp5100_tco r8169 cec nvme_common typec wmi video
>> i2c_hid_acpi i2c_hid ip6_tables ip_tables fuse
>> [ 2807.339540] Unloaded tainted modules: acpi_cpufreq():1
>> acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1
>> acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1
>> amd64_edac():1 acpi_cpufreq():1 acpi_cpufreq():1 amd64_edac():1
>> amd64_edac():1 acpi_cpufreq():1 pcc_cpufreq():1 fjes():1
>> amd64_edac():1 acpi_cpufreq():1 amd64_edac():1 acpi_cpufreq():1
>> fjes():1 pcc_cpufreq():1 amd64_edac():1 acpi_cpufreq():1 fjes():1
>> amd64_edac():1 acpi_cpufreq():1 pcc_cpufreq():1 amd64_edac():1
>> fjes():1 acpi_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1
>> amd64_edac():1 fjes():1 acpi_cpufreq():1 amd64_edac():1
>> pcc_cpufreq():1 acpi_cpufreq():1 fjes():1 amd64_edac():1
>> pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 acpi_cpufreq():1
>> fjes():1 pcc_cpufreq():1 amd64_edac():1 acpi_cpufreq():1
>> acpi_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 fjes():1
>> acpi_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
>> acpi_cpufreq():1 fjes():1 pcc_cpufreq():1 acpi_cpufreq():1
>> pcc_cpufreq():1 fjes():1
>> [ 2807.339579]  acpi_cpufreq():1 fjes():1 pcc_cpufreq():1
>> acpi_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 fjes():1
>> acpi_cpufreq():1 pcc_cpufreq():1 fjes():1 pcc_cpufreq():1
>> acpi_cpufreq():1 fjes():1 acpi_cpufreq():1 fjes():1 fjes():1 fjes():1
>> fjes():1 fjes():1 fjes():1 fjes():1 fjes():1 fjes():1 fjes():1
>> fjes():1 fjes():1 fjes():1 fjes():1
>> [ 2807.339596] CPU: 11 PID: 2061 Comm: gnome-shell Tainted: G        W
>>     L     6.0.0-rc4-07-cb0eca01ad9756e853efec3301203c2b5b45aa9f+ #16
>> [ 2807.339598] Hardware name: ASUSTeK COMPUTER INC. ROG Strix
>> G513QY_G513QY/G513QY, BIOS G513QY.318 03/29/2022
>> [ 2807.339600] RIP: 0010:drm_modeset_drop_locks+0x63/0x70
>> [ 2807.339602] Code: 42 08 48 89 10 48 89 1b 48 8d bb 50 ff ff ff 48
>> 89 5b 08 e8 3f 41 55 00 48 8b 45 78 49 39 c4 75 c6 5b 5d 41 5c c3 cc
>> cc cc cc <0f> 0b eb ac 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 55
>> 41 54
>> [ 2807.339604] RSP: 0018:ffffb6ad46e07b80 EFLAGS: 00010282
>> [ 2807.339606] RAX: 0000000000000001 RBX: 0000000000000000 RCX: 0000000000000002
>> [ 2807.339607] RDX: 0000000000000001 RSI: ffffffffa6a118b1 RDI: ffffb6ad46e07c00
>> [ 2807.339608] RBP: ffffb6ad46e07c00 R08: 0000000000000000 R09: 0000000000000000
>> [ 2807.339609] R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
>> [ 2807.339610] R13: ffff9801ca24bb00 R14: ffff9801ca24bb00 R15: 0000000000000000
>> [ 2807.339611] FS:  00007f57445b0600(0000) GS:ffff981198e00000(0000)
>> knlGS:0000000000000000
>> [ 2807.339613] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [ 2807.339614] CR2: 00007f574367f000 CR3: 00000001236ae000 CR4: 0000000000750ee0
>> [ 2807.339615] PKRU: 55555554
>> [ 2807.339616] Call Trace:
>> [ 2807.339618]  <TASK>
>> [ 2807.339621]  drm_mode_atomic_ioctl+0x3b9/0xac0
>> [ 2807.339627]  ? drm_atomic_set_property+0xb60/0xb60
>> [ 2807.339629]  drm_ioctl_kernel+0xac/0x160
>> [ 2807.339633]  drm_ioctl+0x22d/0x410
>> [ 2807.339635]  ? drm_atomic_set_property+0xb60/0xb60
>> [ 2807.339639]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
>> [ 2807.339834]  __x64_sys_ioctl+0x90/0xd0
>> [ 2807.339838]  do_syscall_64+0x5b/0x80
>> [ 2807.339843]  ? rcu_read_lock_sched_held+0x10/0x80
>> [ 2807.339846]  ? trace_hardirqs_on_prepare+0x55/0xe0
>> [ 2807.339849]  ? do_syscall_64+0x67/0x80
>> [ 2807.339851]  ? rcu_read_lock_sched_held+0x10/0x80
>> [ 2807.339853]  ? trace_hardirqs_on_prepare+0x55/0xe0
>> [ 2807.339855]  ? do_syscall_64+0x67/0x80
>> [ 2807.339857]  ? do_syscall_64+0x67/0x80
>> [ 2807.339859]  ? rcu_read_lock_sched_held+0x10/0x80
>> [ 2807.339861]  ? trace_hardirqs_on_prepare+0x55/0xe0
>> [ 2807.339863]  ? do_syscall_64+0x67/0x80
>> [ 2807.339864]  ? do_syscall_64+0x67/0x80
>> [ 2807.339867]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>> [ 2807.339870] RIP: 0033:0x7f5749e8d04f
>> [ 2807.339873] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24
>> 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00
>> 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28
>> 00 00
>> [ 2807.339875] RSP: 002b:00007ffecf4c6460 EFLAGS: 00000246 ORIG_RAX:
>> 0000000000000010
>> [ 2807.339877] RAX: ffffffffffffffda RBX: 000055c222fb32f0 RCX: 00007f5749e8d04f
>> [ 2807.339878] RDX: 00007ffecf4c6500 RSI: 00000000c03864bc RDI: 000000000000000e
>> [ 2807.339880] RBP: 00007ffecf4c6500 R08: 0000000000000000 R09: 0000000000000000
>> [ 2807.339881] R10: 000055c21e4b9010 R11: 0000000000000246 R12: 00000000c03864bc
>> [ 2807.339882] R13: 000000000000000e R14: 000055c222e317e0 R15: 000055c21f0a4080
>> [ 2807.339887]  </TASK>
>> [ 2807.339889] irq event stamp: 171599
>> [ 2807.339890] hardirqs last  enabled at (171599):
>> [<ffffffffa7000b62>] asm_exc_page_fault+0x22/0x30
>> [ 2807.339893] hardirqs last disabled at (171598):
>> [<ffffffffa6f3bd81>] exc_page_fault+0x121/0x2b0
>> [ 2807.339896] softirqs last  enabled at (171482):
>> [<ffffffffa60ffe4d>] __irq_exit_rcu+0xed/0x160
>> [ 2807.339900] softirqs last disabled at (171371):
>> [<ffffffffa60ffe4d>] __irq_exit_rcu+0xed/0x160
>> [ 2807.339903] ---[ end trace 0000000000000000 ]---
>>
>> bisect points to this commit: b261509952bc19d1012cf732f853659be6ebc61e.
>>
>> b261509952bc19d1012cf732f853659be6ebc61e is the first bad commit
>> commit b261509952bc19d1012cf732f853659be6ebc61e
>> Author: Leo Li <sunpeng.li@amd.com>
>> Date:   Tue Aug 30 16:38:16 2022 -0400
>>
>>      drm/amd/display: Fix double cursor on non-video RGB MPO
>>
>>      [Why]
>>
>>      DC makes use of layer_index (zpos) when picking the HW plane to enable
>>      HW cursor on. However, some compositors will not attach zpos information
>>      to each DRM plane. Consequently, in amdgpu, we default layer_index to 0
>>      and do not update it.
>>
>>      This causes said DC logic to enable HW cursor on all planes of the same
>>      layer_index, which manifests as a double cursor issue if one of the
>>      planes is scaled (and hence scaling the cursor as well).
>>
>>      [How]
>>
>>      Use DRM core helpers to calculate a normalized_zpos value for each
>>      drm_plane_state under each crtc, within the atomic state.
>>
>>      This helper will first consider existing zpos values, and if
>>      identical/unset, fallback to plane ID ordering.
>>
>>      The normalized_zpos is then passed to dc_plane_info during atomic check
>>      for later use by the cursor logic.
>>
>>      Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>>      Acked-by: Wayne Lin <wayne.lin@amd.com>
>>      Signed-off-by: Leo Li <sunpeng.li@amd.com>
>>      Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
>>      Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> After reverting this commit the WARNING messages described here disappeared.
>>
>> Thanks.
>>
>> --
>> Best Regards,
>> Mike Gavrilov.
> 
> 
> 
