Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E7960725C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 10:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343FE10E63E;
	Fri, 21 Oct 2022 08:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012D110E63E;
 Fri, 21 Oct 2022 08:32:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pmi8nbP0SByiPR2HM15LhpddNeuZXid21w46iHX1dTMCWbboEqVg/3cIpjntyn/i4jAGsYJJP2xAicU5sXgrSiYWHGzHvCuazpWlBTZKtdmCd7jQ7rHecWBpv65vuBCg57a2SWV/kkZwQEKxwGUSNONwIo/vPjoglPajgJ1lLkYOiophDCJQddibTtpfexUyMIXBmSE/CvcBeDZbhV9uej7nBzElFnh7chj9cw4mv6ccICu8Q5BWdeDFvEIaH9EV364NMwUjaQxgxyQRrFPAyyoAINNd67Xdgb2nEehj/eiWLRk9eWmYUvA4qCFJwGIU1XMXADUyy56vVZ6MlLppMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+Uy3Y0dTGncFBSagFU2k/2w9JT9jrNiVoien4RMo8E=;
 b=h4awGoofjgSpgqmkoyZ0HvKVAWI/SOYbNTA0w7SxSmggaoNlgKe0eI+SMMn8vbx56l/FSKajP5oGdHM8MQMT9r7xlUpfp3m59uJTIlDL+1DhMmqQHfC4KFdpPUQ39lQTRrrelSLwcaI16L+idActuMNLdkNYVTbDDp7ohWymFtTO+Z7+G27dPn3PyGYPrziQrOHBXQtvYgTvhFEEBdRmeIuS3Jy6cN1fslNsDN4sQyxp4/sXJAWWHKe2L+fEezky9NwNy+GoF4cgbsa66e5Op+AjFr+ZPcXf/+a0r9P+0ugFDd7VqRS8b7il95n/4ahwp5d1oQcBBDXCqNb2A1t9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+Uy3Y0dTGncFBSagFU2k/2w9JT9jrNiVoien4RMo8E=;
 b=2BJrtYv1UerXHPVfNPPZ0/Fa+p6jfz9jZ3DaSeDAlKhT1xavfmaaJHjqSERHSjG5jYZwNBI/80D4Z1enL15Ys/BlUOKzR01fpp+TkH6cS4ZdxZonRKEwUzR4Ojzl2G0PthSfx8db2+7F3En14KYSVH30ub2bGJ+YoCevr4+pcB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4951.namprd12.prod.outlook.com (2603:10b6:a03:1d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Fri, 21 Oct
 2022 08:32:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 08:32:54 +0000
Message-ID: <a67598e8-c826-2740-03bb-33d37c8c8e4b@amd.com>
Date: Fri, 21 Oct 2022 10:32:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [6.1][regression] after commit
 dd80d9c8eecac8c516da5b240d01a35660ba6cb6 some games (Cyberpunk 2077, Forza
 Horizon 4/5) hang at start
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
References: <CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BY5PR12MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b418f0c-2d2e-4674-fcaf-08dab33ed955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OJ9kHB0irw1i6ZRhVqCcjqlrGfLKRPmWDu7ucMptaTg+yBZBeRYbNqJgPZgNf5rVhpeX2rfKh6F/IqeGI1T/p4B7T+tqKPWeSrVUnGgjgmqcbNnR7rPYjaZGfDARF9KsVvvZy6FEeYHfJE3Td8HHoviwV9sshMS4XyeAG3rC+kClJJtLhwpLOXUOxk9zfwyMYlO2AdMDXNGSEZTcVVNp8BAfYXoSyttk++oNnzyQCyjws/kOzI+hTism1NgFXilkH6mt5P9bqNzoD82F/t3VTbrx2aseapYgRcUumL9vFg4kZOozsx2toq7eimOPgoCFXw+0Wv5IMQvZyJFmUZYgXbg5jcHR5v1bLrNGC7zOl7qBdnW1JR5g2lk6UcSUPwEraFIZ8B991VddzISteKw4yNRGs2SMAulznyk4wF0nZ4zjj322/FBZ0o/KLfIQo0zPWFfwRhdIsoO012in0HEdGcHojNuZp626HvfECE+AlxWR/A4xcTotBwIY/Pk1B98qG/9pM/xGMCtr5zYT7wCzCmkcZovJ3gXgcb3/tg1aRlxe6LV20H1n3xOF8wK0SZ3AaA71dn7AYEiE5tes+PK1Cayn6ZBFNfiUcMJuOUVm7FQykpgSaQEMYrv+30Tu1GmqTn9Y5pb1AQNL73XUR537ZkaCWYjDftTTJo+gON32xF3cDp3/j+a0KI/KrvtH+OSaPLOqA3N0orvskH/NjhMZFsdwO8PneVMuMlnZDloY6zC6qZpiK+X+NI9+tszMuIXmmMANOMnU01xTm3K2ERHX7NhSfobB1Q2gFTufRf+BPJdnLi4nhBENx2sWG2jpkFRj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199015)(31696002)(2906002)(45080400002)(186003)(83380400001)(66574015)(66556008)(66946007)(2616005)(41300700001)(4326008)(5660300002)(8676002)(8936002)(316002)(38100700002)(110136005)(54906003)(6636002)(66476007)(31686004)(36756003)(86362001)(6666004)(6506007)(966005)(6512007)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmZVQnAwSVZhbjB3WGZRNi9jd0dremVrTmdyU2VxbTVmSG1KaFQ3MG1vSk5O?=
 =?utf-8?B?eTEyVmFBeEVXVVJsM2NaMW5hUmpSbytIWWNXQlZadGg5ZVhsdHp5RHYrUnli?=
 =?utf-8?B?V2NsMHdNTzVTV20wdFB4Y0dtNWFDMUo4UmhMYkVtd2NIdlp6d3RDTGhNZWFu?=
 =?utf-8?B?M0RTNWRXWmlwaEZLdWdkSkRVL0R0VFc0SFF5OG1yZXFNRzRSK2FtRm91Q3U0?=
 =?utf-8?B?Vk1vTGJGbU5HL1N5STl5cUxIYzJlRm5ldGJPaWpKWUM4UWZMUytjOU00R1pY?=
 =?utf-8?B?Z0FhaCswK1hYbFpLbEVEaUdoZk91cUdNL2tCQ2wveEJMOXVIbTBCaXdhdTVa?=
 =?utf-8?B?NHpyd2s4NHplZmY5VnhKZGp6UytNem9nVlppSENkbzVLVUhVWWpYQmtkRFQ5?=
 =?utf-8?B?NkkwaWVIT2FxK0V1bStXeXBkc0VJSHhuYjdUWGRiTFlqVEVxM0N1TlVmSzlE?=
 =?utf-8?B?WnJSckJPUFJpVmsyRTF4c0F3RGJHdE00cEJrdlNOcTBNRkkyaEJJLzdzMkVV?=
 =?utf-8?B?bEtBbXRwanRva0J5ZnIzSzJwSEQ0YXhRSGtRQ3hkOUZHNS9GNDRMTHpUV0RV?=
 =?utf-8?B?bFhLTk9iZ0tlbUJIKzlZQk1zVFBBMWxDdnlQM1VpQXFaczVueStRSU9UOXF5?=
 =?utf-8?B?Mzlhck84RnJrTUlsdEpwQmlYem1SWlZKQnhuU0N6VExldyt3a3N3SzBTVy9O?=
 =?utf-8?B?MHlIRVorRHlPUWVYd3V5dDhKV0RBZVRBSWNKTnhxaGo1OXIrMC8wY2k2a1Rr?=
 =?utf-8?B?bTJSY2RRdmF4ZjBRbGtpQm4ycWNlNWpqcXBtOFdxV1VoWmdPTjRvVVhBWVoy?=
 =?utf-8?B?eFBwSjFuUmVrUEZndTZGa1BDQjgyZG5laUpUU01nYk1GRFZieWU3cS8ybHpH?=
 =?utf-8?B?V3Vvd0JQNU9UcTVvYmc5dkozZXVkdVp0Tlc5SFZiWkVkNE5YRzdWY3ZKemc2?=
 =?utf-8?B?ZHkzOVdQdGNIRnNPK3dVWXlYcWhHV3Fad1NuR1NOVzFodjlZSHpzVHUxVUFG?=
 =?utf-8?B?b1haK29rYk1pMnNTQUhuVVhGK2E2R0dTWWVXQ0tVUGw1c1c4a0lpU0RvVk9E?=
 =?utf-8?B?RDIwcU4ya3hqdC9zSDVqQXZOTDg4c3pyZmJ6S2tvUjFGeXgzTEVLSjB2RHRp?=
 =?utf-8?B?Vm9oUDdCaXQwakhQanJJWmxIM29VL0JpMGxoTDlzb2x2aGhIWTJyeWpxaXRY?=
 =?utf-8?B?M2dSdGJXYStEN2Nuc0F5REVNc0pQRjVScTBMMGIxLzlGWVNMNXRVNS84SElJ?=
 =?utf-8?B?WjIzamxpMURqam84M2FzSytZbzg4L0UrUTRFZWtrSmg0UVBEK3dFbnJwbnUr?=
 =?utf-8?B?QlRYUDAvd1NVTE5zSkFoODJabjBwVXRKemtlY2FSSitkTTNwRGNkZkZXMXIw?=
 =?utf-8?B?aTdFMjBwUlJKRVp1cmFhZk94dkU2dGxPVFdwRFpwUXY4SFd2Q3hOcU9ZdXZk?=
 =?utf-8?B?WFhseTFoai92b05MaEM1RzlyNlA5L3BYWDB5ZU1CdUJMOTdWL25XNFVTTjVY?=
 =?utf-8?B?ck81SDFFKzNXYnUrM1JrdWVWUUFCQzhiVkVBQklHQnFqUEx3c2gxTXVRT3hK?=
 =?utf-8?B?RHk0c3U1SlJHRnBnVGhCakQ1WWR5L1hCZFZ5aGpXejBlOFpkTksrS0JHbEtk?=
 =?utf-8?B?K091RHRNNE5uRUU5aVprSEJiNkFqRDlVR2phVzFINkkzNzFzZXh0cE1xVHhG?=
 =?utf-8?B?c1A2dzlpZFNHa0duVFhWTitRdmpvNWxQaW1ad3drRko2bUJXWlNSY0tGYUVz?=
 =?utf-8?B?RlU4akt6V3lLN2R5VElUSFpnZk05S1NsUEY0V1NOc2lyR1hVZ0UwUmxVL2M4?=
 =?utf-8?B?TXNIQ0VPa1VzelVWQmRTU25kSFArL3dBelVSa05tOVlsTUk4WURONURLVHo1?=
 =?utf-8?B?YlE5aGlEa3FoaTZsOFBvSEpleEhabENCMWJuSzNlT24xclpMWjNWZUJqaGV3?=
 =?utf-8?B?dTJCeW9kc0JDTElJZ2FubGZFcklvdVVQMmozWElYQ0s2YnVjbDFEZmhjckFR?=
 =?utf-8?B?OUp6eFFtQ2QwcWVsT2lTZGd2Q1RqREI5Y3pUTEd1Y1VleGsrdkQ1RVNnNy9X?=
 =?utf-8?B?ZWdqMmJTYUdkNTFtUG1hS0xMZFowVXR4a2U1YUkrNEVIbHRVRUFZR05rR3Vl?=
 =?utf-8?B?eTczTXdVellUU3hOWlhUclpWbUU2dW4vWjlGU2V5QVdqM1NtK2xlT2RucXNX?=
 =?utf-8?Q?GXC+GEzukXq1bmmjZRWeO6dGTDyOlTa4edjMmV/jo5hT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b418f0c-2d2e-4674-fcaf-08dab33ed955
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 08:32:54.3700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEMswCRr8c4X/GfMY5DYbG/ZzlCCoObILjkwzKA4lwqt2avNKPfV5Hl+j+4xyX8t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4951
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

