Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900F9140DCD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 16:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3E86F5EA;
	Fri, 17 Jan 2020 15:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F0F6F5EA;
 Fri, 17 Jan 2020 15:26:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WocVT3kFYKyC3gSqOTZzni7JjaIl6Q/hvb0ocUfW6VlOHmpycHkhmwP8OfBu2VnM6ZANcGbOwrJonBu1zGj1pTBhMWvR5tNybiV9GNb9Fz1ixXYesgEAUH58yCqxILT1HuoDCRi7+YF/1qZENHaW2H5RF/ltiBySZFUdCoH9E/3NrJjAMsyMtGAUai04aI+3oOUyQjGpfzOrRAeNnYe0K6ZApB1xIuuymvNxyMFH3P7VKyFBMqHS8NgbX2rkuI+0JeuqYdFp2Lr02NffooD3CZ2V6LRgmHym4KaH8AqJxH5ECHsbH+alyaciu3Oye0UCZTI9pdRjicGJUpkI2WXu1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKlgVhoTFc+eSNJHaO3jDZWlLqZ7IeegeyqxWVaGW78=;
 b=Gi1970YZveUKRjdqUu6rPmWOGWvLIE0b7+bjQAiuN4z5LmgRvM5dTSEERfOs7twCnIziMTxOIJMmC5LAZ+FigeLZ9cwQicGCRP2L0ZLmUYuJ8heEOY0/rgMCVHZdXmbhf436HwFevKQb+6HT3oSNEroVcBRwj86KK8y7CPib8q3k6RjPWe2ERP2x/XY5rN/ALZtcmcRPt3aFHo2fv0QaRR1bWfYrpmdWjPuaMtT0myiTUXAgvW2f9uw30J2MEZ98vPFk6V1oMvtma5iAI513z24tHMUYmVZcu/KbcgjEaLLLeHn59vvPasgpkyy/Kttpw4MMM8A5qZhG9YpMTSstOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKlgVhoTFc+eSNJHaO3jDZWlLqZ7IeegeyqxWVaGW78=;
 b=ohigxeg7iVhh43iEJHXCOGwp4atlFB4HbNxtfiNQZi7FL2w3bbZaZwlqxHiYqVrTACCaa9OZ5cfev04I8gk/uHI6EzSByu3Yi8W0QMor6p5Fz/JARQ/uDrkl6+vTYGDhINaNmO2ZUyR8Ge9s+mWK+crAfQ8Msk1WUbm2ZEx5ih0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
Received: from DM6PR12MB2906.namprd12.prod.outlook.com (20.179.71.212) by
 DM6PR12MB3642.namprd12.prod.outlook.com (20.178.31.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Fri, 17 Jan 2020 15:26:56 +0000
Received: from DM6PR12MB2906.namprd12.prod.outlook.com
 ([fe80::c4f1:5ec7:7314:75bf]) by DM6PR12MB2906.namprd12.prod.outlook.com
 ([fe80::c4f1:5ec7:7314:75bf%7]) with mapi id 15.20.2644.023; Fri, 17 Jan 2020
 15:26:56 +0000
Subject: Re: [PATCH v9 12/18] drm/dp_mst: Add branch bandwidth validation to
 MST atomic check
To: Sean Paul <sean@poorly.run>, Mikita Lipski <mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
 <20191213200854.31545-13-mikita.lipski@amd.com>
 <CAMavQKLvtGg_XiLhDwuiVSR7829PK1mWCx8aLx8EVxf2WOakqg@mail.gmail.com>
From: Mikita Lipski <mlipski@amd.com>
Organization: AMD
Message-ID: <cb14a9b2-0252-982a-6f83-139d710c0181@amd.com>
Date: Fri, 17 Jan 2020 10:26:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <CAMavQKLvtGg_XiLhDwuiVSR7829PK1mWCx8aLx8EVxf2WOakqg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::19) To DM6PR12MB2906.namprd12.prod.outlook.com
 (2603:10b6:5:15f::20)
MIME-Version: 1.0
Received: from [172.29.224.72] (165.204.55.250) by
 YTXPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18 via Frontend Transport; Fri, 17 Jan 2020 15:26:55 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fb2fe152-03f7-4e74-7bfc-08d79b61afd1
