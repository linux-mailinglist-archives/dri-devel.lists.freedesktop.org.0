Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382EB82F0C8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 15:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B989C10E4AF;
	Tue, 16 Jan 2024 14:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBF310E4AF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 14:46:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CltfRyYiyiRJFNnt2ii/J7J5cKeBRRTbv4zXHzmUGuDQt8aQwWJZD0dRtGT0iqWrVab7KwuBh1uwG8wxvbAy3EgNhjcHP1V4oYUcbwK66UVuuexq0s3c6on70NsJOpylnv3vNE2zdrTA9PSXHVQh9LyIZN4g+pnKCU/yDlyaU9U1K1lwpvni2wZvlUmY1F7Ac7YMMFmo8l65Ve5VaMsC2Cspnt9VBbJip9Cd/l0BQUVco89Z8bewlEgCVbIzgdSV/ZjK8VNEo5/4WdcFpDhPoN+6ejBZU0byI6BK7oaItLXgDiDjZi+boeojQhLQMvr2dCH4GCBMhVzFUsyf6jv3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZr480ykh4IivDMbcJda1EzSMfjlsNwZVQ9CW3G/jHA=;
 b=baV+gMdKnSgt/ywiMWo2abPtYbucNvrVXIANA/nxGM7cj7Y2E5G2yzsbPQpHI9Tf/fVp6F/FSJxyi/G3AgPyDC6dfQGsPBjfF8efLNrhHg0LWqqJmLq3OlSh+ADPkJM17wlJNznMNCDqC9YFrUsVnW9Aus1ZURhqrnLyQE7b/bvGfSChSJ8sjrL4j4iOvzqBoq5ft/RRmLHc2Mw1mWHRse4qfqF2SE8aYw+7TAf7F4aJdMn4PfguFxTSUvCYhqPvO1SaCzeJj7eL4yvdc7TIy7LVPcuJefdonSn/z6fu9Bz8xQlfYIsfw4H0bJp9DUVUl192p5SZfTo/a3oo8WalLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZr480ykh4IivDMbcJda1EzSMfjlsNwZVQ9CW3G/jHA=;
 b=4hm6z5jzXKV6oPK0+onE6CpWJeetIZZ+KT39oRNHME3GfRab/xCcWBtgzlavxkSZHRlwCtm6oP+g+UDMyryhUXkcx+AuuRmwCTAdZKXFI3rFRtj63yiNOnxJO2OsbDn4e+zq7GHewLLQfc5ZRoEmQ9f+1NvnrP3QY/3DngYMAa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6748.namprd12.prod.outlook.com (2603:10b6:510:1c4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Tue, 16 Jan
 2024 14:45:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Tue, 16 Jan 2024
 14:45:42 +0000
Message-ID: <e72f45e3-1631-4943-9ddc-66fd9deca2d3@amd.com>
Date: Tue, 16 Jan 2024 15:45:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: only use DMA32 if needed for dummy_read_page
Content-Language: en-US
To: Yangyu Chen <cyy@cyyself.name>
References: <tencent_0B319B215E8D487CC082C0DA5E8E46B86B08@qq.com>
 <2b715134-9d63-4de1-94e5-37e180aeefd2@amd.com>
 <tencent_D6D106D735062E24A4B191EF5AB04B7BCA05@qq.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <tencent_D6D106D735062E24A4B191EF5AB04B7BCA05@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 2134e87a-9cb9-4c13-8c0a-08dc16a1d0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QaqlHZ5FazwJ3vcTsfZ0NSdD2NQ1WeC4u/X7kOkj3PJ9DlvF558fp9S7NXOZHsZ2iHVIB1yIpeA7fYTDiD4jFiZAW658szd7CV7x520pwdTAOmNHtiAKF+LMgoigGamA9iglg9PQAhmey06h1lKI74Kz0ehKAKnuRIUGmhF1ZilffBArzvKKT+BSxXaHO6PhCGxl25rd3ziK6/WZYHruR15ma34ENjNhgsI1JcdIw6yBEvpBE8Ahu98i5CmPu/WdqxW9kkSvSnAE/xO8TDAczsShqhWONqEA4xtnB7cZ04y1mDeND4XoZeOyyJZFl2z0IdzURvCUxfL1dhdOAInmiKHYe4pX5Oq74gCokqRsXOg01sFPKupGG1A5f9Wd89aYs56ObsjxvlSs/RjZoWUDvDx7QoKKlVOEdszHoPnLYj7HmvX/UUayc9c/rY6UpXb71wC8Un8/MJQV+7f9xniQdRjcae2C4pIFqgkY+ZKEyt4qoiv6FEXXGCp3Gnwa4vwTcni/NpcV+firkd7iY6RkkLDGJo8CpRAuODcVkUCVYXanshBIZCmab4ld+zGryA3GT4t0DNRSwwlgnCYahh6pPcWE05k1JhzqXfiphI8OTYl4rxTE+xxSZlRWO3lsWhhbwV0o2NHwHoe7RmyYANfPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(83380400001)(66574015)(31696002)(36756003)(86362001)(8676002)(6666004)(8936002)(4326008)(5660300002)(2616005)(26005)(38100700002)(66946007)(66476007)(66556008)(54906003)(316002)(7416002)(6916009)(41300700001)(2906002)(6486002)(6506007)(6512007)(53546011)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1UxZXhWOW01TFRRdmFVc2hwOFlWdWFLVllvTDZZS0hRbDBjTGZVWlFZL3Vh?=
 =?utf-8?B?Yko3dThmYmozbUxmOUtNTitsb1RPeFNpYnhiL2haZmJyVW5ZUFNJMlRYc1Vz?=
 =?utf-8?B?QlRJVVUyZWZXby8rbzZJRGxaRHA2RXRJWTJjSDFsRkNpZFFSekdvVnk1aXRo?=
 =?utf-8?B?M3I1QmNOVE9BZXowMnRKVkFRUGM2OTRmcnNwaWVZazJ3cEtHVytxWnlJNXdP?=
 =?utf-8?B?cHhscXFlNEs0L3c0TDg1cXhXV3lhbHAxcHlvZno0b2ttNGpIRDQ5dU5BcTNr?=
 =?utf-8?B?NHB1LzhyaW9LZzBJUnF5Tm9LcEtBSE53TnJNSGhlR3Z6M0lidWdwSGFyRDZM?=
 =?utf-8?B?OHc0U1QrbHFFZGQ1V0M3VFhISjNRS1NPQk5QTndlTFpiZTVVR3VuSWh0Q3do?=
 =?utf-8?B?d0grWUJvcXRaa003NFBkKzhvdkZISmhQazEzZkUyZ0c3R2VtNWNzUWpUeWxP?=
 =?utf-8?B?cSswL0tEaFJqMkRraG8zcnlpUVNId2hxU3hOVURoUEVzTno0ajg1OWhZVE5n?=
 =?utf-8?B?cUZNcHRkRHVteDdvWW5YWEdsYm1CYTZDRTNOTWxLR1ZQQmkxMzY1eVdlZDI3?=
 =?utf-8?B?MlpPR0NoN1dnd3RYblN5SzYyV0FUOW5tTVRnVlJhV0wrVHdkMnRId0o2Mmk4?=
 =?utf-8?B?NTNZOWRJeFJMRmQyWVNzTmZRaUkyRlhFNVE1K0tSaTlGankyRGlLNW5NR29u?=
 =?utf-8?B?KzAwVEdWb3pMQ1BtWFJLemRDVzVsMGhkV052ZU0yMWNHS2Q4TVFpaG9BS1hD?=
 =?utf-8?B?eHZoVlhqYkxsS090QkxQeVhFYm9raXJSM3JQN2RwMSsydXZoWFZjL0xUTVh2?=
 =?utf-8?B?a0RqalJ4bC9lRmVrRElUcHVCdkhXWmhaRWw2VlUya0hiVHFJZ2V3K05Md0dR?=
 =?utf-8?B?dVYzRmd4MGVQalJZaHJsSHJxQ2YzZ1g3dytmc0orSjZObnJwR3hHNStYUVha?=
 =?utf-8?B?RmQwc3VYWTdKNmlpL2laMWxMdXJaalZmQ3Z0bXZaQlRvOVFXRFcvdUxPV2dP?=
 =?utf-8?B?S1JCa1BSU0pPV0FrS21zeE8vOUl1RXpRdlNhcmk1MkdpbzlFd2FWQlFlYmhY?=
 =?utf-8?B?T3dKMUVoU1hhMlFFS0hBVm1uTjJUVS9UQy9IUEdNdWk1U0l6SFJUM1phamx1?=
 =?utf-8?B?VHozMzl2QjgrVERNWGFmUjRzOVJzbHBlZFp0cC84K3AzZjdmOWNQRG5MVWh5?=
 =?utf-8?B?QS9pZE03VFhkdjZoTXY1TEJzc2Mrb3lzTVdhV0NUYWpCOThBYUszdFQ5UzVV?=
 =?utf-8?B?M2o2K2VqSEVkTVF1UTFDRXRJdHNFZ0pTWk1FVi9tclpqaXdzSXBhdGJOZVVu?=
 =?utf-8?B?VXhQRXJHV25IaDdmb3RObnMrNmRRMlFDUkJTeGM2QXAyMXUvVS8wdzJRZWNv?=
 =?utf-8?B?djlOMFM3RGpreEFlTjJRczFxS3Y0V3h1MllhU1IyeDd3ZlhjMHpxb2FEMFh5?=
 =?utf-8?B?ajAveWlkdWVWTFdHTFI1aEZaanRvWnZSaFJXZDJhS01Zc29JUTRtOU1CY3Ro?=
 =?utf-8?B?cTFMS2lIcXg3bWNDZ2ZaOGJIRWFtZm94Y3pDN2w0d0h6MGxKbU1CVUZzMVRZ?=
 =?utf-8?B?bnRZd1Q5NW9JVG5rR0x6VmpqUndRclN0MUlnaDlBRE42aThEVE1hL2VRQThM?=
 =?utf-8?B?ZWZrQlhGNUFSOU92YUtJejhhZ2dLZmF3TGNETlJwZityenNmSUFRYWdDdk9t?=
 =?utf-8?B?bldiSTFXMi9jQnlkT2pKaDE4YnZTRnAzekZ1RWw3cVZxQ3BsZWU0TUluYTZw?=
 =?utf-8?B?ZHlPdm1tcmdZbUdXVWJ1UE9YRCtaRFRMbU1sb2d1WWREQkY2SVllY3VEZWNC?=
 =?utf-8?B?UU1QbzM3d3ZXQndXcHFzNFIzTnlBYXZkTjJWa3pzcE1EbXpicmJodERaRHZh?=
 =?utf-8?B?OE4rRVpaaUs4OVNKOW1XblRucGRUOGJqMVdPYS9ISnRXZm0wV1YwbjQxaXRW?=
 =?utf-8?B?Y1JZRktEQ2pIVlNvQzYxanBLSEQzWEJkbEdJMlB3aWFVY3BycFpIajdCMjFE?=
 =?utf-8?B?am1QSHRoaCsxVUYrQm4xYU8wOWQxa2dzSzZPWlJnMnhXZ0VlTVBqKzBZWUVY?=
 =?utf-8?B?YnBrUWV3NFN1QXFYVGs0RC9TcytmZ3lYTTVDUWkyWW8xSWFvMjdZNWRDQVVp?=
 =?utf-8?Q?XyoLmntOq5UC6szIFV2YOG/Nj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2134e87a-9cb9-4c13-8c0a-08dc16a1d0b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 14:45:42.8787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygxUlYYB8oijDCyNaEHMQ6qJv4xtdec+Yo6r7l1z2Oyyqow03fCMzDzetqqh+uMO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6748
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jiuyang Liu <liu@jiuyang.me>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Yichuan Gao <i@gycis.me>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.01.24 um 12:27 schrieb Yangyu Chen:
> On 1/16/24 17:45, Christian König wrote:
>> Am 16.01.24 um 08:24 schrieb Yangyu Chen:
>>> Some platforms may not have any memory in ZONE_DMA32 and use IOMMU 
>>> to allow
>>> 32-bit-DMA-only device to work. Forcing GFP_DMA32 on dummy_read_page 
>>> will
>>> fail in such platforms. Only use DMA32 when it must to get the bug
>>> resolved.
>>
>> Well that makes no sense.
>>
>> If a platform doesn't have a ZONE_DMA32 then GFP_DMA32 is just 
>> ignored as far as I know.
>>
>
> Well, but it only applies when such ISA has no ZONE_DMA32 such as x86-32
> without PAE. It does not apply to some ISAs which has ZONE_DMA32 defined
> in the kernel but there is no memory below the 4GB address range. It
> happens on some RISC-V SoC chips and I know at least two chips have this
> issue.
>
>
> Below is some dmesg from my platform, using such RISC-V without 
> ZONE_DMA32 with AMD RX550 GPU:
>
> [    0.000000] Linux version 6.7.0-dirty (cyy@cyy-pc) 
> (riscv64-linux-gnu-gcc (Debian 13.2.0-7) 13.2.0, GNU ld (GNU Binutils 
> for Debian) 2.41.50.20231227) #12 SMP Tue Jan 16 18:55:13 CST 2024
> [    0.000000] Machine model:
> [    0.000000] SBI specification v2.0 detected
> [    0.000000] SBI implementation ID=0x1 Version=0x10004
> [    0.000000] SBI TIME extension detected
> [    0.000000] SBI IPI extension detected
> [    0.000000] SBI RFENCE extension detected
> [    0.000000] efi: UEFI not found.
> [    0.000000] OF: reserved mem: 
> 0x0000002000000000..0x000000200003ffff (256 KiB) nomap non-reusable 
> mmode_resv1@20,0
> [    0.000000] OF: reserved mem: 
> 0x0000002000040000..0x000000200005ffff (128 KiB) nomap non-reusable 
> mmode_resv0@20,40000
> [    0.000000] Zone ranges:
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   [mem 0x0000002000000000-0x00000021ffffffff]
>
> [   35.738619] [drm] amdgpu kernel modesetting enabled.
> [   35.743916] [drm] initializing kernel modesetting (POLARIS12 
> 0x1002:0x699F 0x1043:0x0513 0xC7).
> [   35.752671] [drm] register mmio base: 0xA8100000
> [   35.763558] [drm] register mmio size: 262144
> [   35.768491] [drm] add ip block number 0 <vi_common>
> [   35.773403] [drm] add ip block number 1 <gmc_v8_0>
> [   35.773407] [drm] add ip block number 2 <tonga_ih>
> [   35.773410] [drm] add ip block number 3 <gfx_v8_0>
> [   35.773412] [drm] add ip block number 4 <sdma_v3_0>
> [   35.773415] [drm] add ip block number 5 <powerplay>
> [   35.773418] [drm] add ip block number 6 <dm>
> [   35.806668] [drm] add ip block number 7 <uvd_v6_0>
> [   35.806671] [drm] add ip block number 8 <vce_v3_0>
> [   36.014036] amdgpu 0000:05:00.0: amdgpu: Fetched VBIOS from ROM BAR
> [   36.020322] amdgpu: ATOM BIOS: 115-C994PI2-100
> [   36.043586] [drm] UVD is enabled in VM mode
> [   36.047813] [drm] UVD ENC is enabled in VM mode
> [   36.052370] [drm] VCE enabled in VM mode
> [   36.052377] amdgpu 0000:05:00.0: amdgpu: Trusted Memory Zone (TMZ) 
> feature not supported
> [   36.064404] amdgpu 0000:05:00.0: amdgpu: PCIE atomic ops is not 
> supported
> [   36.071209] [drm] GPU posting now...
> [   36.190029] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, 
> fragment size is 9-bit
> [   36.199385] amdgpu 0000:05:00.0: amdgpu: VRAM: 4096M 
> 0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
> [   36.208978] amdgpu 0000:05:00.0: amdgpu: GART: 256M 
> 0x000000FF00000000 - 0x000000FF0FFFFFFF
> [   36.217345] [drm] Detected VRAM RAM=4096M, BAR=256M
> [   36.222226] [drm] RAM width 128bits GDDR5
> [   36.226288] warn_alloc: 8 callbacks suppressed
> [   36.226290] (udev-worker): page allocation failure: order:0, 
> mode:0x104(GFP_DMA32|__GFP_ZERO), nodemask=(null),cpuset=/,mems_allowed=0
> [   36.242837] CPU: 3 PID: 165 Comm: (udev-worker) Not tainted 
> 6.7.0-dirty #12
> [   36.249796] Hardware name: (DT)
> [   36.254670] Call Trace:
> [   36.257113] [<ffffffff80006056>] dump_backtrace+0x1c/0x24
> [   36.262513] [<ffffffff8096b860>] show_stack+0x2c/0x38
> [   36.267562] [<ffffffff80977f14>] dump_stack_lvl+0x3c/0x54
> [   36.272958] [<ffffffff80977f40>] dump_stack+0x14/0x1c
> [   36.278006] [<ffffffff8018e66c>] warn_alloc+0xee/0x16c
> [   36.283143] [<ffffffff8018f17a>] __alloc_pages+0xa90/0xb40
> [   36.288627] [<ffffffff0174f5fe>] ttm_global_init+0x12a/0x1ac [ttm]
> [   36.294830] [<ffffffff0174f6b2>] ttm_device_init+0x32/0x158 [ttm]
> [   36.300935] [<ffffffff018448bc>] amdgpu_ttm_init+0x7a/0x638 [amdgpu]
> [   36.310260] [<ffffffff01b4c8b8>] amdgpu_bo_init+0x76/0x82 [amdgpu]
> [   36.319323] [<ffffffff018c2b6e>] gmc_v8_0_sw_init+0x36c/0x652 [amdgpu]
> [   36.328710] [<ffffffff018328fa>] amdgpu_device_init+0x1648/0x20fa 
> [amdgpu]
> [   36.338395] [<ffffffff01834c1a>] amdgpu_driver_load_kms+0x1e/0x158 
> [amdgpu]
> [   36.348164] [<ffffffff0182b9d4>] amdgpu_pci_probe+0x124/0x46c [amdgpu]
> [   36.357543] [<ffffffff804ae3ae>] pci_device_probe+0x7a/0xf0
> [   36.363115] [<ffffffff8058cfb6>] really_probe+0x86/0x242
> [   36.368427] [<ffffffff8058d1ce>] __driver_probe_device+0x5c/0xda
> [   36.374431] [<ffffffff8058d278>] driver_probe_device+0x2c/0xb2
> [   36.380260] [<ffffffff8058d3f8>] __driver_attach+0x6c/0x11a
> [   36.385829] [<ffffffff8058b14c>] bus_for_each_dev+0x60/0xae
> [   36.391398] [<ffffffff8058ca08>] driver_attach+0x1a/0x22
> [   36.396707] [<ffffffff8058c368>] bus_add_driver+0xd0/0x1ba
> [   36.402189] [<ffffffff8058e046>] driver_register+0x3e/0xd8
> [   36.407671] [<ffffffff804ad04a>] __pci_register_driver+0x58/0x62
> [   36.413679] [<ffffffff0207e078>] amdgpu_init+0x78/0x1000 [amdgpu]
> [   36.422616] [<ffffffff8000212c>] do_one_initcall+0x58/0x19c
> [   36.428188] [<ffffffff80086d22>] do_init_module+0x4e/0x1b0
> [   36.433672] [<ffffffff80088456>] load_module+0x1374/0x1768
> [   36.439155] [<ffffffff80088a10>] init_module_from_file+0x76/0xaa
> [   36.445158] [<ffffffff80088c2c>] __riscv_sys_finit_module+0x1cc/0x2ba
> [   36.451597] [<ffffffff80978952>] do_trap_ecall_u+0xba/0x12e
> [   36.457167] [<ffffffff809819f4>] ret_from_exception+0x0/0x64
> [   36.462847] Mem-Info:
> [   36.465124] active_anon:41 inactive_anon:4533 isolated_anon:0
>                 active_file:12928 inactive_file:24854 isolated_file:0
>                 unevictable:0 dirty:176 writeback:0
>                 slab_reclaimable:3390 slab_unreclaimable:3922
>                 mapped:4609 shmem:333 pagetables:564
>                 sec_pagetables:0 bounce:0
>                 kernel_misc_reclaimable:0
>                 free:1983561 free_pcp:0 free_cma:0
> [   36.490913] Node 0 hugepages_total=0 hugepages_free=0 
> hugepages_surp=0 hugepages_size=2048kB
> [   36.508722] 38077 total pagecache pages
> [   36.512560] 0 pages in swap cache
> [   36.515875] Free swap  = 0kB
> [   36.518757] Total swap = 0kB
> [   36.521633] 2097152 pages RAM
> [   36.524601] 0 pages HighMem/MovableOnly
> [   36.528438] 45269 pages reserved
> [   36.531699] [drm:amdgpu_ttm_init [amdgpu]] *ERROR* failed 
> initializing buffer object driver(-12).
> [   36.543451] [drm:amdgpu_device_init [amdgpu]] *ERROR* sw_init of IP 
> block <gmc_v8_0> failed -12
> [   36.555011] amdgpu 0000:05:00.0: amdgpu: amdgpu_device_ip_init failed
> [   36.561458] amdgpu 0000:05:00.0: amdgpu: Fatal error during GPU init
> [   36.567816] amdgpu 0000:05:00.0: amdgpu: amdgpu: finishing device.

Interesting, I think I remember seeing something like this on ARM as 
well but we didn't run into any problems with GFP_DMA32 there.


>> This patch here won't work since the use_dma32 flag is a per device 
>> flag which can't be used for the global initialization.
>>
>> Otherwise this can randomly fail depending on if a DMA32 device 
>> initializes first or after some device with larger addressing 
>> capabilities. This configuration is quite common on older 
>> motherboards with both integrated and dedicated graphics.
>>
>> Regards,
>> Christian.
>>
>
> Thanks for your review. However, the bug I mentioned above still needs
> to be resolved. I want to submit patch v2 with a different solution 
> that tries to allocate with GFP_DMA32 flag, if it fails, then try to 
> allocate without GFP_DMA32 flag. Would this solution be acceptable?

Yeah, that's probably a good idea.

I mean in general we should avoid GFP_DMA32 altogether here, but for 
this we would need a function to get memory with the best possible 
accessibility for all devices.

Regards,
Christian.

>
> Thanks,
> Yangyu Chen
>
>>>
>>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_device.c | 7 ++++---
>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>> index d48b39132b32..62f16fb72428 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -63,7 +63,7 @@ static void ttm_global_release(void)
>>>       mutex_unlock(&ttm_global_mutex);
>>>   }
>>> -static int ttm_global_init(void)
>>> +static int ttm_global_init(bool use_dma32)
>>>   {
>>>       struct ttm_global *glob = &ttm_glob;
>>>       unsigned long num_pages, num_dma32;
>>> @@ -95,7 +95,8 @@ static int ttm_global_init(void)
>>>       ttm_pool_mgr_init(num_pages);
>>>       ttm_tt_mgr_init(num_pages, num_dma32);
>>> -    glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32);
>>> +    glob->dummy_read_page = use_dma32 ? alloc_page(__GFP_ZERO | 
>>> GFP_DMA32) :
>>> +                        alloc_page(__GFP_ZERO);
>>>       if (unlikely(glob->dummy_read_page == NULL)) {
>>>           ret = -ENOMEM;
>>> @@ -200,7 +201,7 @@ int ttm_device_init(struct ttm_device *bdev, 
>>> const struct ttm_device_funcs *func
>>>       if (WARN_ON(vma_manager == NULL))
>>>           return -EINVAL;
>>> -    ret = ttm_global_init();
>>> +    ret = ttm_global_init(use_dma32);
>>>       if (ret)
>>>           return ret;
>>
>