yes Bas already reported this issue, but I couldn't reproduce it. Need 
to come up with a patch to narrow this down further.

Can I send you something to test?

Thanks for the help,
Christian.

Am 21.10.22 um 10:08 schrieb Mikhail Gavrilov:
> Hi!
> I found that some games (Cyberpunk 2077, Forza Horizon 4/5) hang at
> start after commit dd80d9c8eecac8c516da5b240d01a35660ba6cb6.
>
> dd80d9c8eecac8c516da5b240d01a35660ba6cb6 is the first bad commit
> commit dd80d9c8eecac8c516da5b240d01a35660ba6cb6
> Author: Christian König <christian.koenig@amd.com>
> Date:   Thu Jul 14 10:23:38 2022 +0200
>
>      drm/amdgpu: revert "partial revert "remove ctx->lock" v2"
>
>      This reverts commit 94f4c4965e5513ba624488f4b601d6b385635aec.
>
>      We found that the bo_list is missing a protection for its list entries.
>      Since that is fixed now this workaround can be removed again.
>
>      Signed-off-by: Christian König <christian.koenig@amd.com>
>      Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>      Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 21 ++++++---------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c |  2 --
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 -
>   3 files changed, 6 insertions(+), 18 deletions(-)
>
>
> And when it happening in kernel log appears a such backtrace:
> [  231.331210] ------------[ cut here ]------------
> [  231.331262] WARNING: CPU: 11 PID: 6555 at
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:675
> amdgpu_ttm_tt_get_user_pages+0x14c/0x190 [amdgpu]
> [  231.331424] Modules linked in: uinput rfcomm snd_seq_dummy
> snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
> nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
> nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
> qrtr bnep intel_rapl_msr intel_rapl_common snd_sof_amd_renoir
> snd_sof_amd_acp snd_sof_pci snd_hda_codec_realtek snd_sof
> snd_hda_codec_generic snd_hda_codec_hdmi snd_sof_utils mt7921e
> snd_hda_intel sunrpc snd_intel_dspcfg mt7921_common binfmt_misc
> snd_intel_sdw_acpi snd_hda_codec mt76_connac_lib edac_mce_amd btusb
> snd_soc_core mt76 snd_hda_core btrtl snd_hwdep snd_compress kvm_amd
> ac97_bus snd_seq btbcm snd_pcm_dmaengine btintel snd_rpl_pci_acp6x
> mac80211 btmtk snd_pci_acp6x kvm snd_seq_device snd_pcm snd_pci_acp5x
> libarc4 irqbypass bluetooth snd_rn_pci_acp3x snd_timer pcspkr
> asus_nb_wmi rapl joydev wmi_bmof snd_acp_config cfg80211 snd_soc_acpi
> vfat snd
> [  231.331490]  snd_pci_acp3x i2c_piix4 soundcore fat k10temp amd_pmc
> asus_wireless zram amdgpu drm_ttm_helper ttm hid_asus asus_wmi
> iommu_v2 crct10dif_pclmul crc32_pclmul gpu_sched crc32c_intel
> ledtrig_audio sparse_keymap polyval_clmulni platform_profile drm_buddy
> polyval_generic hid_multitouch drm_display_helper rfkill nvme
> ucsi_acpi ghash_clmulni_intel nvme_core video typec_ucsi serio_raw ccp
> sha512_ssse3 sp5100_tco r8169 cec nvme_common typec wmi i2c_hid_acpi
> i2c_hid ip6_tables ip_tables fuse
> [  231.331532] CPU: 11 PID: 6555 Comm: GameThread Tainted: G        W
>    L    -------  ---
> 6.1.0-0.rc1.20221019gitaae703b02f92.17.fc38.x86_64 #1
> [  231.331534] Hardware name: ASUSTeK COMPUTER INC. ROG Strix
> G513QY_G513QY/G513QY, BIOS G513QY.318 03/29/2022
> [  231.331537] RIP: 0010:amdgpu_ttm_tt_get_user_pages+0x14c/0x190 [amdgpu]
> [  231.331654] Code: a8 d0 e9 32 ff ff ff 4c 89 e9 89 ea 48 c7 c6 40
> 82 f3 c0 48 c7 c7 10 60 14 c1 e8 2f a0 f4 d0 eb 8e 66 90 bd f2 ff ff
> ff eb 8d <0f> 0b eb f5 bd fd ff ff ff eb 82 bd f2 ff ff ff e9 62 ff ff
> ff 48
> [  231.331656] RSP: 0018:ffffaad4c705bae8 EFLAGS: 00010286
> [  231.331659] RAX: ffff8e9cbdbe3200 RBX: ffff8e997e3f2440 RCX: 0000000000000000
> [  231.331661] RDX: 0000000000000000 RSI: ffff8e9cbdbe3200 RDI: ffff8e9c31208000
> [  231.331663] RBP: 0000000000000001 R08: 0000000000000dc0 R09: 00000000ffffffff
> [  231.331665] R10: 0000000000000001 R11: 0000000000000000 R12: ffffaad4c705bb90
> [  231.331666] R13: 0000000076510000 R14: ffff8e9c89f334e0 R15: ffff8e991fda8000
> [  231.331668] FS:  000000007c2af6c0(0000) GS:ffff8ea7d8e00000(0000)
> knlGS:000000007b2c0000
> [  231.331671] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  231.331673] CR2: 00007ff65ffd8000 CR3: 00000004f90f0000 CR4: 0000000000750ee0
> [  231.331674] PKRU: 55555554
> [  231.331676] Call Trace:
> [  231.331678]  <TASK>
> [  231.331682]  amdgpu_cs_ioctl+0x87e/0x1fc0 [amdgpu]
> [  231.331824]  ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
> [  231.331981]  drm_ioctl_kernel+0xac/0x160
> [  231.331990]  drm_ioctl+0x1e7/0x450
> [  231.331994]  ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
> [  231.332118]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
> [  231.332233]  __x64_sys_ioctl+0x90/0xd0
> [  231.332238]  do_syscall_64+0x5b/0x80
> [  231.332243]  ? asm_exc_page_fault+0x22/0x30
> [  231.332247]  ? lockdep_hardirqs_on+0x7d/0x100
> [  231.332250]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [  231.332253] RIP: 0033:0x7ff677c5704f
> [  231.332256] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24
> 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00
> 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28
> 00 00
> [  231.332258] RSP: 002b:000000007c2ad470 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  231.332261] RAX: ffffffffffffffda RBX: 000000007c2ad718 RCX: 00007ff677c5704f
> [  231.332263] RDX: 000000007c2ad540 RSI: 00000000c0186444 RDI: 00000000000000a7
> [  231.332265] RBP: 000000007c2ad540 R08: 00007ff590048590 R09: 000000007c2ad510
> [  231.332266] R10: 000000007e864ec0 R11: 0000000000000246 R12: 00000000c0186444
> [  231.332268] R13: 00000000000000a7 R14: 000000007c2ad6f0 R15: 0000000000000005
> [  231.332277]  </TASK>
> [  231.332279] irq event stamp: 18035
> [  231.332281] hardirqs last  enabled at (18043): [<ffffffff9118e8de>]
> __up_console_sem+0x5e/0x70
> [  231.332284] hardirqs last disabled at (18050): [<ffffffff9118e8c3>]
> __up_console_sem+0x43/0x70
> [  231.332287] softirqs last  enabled at (17864): [<ffffffff911012ed>]
> __irq_exit_rcu+0xed/0x160
> [  231.332289] softirqs last disabled at (17857): [<ffffffff911012ed>]
> __irq_exit_rcu+0xed/0x160
> [  231.332291] ---[ end trace 0000000000000000 ]---
> [  231.332299] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
> process the buffer list -14!
>
> [  231.332423] ================================================
> [  231.332424] WARNING: lock held when returning to user space!
> [  231.332425] 6.1.0-0.rc1.20221019gitaae703b02f92.17.fc38.x86_64 #1
> Tainted: G        W    L    -------  ---
> [  231.332426] ------------------------------------------------
> [  231.332427] GameThread/6555 is leaving the kernel with locks still held!
> [  231.332428] 1 lock held by GameThread/6555:
> [  231.332429]  #0: ffff8e9cfbac64a8
> (&list->bo_list_mutex){+.+.}-{3:3}, at: amdgpu_cs_ioctl+0x786/0x1fc0
> [amdgpu]
> [  389.428155] amdgpu 0000:03:00.0: amdgpu: free PSP TMR buffer
>
> Christian, any ideas?
> Thanks.
>
> Full kernel log: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpastebin.com%2F6SEaDay8&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C27dd4aee42ce4c17b96408dab33b789a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019365255948072%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=FWqD8yajUiBsCTlgqjF2Y%2BtC193YDFHocH3%2F46fiiOA%3D&amp;reserved=0
> My hardware:
> GPU: 6900XT, 6800M
> CPU: 3950X, 5900HX
>

