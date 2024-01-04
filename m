Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BED8245A8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 17:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D215F10E4DA;
	Thu,  4 Jan 2024 16:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF83610E4DA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 16:02:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ety8Yl3Lv2c+TCGKY9fUOtY/9mvLx66yke5LRh/olOLYTCSbPpS7bZmDA/SwfidiZRzFwE7kL/tPC9xTjiQ801SuOmeEPw/waMyHWHdlC6ZW7RsDI59YXvtxLIxrILiMcfsA0yiajPGhTsdC+zkA4nzAHaHIo19Jbtk0grVRMNB8M+TN55T4r7Hu+OGj+cKmqFMiXTDPP9ppwvhYEW08cWcQKiRd+QTBACVyiHEpK5RtxyaIAnPHphlsN2KdT+X+t01Sq18aXomKvLgkiPfnx+K7wLF0qUcdMoV1sVtZT7y3cmtPEcw/2TcoSCrD4i+O/BdqHiZX6pzcV4CfPVTjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4vYqGatqLndPaZ5jZiKEH/LGzGhnpMHbu2W8EFc++8=;
 b=QjYgydojW6AnmpxEW5beEs/ApJkjinV/v3mpKD7YXr8I0O2Nqlxsuat4tuk/Sc3BZFmjsiwId5hbPcK2UrcItHYnDBzxyYy7Kk6lfEKL80tsTI8csNmal1l9yd+L+IAFgX9PZHSxEOiAMmL0hWrJG5St8IusZjb6MgGDmNFOSpCWrMgU5CDyJABVHOqINcEW49HolWvOcAhI5vnmLQ/7xaJgdLyw1KRpuNCRLLXUKpuCS0pb7GowQCY0IV5oD9j7jaAJa+PPzfZVOJY352INJgMEy9rSQavGpnhkCYGj0D55JyA8VJ1ctgSVMMiMqSipfJQQkSYy395bvj+s4xuQtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4vYqGatqLndPaZ5jZiKEH/LGzGhnpMHbu2W8EFc++8=;
 b=W4082Xji5nDn4ZoUA28Uw+vqOy+X5wfDpNs255gqIhRWGU7qPlafkJUfn5Hz/Rlofq2STZhzjAUmov1ArCRce33+7KFNn+2rhyjtUfWrJy2vN5YYnhBhiLScscEb67UfM753uhWvWbZu5A6rsgkAxXNUJjtlBiFcYlbOFVVoOew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 16:02:36 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66%7]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 16:02:36 +0000