X-MS-TrafficTypeDiagnostic: DM6PR12MB3642:|DM6PR12MB3642:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3642CE7B1C05931EE64522CAE4310@DM6PR12MB3642.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:111;
X-Forefront-PRVS: 0285201563
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39850400004)(396003)(136003)(376002)(366004)(199004)(189003)(53546011)(316002)(5660300002)(26005)(6486002)(36756003)(36916002)(8936002)(6636002)(4326008)(110136005)(16576012)(52116002)(66946007)(66476007)(66556008)(2616005)(81156014)(956004)(2906002)(8676002)(31686004)(966005)(31696002)(186003)(30864003)(45080400002)(478600001)(16526019)(81166006)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3642;
 H:DM6PR12MB2906.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rlG2uYGQIX96nVxwLcK0qVGlDgBSCxNFf6y7zLr3z/BCnGGiA+11Pj7QlTKWoGSNhdMffhzCn6WQdK+GaFMJPl5YEu6kUeTsnzlnvQk4vsHtKjMxhAkih7s8TxFZoxNlgNhL+bS6+NuW8j0APYV5LaplccXxhj5318lH2ybLKdXrhHeUXfTrF4yNrC/Urs/vCRhhGztll9krMbrcu2LcsTjzsu/okXrQD1JqYWtos3SAS6dKW91ejoMprBVk7sZ9GMnGW+FKHprbWnN9HmG4AL3+WFPOOsxii9TWBmMX7NnNhEiJZAEBMwx6mR4BVf5kHdTUTV3Y0Ag/+IDBVPtfPmlkLf63IMO/HsrRJmwfFVFpGtfFQt1n4HYgAWrB++X0EzhNPaaWFQyNDgdmvp/S/VxOXLgnhObRWTO2xaYLscNQiJlLGfT5kQxB5NxvjXj1y1IzT8XOHWlzu/CBo8UtbH1Fd4bQnLu9cLUJ895Il7Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2fe152-03f7-4e74-7bfc-08d79b61afd1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2020 15:26:56.2008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txWLocfB2pXwfavViG0KwKil8F/7NO3s7fcgjQtIHMPkGLcMHOFsDcETymjmPoxN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3642
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/17/20 10:09 AM, Sean Paul wrote:
> On Fri, Dec 13, 2019 at 3:09 PM <mikita.lipski@amd.com> wrote:
>>
>> From: Mikita Lipski <mikita.lipski@amd.com>
>>
> 
> Hi Mikita,
> Unfortunately this patch causes a crash on my i915 device when I
> unplug my MST hub. The panic is below.

Hi Sean,

I thought this issue was fixed by Wayne Lin in 
https://patchwork.freedesktop.org/patch/346736/?series=71388&rev=1
but now I checked it seems it never got pushed. I will resend Wayne's 
patch once again.