Message-ID: <a08baedd-75f8-4099-b465-0db9001bd719@amd.com>
Date: Thu, 4 Jan 2024 11:02:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: DRM TTM stack trace dump on ancient hardware
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Olliver Schinagl <oliver@schinagl.nl>, dri-devel@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alex Deucher <Alexander.Deucher@amd.com>
References: <0660cc7e-fa24-4dd7-8738-f89c774b05e7@schinagl.nl>
 <d1988a18-d400-4a55-88bb-045d6eea4f41@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <d1988a18-d400-4a55-88bb-045d6eea4f41@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: YQBPR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::36) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c56b4c-7c09-4c7d-def8-08dc0d3e91ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nI6V8QFzE8NS4yfknfUPPpZAdzAT2JKfIJpcbuUMmCnxM4tTIQ9eJRU0WN1IQKmZnLbE9S2VPzabnXPQETkgeVMaPGmsg+XiQvNt8DcXEnoWQcQrCuaGgKCqvzUn+ER/AnXXIu2yzBTY7BGBqdQXxLLWCtJXaTFIZQkeYg32z9jjFo3OQmuQJhADHTfYqxPC0c4ESoIh4Hkkp4z/924lyHnnAJknpzbw9Zpn6EMsklZmlUIrnLFUjAXlmcy9AtrpxFi++z1QqtDABCIypCQxEJ7khnn6cNFSxn1RLvf2aG4WVC0TY6Rw3pxCWmK/5fa5BmEluEyxDyPQPKffKt6N8h+Es0hEVeQ3548xODs955F42zEIMYs8/H3/0GzDcz+J90gdu9a/SkLhbED4siSgxHWEMvur1S0Griff5DXYJfIF/tG0rtprkfiBUyoMaLCFWVXmHwpoqTnKgacrG22HinF2phiFi1l3vnsdCz3snTXFUqmgokz8ArAj04Y7l9fx+DpeXzERjFFZ1NKRbPxJuL7uAv+Uw9vVcr7UOVRc2p/h3H+VFV+pvL3f1wF826ytaIX8vM4krIKeX43xGpi6gay97kxUXyJTjnwqVkVaBz50rUx/kltIrmIZIXYBKJpvVkAIczwECHdTIVp3Zi/ib+5UyQK90kIkbqvtC3H5dzUSxGvsHYxZ/m/CzhJ9jk0i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(66556008)(4326008)(66946007)(45080400002)(6636002)(478600001)(8936002)(66476007)(8676002)(110136005)(54906003)(83380400001)(6486002)(6666004)(53546011)(6512007)(6506007)(2616005)(316002)(66574015)(26005)(41300700001)(44832011)(2906002)(5660300002)(36756003)(38100700002)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUgzOWJyUFBYakk3c1l5V0FiWVlKT2RRWHc3ejdJbGRjVW1YK0IvdWZLbHhu?=
 =?utf-8?B?MDdkSzg4eExiZGpjZ2NKN1NWQTBGRGI5MGdEZVNwbFY2aEx6LzFBR0VZSHZX?=
 =?utf-8?B?RTRXdFFIeTArbjE2MVZOanpraDg4dEw2U3MyYTVUQUdFM0JZbnZ4RGhpRWsy?=
 =?utf-8?B?dXl3Qm1HQldKYUl2Yk84Slphb2M4TVZCbUtzcU5EWEpYc3Btd1M0QkYxSktv?=
 =?utf-8?B?NmtHeWlFS0JoYVU3aWVZQlFtV2ZmUXFSWXFDMmNaaHErT2dqRnlZNDBUZWxm?=
 =?utf-8?B?OXY0ZUdhb1BjaW1XTkN6Ynd0Y2w2a0ZCODRnWnZmRFVyOTlEdm9zZ3F2Y1pV?=
 =?utf-8?B?S3dFUzVBaytvdTBCdVF4NkxkbUlzUnUxaHhsOTFQVFZ5dVRTeU1rK20zdis1?=
 =?utf-8?B?Vis4ZzFzdmJPSk55aHlsUnArTUR4SnlpSXVPbEp3YXdQKysvUHYxU0pZMjR2?=
 =?utf-8?B?NnlZYks2dmtWUHEvNWdFQm1nVUIwZ3J6MzY3ZlJwbHM2am9LTEgrdnNBYXFq?=
 =?utf-8?B?cE9rUURmYmU4UXozTEExMlRMRVQxR3hCbGNpUWtJWVAyTWhhd05iZ0xiMThJ?=
 =?utf-8?B?NE1HdHdGN0UyaVEwYjhPZEQ0eWhXV3JrWVd4Y2FMQytMaVdGcVhPanQxc0Js?=
 =?utf-8?B?MkI0ZDQ0ZWJyOS9Qd21KQlprK3Q1NDNvZlNoemxUcHkremVpQ0I0dXE5ZHdM?=
 =?utf-8?B?RHhNQXI4b05hSXhlM0VSTEFleTdCTUNWMFJRT3hMbTdUQnJNcHN2blFaeTRE?=
 =?utf-8?B?MTkzamZMZHEySlMxN01Dc0RJVmVCa1d3QU00K2dSajl3VnlKZEdjaGhWN2ht?=
 =?utf-8?B?WWcwRVVtd1h5UWFiSzVXZUxMMUZ5bkwxY216Yms5cjJrbW5qdTRYR093ZVVI?=
 =?utf-8?B?M3lSVWViNTVBVzQxVEdpMGpkdTRnSnluL2EyT0cwWjhlSnF4TGZkanJMYkJL?=
 =?utf-8?B?Nm90ZDh2bSttejJ1VXI2aUpHRGRHRWt1WWVWSnh2dHhwdVVzN3o0Y3pEOVAr?=
 =?utf-8?B?NDdJOTJ0clFleloxTlFQRXRTRVFPRytrNmg5UDdobkwwZVJpWWdrV3JhNk5z?=
 =?utf-8?B?SG5wTGFVUkpZY1VqNDN1aWJXNUNSVlpzNzJTdUVMNGhZaHZGSUhiL2dMRmM1?=
 =?utf-8?B?enRPMVg5dFVnV08rTVN6eXd3Rlp4cFI0ZUxvanVoaUlzR0VPNCtsZThqRFVo?=
 =?utf-8?B?cXkwYTNFMzB3UDJwdDRPa3ZCaVhWM25TcWRuVnFzWHNLUlBGZTJyMEVSRzA4?=
 =?utf-8?B?VVFjbDFJYTJ0K1A2K2M2RmpGWVpSTWVER3lnZi94djJDNWtzL1hlbVpTZFBZ?=
 =?utf-8?B?Q1YvQ1psWThVT0JGeHJORlFUNEFvSm94VVZWaGU4cVZGN3RkTW5RNFk4a0FO?=
 =?utf-8?B?aFg3dE8rSlNxcXFEV2pUaGRIUFNCd3dheXY1TUZqU1BBYXpmMzhva28rbm9V?=
 =?utf-8?B?YWV0ZXhkcHNxcEtlZ3Nvc2RGU1o5cVhGN1NZTURwMEdwUWFCN3I1U2t1U3dD?=
 =?utf-8?B?OWRNWjg1MXZlTU5STDgxTll3MStaNVluY2pDRmppcGdMRlpkTkJoMkJESnlk?=
 =?utf-8?B?UUxvZUQ4c0srNWtFZTRRb3F0U042TUo4dVc1cnp0bm84NEk3bFRBNjByNHpC?=
 =?utf-8?B?UHhjMDJTTHBFRFQ1OERpdU1pVmJLa0pVckdDbjZodzlzVTAxS0xRSE9LejF0?=
 =?utf-8?B?WnRUekIxZzhmMHVPTWxsN1MyZzFvMFA3ejZiUzhIZEgva2s5bTI4OXVEc00v?=
 =?utf-8?B?WWJSWC9SN29PVDI4ODU0Q3M2L2VSQkw4bnpHS2wyVGFLVjNNNm5CT0ZhM3V4?=
 =?utf-8?B?WHgrVkJGSjkvSEFOdkVMRThkU3V2M3gyNTAzczk1aXoxZlFjOXlxUXBBQktW?=
 =?utf-8?B?eE5UNkg5MXU2ZCtQM2hBUWxlWkEveHRxL3labnVVU2NDVm9YcTF6Y2hlc0NX?=
 =?utf-8?B?SU5wcU5IeGxmMHlNbEV2azVFcnY0VEZYdUllVzlVSy9DbUh3RmhKWFdKZFNB?=
 =?utf-8?B?MkxOK05tdXZiWWN6WTR2MFgzZkpTOXc2RGg0cTJ2K3R4TW5PK3MxYklxWnNP?=
 =?utf-8?B?VVdSeUxBVnVnV0lxQzFPK2l6Q2pWWTRQYmZDSUdHYVlObjJhOVRndVlvd1Uz?=
 =?utf-8?Q?DNzsaZrngwQsF1ks2nnwTL/wC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c56b4c-7c09-4c7d-def8-08dc0d3e91ca
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 16:02:36.7120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daHntt/eM5o9hBaUePVvG2bDUfZXmLqiHLhp9z+zx4CtzsWYx+KRNL4O5TyHZgmLkduMeCdwuD4P6lZud4JNsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8022
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
Cc: Huang Rui <ray.huang@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oland is DCE 6 and won't default to DC.