Thanks
Mikita
> 
> [   38.514014] BUG: kernel NULL pointer dereference, address: 0000000000000030
> [   38.521801] #PF: supervisor read access in kernel mode
> [   38.527556] #PF: error_code(0x0000) - not-present page
> [   38.533299] PGD 0 P4D 0
> [   38.536127] Oops: 0000 [#1] PREEMPT SMP PTI
> [   38.540798] CPU: 1 PID: 1324 Comm: DrmThread Not tainted
> 5.5.0-rc6-02273-g9bb4096398e7 #36
> [   38.550040] Hardware name: Google Fizz/Fizz, BIOS
> Google_Fizz.10139.39.0 01/04/2018
> [   38.558606] RIP: 0010:drm_dp_mst_atomic_check_bw_limit+0x11/0x102
> [   38.565418] Code: 05 ff cb bf 19 48 f7 f6 c3 0f 1f 44 00 00 55 b8
> 0b 80 ff 0f 48 89 e5 5d c3 55 48 89 e5 41 57 41 56 41 55 41 54 4c 8d
> 77 30 53 <48> 8b 47 30 49 89 fd 49 89 f7 45 31 e4 48 8d 58 e8 48 8d 53
> 18 4c
> [   38.586422] RSP: 0018:ffffc9000139f9d8 EFLAGS: 00010282
> [   38.592264] RAX: 0000000000000000 RBX: ffff888272aeac88 RCX: ffff888236f529e0
> [   38.600242] RDX: ffff888272aeac88 RSI: ffff888236f529e0 RDI: 0000000000000000
> [   38.608220] RBP: ffffc9000139fa00 R08: 0000000000000031 R09: 000000000000000e
> [   38.616198] R10: ffff888236f529e8 R11: ffff8882621f3440 R12: 0000000000000000
> [   38.624176] R13: ffff888236f529d0 R14: 0000000000000030 R15: ffff888236f529e0
> [   38.632153] FS:  00007cd9229ce700(0000) GS:ffff888276c80000(0000)
> knlGS:0000000000000000
> [   38.641193] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   38.647616] CR2: 0000000000000030 CR3: 00000002618e8004 CR4: 00000000003606e0
> [   38.655593] Call Trace:
> [   38.658329]  drm_dp_mst_atomic_check+0x152/0x16d
> [   38.663484]  intel_atomic_check+0xcfe/0x1e6f
> [   38.668259]  ? trace_hardirqs_on+0x28/0x3d
> [   38.672835]  ? intel_pipe_config_compare+0x1b38/0x1b38
> [   38.678580]  drm_atomic_check_only+0x5ab/0x70f
> [   38.683547]  ? drm_atomic_set_crtc_for_connector+0xf5/0x102
> [   38.689778]  ? drm_atomic_helper_shutdown+0xb6/0xb6
> [   38.695221]  drm_atomic_commit+0x18/0x53
> [   38.699604]  drm_atomic_helper_set_config+0x5a/0x70
> [   38.705057]  drm_mode_setcrtc+0x2ab/0x833
> [   38.709537]  ? rcu_read_unlock+0x57/0x57
> [   38.713920]  ? drm_mode_getcrtc+0x173/0x173
> [   38.718594]  drm_ioctl+0x2e5/0x424
> [   38.722392]  ? drm_mode_getcrtc+0x173/0x173
> [   38.727069]  vfs_ioctl+0x21/0x2f
> [   38.730675]  do_vfs_ioctl+0x5fb/0x61e
> [   38.734766]  ksys_ioctl+0x55/0x75
> [   38.738469]  __x64_sys_ioctl+0x1a/0x1e
> [   38.742659]  do_syscall_64+0x5c/0x6d
> [   38.746653]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [   38.752298] RIP: 0033:0x7cd92552d497
> [   38.756291] Code: 8a 66 90 48 8b 05 d1 d9 2b 00 64 c7 00 26 00 00
> 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00
> 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a1 d9 2b 00 f7 d8 64 89
> 01 48
> [   38.777296] RSP: 002b:00007cd9229cd698 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [   38.785762] RAX: ffffffffffffffda RBX: 000020323373da80 RCX: 00007cd92552d497
> [   38.793740] RDX: 00007cd9229cd6d0 RSI: 00000000c06864a2 RDI: 000000000000001c
> [   38.801717] RBP: 00007cd9229cd6c0 R08: 0000000000000000 R09: 0000000000000000
> [   38.809693] R10: 0000000000000000 R11: 0000000000000246 R12: 000000000000001c
> [   38.817670] R13: 0000000000000000 R14: 00007cd9229cd6d0 R15: 00000000c06864a2
> [   38.825642] Modules linked in: xt_nat cdc_ether r8152 bridge stp
> llc usbhid btusb btrtl btbcm btintel bluetooth asix usbnet
> ecdh_generic ecc mii snd_soc_hdac_hdmi snd_soc_dmic xhci_pci xhci_hcd
> snd_soc_skl snd_soc_sst_ipc snd_soc_sst_dsp snd_hda_ext_core
> snd_intel_dspcfg snd_hda_core usbcore usb_common acpi_als kfifo_buf
> industrialio xt_MASQUERADE iptable_nat nf_nat xt_mark fuse
> ip6table_filter iwlmvm mac80211 r8169 realtek iwlwifi lzo_rle
> lzo_compress zram cfg80211
> [   38.871839] CR2: 0000000000000030
> [   38.875542] ---[ end trace 6bb39ec52e30c7cb ]---
> [   38.886142] RIP: 0010:drm_dp_mst_atomic_check_bw_limit+0x11/0x102
> [   38.892957] Code: 05 ff cb bf 19 48 f7 f6 c3 0f 1f 44 00 00 55 b8
> 0b 80 ff 0f 48 89 e5 5d c3 55 48 89 e5 41 57 41 56 41 55 41 54 4c 8d
> 77 30 53 <48> 8b 47 30 49 89 fd 49 89 f7 45 31 e4 48 8d 58 e8 48 8d 53
> 18 4c
> [   38.913964] RSP: 0018:ffffc9000139f9d8 EFLAGS: 00010282
> [   38.919804] RAX: 0000000000000000 RBX: ffff888272aeac88 RCX: ffff888236f529e0
> [   38.927784] RDX: ffff888272aeac88 RSI: ffff888236f529e0 RDI: 0000000000000000
> [   38.935765] RBP: ffffc9000139fa00 R08: 0000000000000031 R09: 000000000000000e
> [   38.943733] R10: ffff888236f529e8 R11: ffff8882621f3440 R12: 0000000000000000
> [   38.951712] R13: ffff888236f529d0 R14: 0000000000000030 R15: ffff888236f529e0
> [   38.959692] FS:  00007cd9229ce700(0000) GS:ffff888276c80000(0000)
> knlGS:0000000000000000
> [   38.968730] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   38.975144] CR2: 0000000000000030 CR3: 00000002618e8004 CR4: 00000000003606e0
> [   38.983121] Kernel panic - not syncing: Fatal exception
> [   38.988967] Kernel Offset: disabled
> [   38.998280] ---[ end Kernel panic - not syncing: Fatal exception ]---
> 
> 
> 
> 
> 
> 
>> [why]
>> Adding PBN attribute to drm_dp_vcpi_allocation structure to
>> keep track of how much bandwidth each Port requires.
>> Adding drm_dp_mst_atomic_check_bw_limit to verify that
>> state's bandwidth needs doesn't exceed available bandwidth.
>> The funtion is called in drm_dp_mst_atomic_check after
>> drm_dp_mst_atomic_check_topology_state to fully verify that
>> the proposed topology is supported.
>>
>> v2: Fixing some typos and indentations
>>
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
>> ---
>>   drivers/gpu/drm/drm_dp_mst_topology.c | 66 ++++++++++++++++++++++++++-
>>   include/drm/drm_dp_mst_helper.h       |  1 +
>>   2 files changed, 65 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
>> index 7cd505e771ff..f8b72ac79c66 100644
>> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
>> @@ -4052,7 +4052,7 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
>>   {
>>          struct drm_dp_mst_topology_state *topology_state;
>>          struct drm_dp_vcpi_allocation *pos, *vcpi = NULL;
>> -       int prev_slots, req_slots;
>> +       int prev_slots, prev_bw, req_slots;
>>
>>          topology_state = drm_atomic_get_mst_topology_state(state, mgr);
>>          if (IS_ERR(topology_state))
>> @@ -4063,6 +4063,7 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
>>                  if (pos->port == port) {
>>                          vcpi = pos;
>>                          prev_slots = vcpi->vcpi;
>> +                       prev_bw = vcpi->pbn;
>>
>>                          /*
>>                           * This should never happen, unless the driver tries
>> @@ -4078,8 +4079,10 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
>>                          break;
>>                  }
>>          }
>> -       if (!vcpi)
>> +       if (!vcpi) {
>>                  prev_slots = 0;
>> +               prev_bw = 0;
>> +       }
>>
>>          if (pbn_div <= 0)
>>                  pbn_div = mgr->pbn_div;
>> @@ -4089,6 +4092,9 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
>>          DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] [MST PORT:%p] VCPI %d -> %d\n",
>>                           port->connector->base.id, port->connector->name,
>>                           port, prev_slots, req_slots);
>> +       DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] [MST PORT:%p] PBN %d -> %d\n",
>> +                        port->connector->base.id, port->connector->name,
>> +                        port, prev_bw, pbn);
>>
>>          /* Add the new allocation to the state */
>>          if (!vcpi) {
>> @@ -4101,6 +4107,7 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
>>                  list_add(&vcpi->next, &topology_state->vcpis);
>>          }
>>          vcpi->vcpi = req_slots;
>> +       vcpi->pbn = pbn;
>>
>>          return req_slots;
>>   }
>> @@ -4677,6 +4684,58 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
>>          kfree(mst_state);
>>   }
>>
>> +static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
>> +                                                struct drm_dp_mst_branch *branch)
>> +{
>> +       while (port->parent) {
>> +               if (port->parent == branch)
>> +                       return true;
>> +
>> +               if (port->parent->port_parent)
>> +                       port = port->parent->port_parent;
>> +               else
>> +                       break;
>> +       }
>> +       return false;
>> +}
>> +
>> +static inline
>> +int drm_dp_mst_atomic_check_bw_limit(struct drm_dp_mst_branch *branch,
>> +                                    struct drm_dp_mst_topology_state *mst_state)
>> +{
>> +       struct drm_dp_mst_port *port;
>> +       struct drm_dp_vcpi_allocation *vcpi;
>> +       int pbn_limit = 0, pbn_used = 0;
>> +
>> +       list_for_each_entry(port, &branch->ports, next) {
>> +               if (port->mstb)
>> +                       if (drm_dp_mst_atomic_check_bw_limit(port->mstb, mst_state))
>> +                               return -EINVAL;
>> +
>> +               if (port->available_pbn > 0)
>> +                       pbn_limit = port->available_pbn;
>> +       }
>> +       DRM_DEBUG_ATOMIC("[MST BRANCH:%p] branch has %d PBN available\n",
>> +                        branch, pbn_limit);
>> +
>> +       list_for_each_entry(vcpi, &mst_state->vcpis, next) {
>> +               if (!vcpi->pbn)
>> +                       continue;
>> +
>> +               if (drm_dp_mst_port_downstream_of_branch(vcpi->port, branch))
>> +                       pbn_used += vcpi->pbn;
>> +       }
>> +       DRM_DEBUG_ATOMIC("[MST BRANCH:%p] branch used %d PBN\n",
>> +                        branch, pbn_used);
>> +
>> +       if (pbn_used > pbn_limit) {
>> +               DRM_DEBUG_ATOMIC("[MST BRANCH:%p] No available bandwidth\n",
>> +                                branch);
>> +               return -EINVAL;
>> +       }
>> +       return 0;
>> +}
>> +
>>   static inline int
>>   drm_dp_mst_atomic_check_topology_state(struct drm_dp_mst_topology_mgr *mgr,
>>                                         struct drm_dp_mst_topology_state *mst_state)
>> @@ -4808,6 +4867,9 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
>>                  ret = drm_dp_mst_atomic_check_topology_state(mgr, mst_state);
>>                  if (ret)
>>                          break;
>> +               ret = drm_dp_mst_atomic_check_bw_limit(mgr->mst_primary, mst_state);
>> +               if (ret)
>> +                       break;
>>          }
>>
>>          return ret;
>> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
>> index 830c94b7f45d..2919d9776af3 100644
>> --- a/include/drm/drm_dp_mst_helper.h
>> +++ b/include/drm/drm_dp_mst_helper.h
>> @@ -502,6 +502,7 @@ struct drm_dp_payload {
>>   struct drm_dp_vcpi_allocation {
>>          struct drm_dp_mst_port *port;
>>          int vcpi;
>> +       int pbn;
>>          bool dsc_enabled;
>>          struct list_head next;
>>   };
>> --
>> 2.17.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cmikita.lipski%40amd.com%7C2b736cb4c0f1456691ec08d79b5f4c69%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637148705931074877&amp;sdata=s4q0ni0H%2FiPgonlMMK9Od7UK5M%2FC%2F0rsQEGsr1FP0XU%3D&amp;reserved=0

-- 
Thanks,
Mikita Lipski
Software Engineer 2, AMD
mikita.lipski@amd.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