Harry

On 2024-01-04 10:51, Christian K=C3=B6nig wrote:
> Hi Olliver,
>
> well as long as you don't explicitly disable the support for the older hw=
 generations the=C2=A0R7 250 is still supported and should still work perfe=
ctly fine.
>
> What you see here is basically some reference counting issue, most likely=
 in the display code.
>
> Question to Alex and Harry is CIK already using DC or the classic display=
 code? If it's DC then it looks like we either miss unpinning a BO or grabb=
ing a reference to a BO.
>
> Regards,
> Christian.
>
> Am 04.01.24 um 16:38 schrieb Olliver Schinagl:
>> Sorry for just dumping this here, but for those that think this is impor=
tant, just rebooted after a weird btrfs crash (remounted r/o, no dataloss i=
t seems), probably a new kernel, and got duped with the following. Things '=
seem' to work fine however. I don't even know how or where to google for th=
is one.
>>
>>
>> My graphics card is I think the R7 250, or some old beast like that, and=
 I also know i'm probably shouldn't be using amdgpu on this oldtimer?
>>
>> Linux 6.6.9-arch1-1 #1 SMP PREEMPT_DYNAMIC Tue, 02 Jan 2024 02:28:28 +00=
00 x86_64 GNU/Linux
>> 01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI=
] Oland XT [Radeon HD 8670 / R5 340X OEM / R7 250/350/350X OEM]
>> model name=C2=A0=C2=A0=C2=A0 : AMD FX(tm)-8350 Eight-Core Processor
>>
>> [=C2=A0=C2=A0=C2=A0 0.000000] Command line: BOOT_IMAGE=3D/arch_root/boot=
/vmlinuz-linux root=3DUUID=3Dd rw rootflags=3Dsubvol=3Darch_root radeon.aud=
io=3D1 radeon.si_support=3D0 radeon.cik_support=3D0 amdgpu.si_support=3D1 a=
mdgpu.cik_support=3D1 LANG=3Den_US.UTF-8 ivrs_ioapic=3D9@0000:00:14.0 ivrs_=
ioapic=3D10@0000:00:00.2 noibrs noibpb nopti mitigations=3Doff
>> [=C2=A0=C2=A0=C2=A0 0.091847] Kernel command line: BOOT_IMAGE=3D/arch_ro=
ot/boot/vmlinuz-linux root=3DUUID=3Dd rw rootflags=3Dsubvol=3Darch_root rad=
eon.audio=3D1 radeon.si_support=3D0 radeon.cik_support=3D0 amdgpu.si_suppor=
t=3D1 amdgpu.cik_support=3D1 LANG=3Den_US.UTF-8 ivrs_ioapic=3D9@0000:00:14.=
0 ivrs_ioapic=3D10@0000:00:00.2 noibrs noibpb nopti mitigations=3Doff
>> [=C2=A0=C2=A0=C2=A0 1.490484] [drm] radeon kernel modesetting enabled.
>> [=C2=A0=C2=A0=C2=A0 1.490565] radeon 0000:01:00.0: SI support disabled b=
y module param
>> [=C2=A0=C2=A0=C2=A0 4.627771] [drm] amdgpu kernel modesetting enabled.
>> [=C2=A0=C2=A0=C2=A0 4.627955] amdgpu: Virtual CRAT table created for CPU
>> [=C2=A0=C2=A0=C2=A0 4.627967] amdgpu: Topology: Add CPU node
>> [=C2=A0=C2=A0=C2=A0 4.650039] amdgpu 0000:01:00.0: amdgpu: Fetched VBIOS=
 from ROM BAR
>> [=C2=A0=C2=A0=C2=A0 4.650042] amdgpu: ATOM BIOS: 113-C6620600-S01
>> [=C2=A0=C2=A0=C2=A0 4.650054] kfd kfd: amdgpu: OLAND=C2=A0 not supported=
 in kfd
>> [=C2=A0=C2=A0=C2=A0 4.678004] amdgpu 0000:01:00.0: vgaarb: deactivate vg=
a console
>> [=C2=A0=C2=A0=C2=A0 4.678007] amdgpu 0000:01:00.0: amdgpu: Trusted Memor=
y Zone (TMZ) feature not supported
>> [=C2=A0=C2=A0=C2=A0 4.678010] amdgpu 0000:01:00.0: amdgpu: PCIE atomic o=
ps is not supported
>> [=C2=A0=C2=A0=C2=A0 4.678715] amdgpu 0000:01:00.0: amdgpu: VRAM: 2048M 0=
x000000F400000000 - 0x000000F47FFFFFFF (2048M used)
>> [=C2=A0=C2=A0=C2=A0 4.678718] amdgpu 0000:01:00.0: amdgpu: GART: 1024M 0=
x000000FF00000000 - 0x000000FF3FFFFFFF
>> [=C2=A0=C2=A0=C2=A0 4.678878] [drm] amdgpu: 2048M of VRAM memory ready
>> [=C2=A0=C2=A0=C2=A0 4.678880] [drm] amdgpu: 11487M of GTT memory ready.
>> [=C2=A0=C2=A0=C2=A0 4.679218] amdgpu 0000:01:00.0: amdgpu: PCIE GART of =
1024M enabled (table at 0x000000F400400000).
>> [=C2=A0=C2=A0=C2=A0 4.680506] [drm] amdgpu: dpm initialized
>> [=C2=A0=C2=A0=C2=A0 4.680527] [drm] AMDGPU Display Connectors
>> [=C2=A0=C2=A0=C2=A0 5.209956] amdgpu 0000:01:00.0: amdgpu: SE 1, SH per =
SE 1, CU per SH 6, active_cu_number 6
>> [=C2=A0=C2=A0=C2=A0 5.521572] [drm] Initialized amdgpu 3.54.0 20150101 f=
or 0000:01:00.0 on minor 1
>> [=C2=A0=C2=A0=C2=A0 5.670853] fbcon: amdgpudrmfb (fb0) is primary device
>> [=C2=A0=C2=A0=C2=A0 5.731643] amdgpu 0000:01:00.0: [drm] fb0: amdgpudrmf=
b frame buffer device
>>
>> But kernel dumps like this are usually not a good thing (tm).
>>
>> [=C2=A0=C2=A0 32.161704] ------------[ cut here ]------------
>> [=C2=A0=C2=A0 32.161708] WARNING: CPU: 0 PID: 603 at drivers/gpu/drm/ttm=
/ttm_bo.c:326 ttm_bo_release+0x292/0x2e0 [ttm]
>> [=C2=A0=C2=A0 32.161726] Modules linked in: xt_conntrack xt_MASQUERADE n=
f_conntrack_netlink iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defra=
g_ipv4 xt_addrtype iptable_filter br_netfilter bridge rfcomm snd_seq_dummy =
snd_hrtimer snd_seq snd_seq_device overlay 8021q garp mrp stp llc cmac algi=
f_hash algif_skcipher af_alg bnep it87 hwmon_vid edac_mce_amd kvm_amd ccp s=
nd_hda_codec_realtek kvm snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_i=
ntel btusb irqbypass snd_intel_dspcfg btrtl crct10dif_pclmul snd_intel_sdw_=
acpi btintel crc32_pclmul btbcm polyval_clmulni snd_hda_codec eeepc_wmi btm=
tk polyval_generic gf128mul asus_wmi bluetooth snd_hda_core ledtrig_audio g=
hash_clmulni_intel r8169 sparse_keymap sha512_ssse3 snd_hwdep sha1_ssse3 pl=
atform_profile snd_pcm i8042 ecdh_generic aesni_intel serio realtek sp5100_=
tco snd_timer crypto_simd mdio_devres wmi_bmof rfkill cryptd pcspkr acpi_cp=
ufreq k10temp fam15h_power i2c_piix4 snd crc16 soundcore libphy joydev mous=
edev mac_hid vfat fat sg
>> crypto_user fuse dm_mod loop nfnetlink ip_tables
>> [=C2=A0=C2=A0 32.161780]=C2=A0 x_tables usbhid amdgpu drm_exec amdxcp dr=
m_buddy gpu_sched btrfs radeon blake2b_generic libcrc32c crc32c_generic xor=
 raid6_pq drm_ttm_helper ttm video nvme i2c_algo_bit drm_suballoc_helper cr=
c32c_intel nvme_core sha256_ssse3 drm_display_helper nvme_common xhci_pci c=
ec xhci_pci_renesas wmi uas usb_storage
>> [=C2=A0=C2=A0 32.161800] CPU: 0 PID: 603 Comm: Xorg Not tainted 6.6.9-ar=
ch1-1 #1 e215ab44d1af91c0f0e686ff953f296051be417c
>> [=C2=A0=C2=A0 32.161803] Hardware name: To be filled by O.E.M. To be fil=
led by O.E.M./M5A97, BIOS 1605 10/25/2012
>> [=C2=A0=C2=A0 32.161804] RIP: 0010:ttm_bo_release+0x292/0x2e0 [ttm]
>> [=C2=A0=C2=A0 32.161816] Code: 49 8b b4 24 40 08 00 00 48 83 c4 38 48 8d=
 53 30 bf 40 01 00 00 5b 5d 41 5c 41 5d 41 5e e9 26 29 68 d1 4c 89 e7 e9 5b=
 fe ff ff <0f> 0b 48 83 7b 20 00 0f 84 a6 fd ff ff 0f 0b e9 9f fd ff ff c7 =
43
>> [=C2=A0=C2=A0 32.161818] RSP: 0018:ffffb02cc0cdbc18 EFLAGS: 00010202
>> [=C2=A0=C2=A0 32.161820] RAX: 0000000000000000 RBX: ffff9291c073fdd0 RCX=
: 0000000000400033
>> [=C2=A0=C2=A0 32.161821] RDX: 0000000000000001 RSI: 0000000000000000 RDI=
: ffff9291c073fdd0
>> [=C2=A0=C2=A0 32.161823] RBP: ffff9291c073fc58 R08: 0000000000000000 R09=
: 0000000000400033
>> [=C2=A0=C2=A0 32.161824] R10: ffff9291622bb780 R11: 0000000000000000 R12=
: ffff92914c98eee0
>> [=C2=A0=C2=A0 32.161825] R13: 0000000000000001 R14: ffff92917835c848 R15=
: ffff9291c6418788
>> [=C2=A0=C2=A0 32.161826] FS:=C2=A0 00007f0691a205c0(0000) GS:ffff929627c=
00000(0000) knlGS:0000000000000000
>> [=C2=A0=C2=A0 32.161828] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 000000008=
0050033
>> [=C2=A0=C2=A0 32.161829] CR2: 00007f0690d78c2c CR3: 00000002df620000 CR4=
: 00000000000406f0
>> [=C2=A0=C2=A0 32.161831] Call Trace:
>> [=C2=A0=C2=A0 32.161832]=C2=A0 <TASK>
>> [=C2=A0=C2=A0 32.161833]=C2=A0 ? ttm_bo_release+0x292/0x2e0 [ttm d3be1c6=
b438b7d4abed1793b797fc6e1ac6a8908]
>> [=C2=A0=C2=A0 32.161844]=C2=A0 ? __warn+0x81/0x130
>> [=C2=A0=C2=A0 32.161849]=C2=A0 ? ttm_bo_release+0x292/0x2e0 [ttm d3be1c6=
b438b7d4abed1793b797fc6e1ac6a8908]
>> [=C2=A0=C2=A0 32.161861]=C2=A0 ? report_bug+0x171/0x1a0
>> [=C2=A0=C2=A0 32.161866]=C2=A0 ? handle_bug+0x3c/0x80
>> [=C2=A0=C2=A0 32.161868]=C2=A0 ? exc_invalid_op+0x17/0x70
>> [=C2=A0=C2=A0 32.161870]=C2=A0 ? asm_exc_invalid_op+0x1a/0x20
>> [=C2=A0=C2=A0 32.161875]=C2=A0 ? ttm_bo_release+0x292/0x2e0 [ttm d3be1c6=
b438b7d4abed1793b797fc6e1ac6a8908]
>> [=C2=A0=C2=A0 32.161887]=C2=A0 amdgpu_bo_unref+0x1e/0x30 [amdgpu 2f3ce60=
5d8443bb7ca6dfe278dd999d24fdac211]
>> [=C2=A0=C2=A0 32.162520]=C2=A0 amdgpu_gem_object_free+0x34/0x60 [amdgpu =
2f3ce605d8443bb7ca6dfe278dd999d24fdac211]
>> [=C2=A0=C2=A0 32.162978]=C2=A0 drm_gem_object_release_handle+0x54/0x60
>> [=C2=A0=C2=A0 32.162984]=C2=A0 ? __pfx_drm_gem_object_release_handle+0x1=
0/0x10
>> [=C2=A0=C2=A0 32.162987]=C2=A0 idr_for_each+0x71/0xf0
>> [=C2=A0=C2=A0 32.162991]=C2=A0 drm_gem_release+0x20/0x30
>> [=C2=A0=C2=A0 32.162995]=C2=A0 drm_file_free+0x1f8/0x270
>> [=C2=A0=C2=A0 32.162999]=C2=A0 drm_release+0x74/0xf0
>> [=C2=A0=C2=A0 32.163002]=C2=A0 __fput+0xea/0x290
>> [=C2=A0=C2=A0 32.163007]=C2=A0 task_work_run+0x5a/0x90
>> [=C2=A0=C2=A0 32.163011]=C2=A0 do_exit+0x377/0xb20
>> [=C2=A0=C2=A0 32.163014]=C2=A0 ? asm_sysvec_apic_timer_interrupt+0x1a/0x=
20
>> [=C2=A0=C2=A0 32.163019]=C2=A0 do_group_exit+0x31/0x80
>> [=C2=A0=C2=A0 32.163022]=C2=A0 __x64_sys_exit_group+0x18/0x20
>> [=C2=A0=C2=A0 32.163025]=C2=A0 do_syscall_64+0x5d/0x90
>> [=C2=A0=C2=A0 32.163029]=C2=A0 ? __count_memcg_events+0x42/0x90
>> [=C2=A0=C2=A0 32.163033]=C2=A0 ? count_memcg_events.constprop.0+0x1a/0x3=
0
>> [=C2=A0=C2=A0 32.163037]=C2=A0 ? handle_mm_fault+0xa2/0x360
>> [=C2=A0=C2=A0 32.163040]=C2=A0 ? do_user_addr_fault+0x30f/0x660
>> [=C2=A0=C2=A0 32.163043]=C2=A0 ? exc_page_fault+0x7f/0x180
>> [=C2=A0=C2=A0 32.163045]=C2=A0 entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>> [=C2=A0=C2=A0 32.163048] RIP: 0033:0x7f069171ce2d
>> [=C2=A0=C2=A0 32.163074] Code: Unable to access opcode bytes at 0x7f0691=
71ce03.
>> [=C2=A0=C2=A0 32.163075] RSP: 002b:00007fff0d3ba328 EFLAGS: 00000202 ORI=
G_RAX: 00000000000000e7
>> [=C2=A0=C2=A0 32.163077] RAX: ffffffffffffffda RBX: 00007f069181cfa8 RCX=
: 00007f069171ce2d
>> [=C2=A0=C2=A0 32.163079] RDX: 00000000000000e7 RSI: fffffffffffffd08 RDI=
: 0000000000000000
>> [=C2=A0=C2=A0 32.163080] RBP: 0000000000000883 R08: 0000000562be99f3 R09=
: 0000000000000000
>> [=C2=A0=C2=A0 32.163081] R10: 0000562be99f3690 R11: 0000000000000202 R12=
: 0000000000000000
>> [=C2=A0=C2=A0 32.163082] R13: 0000000000000000 R14: 00007f069181b680 R15=
: 00007f069181cfc0
>> [=C2=A0=C2=A0 32.163085]=C2=A0 </TASK>
>> [=C2=A0=C2=A0 32.163086] ---[ end trace 0000000000000000 ]---
>>
>>
>> Thanks,
>>
>> Olliver
>>
>

