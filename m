Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85627973D5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 17:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF9510E808;
	Thu,  7 Sep 2023 15:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA5710E7FF;
 Thu,  7 Sep 2023 15:32:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJMuztXVbbkxt6I0P+dgauOSVo41VWGeoPECBXvAh0tIxdy9sj6yYvPT0i61iEOjnYtxXdWQA+rh675Qz3pGcHwxyz6Enl+14QdXFe+dQwVP7YZxKfOXss+rpXqPRmE1Pu+Q5uU9S9rTQHHo5a0n5eQf1+cpPeMz/k2b6kpiYla9XhombtxL981AWMwprYP5FvTmNIU47dTzUU5FBu/NL/vIqLq0Lg+D1xLjtN1IXS0fJHCXCLEZ9UU1Ko/HH+f35b8hmvGT3hVr0TtMg5va2uwghznWrcjy1vZrMBVWf1/xZDu9m537zutFkeOR3FPlGcUaKc0DWGIrzXu77WXphA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON+qCcuIT9lnJHBnX2YhEvNdUdOlHivl3e/kOI/CSNs=;
 b=dMekQiunsxKeX2S6/DXkdD2okIPW+HOqIiJkAU6oo/5myl2h+kuRRVwTYVmzC6zbDeBFkJ4upvvxfrpz7L/LuoRuLFeY2QCpuwLmXNhVewPm9MnwI66bxalz7FSGrz3W1bdbYylUzV7bsrmhWDjUn6OUQGRQvTlAT3w6Su2ktrYV9HEpSJKnxNe7gqkEfCgh6ZkdPt0JeRB4iRg0rk+sW53aKSj7V0w2PhTcPXgWNAPIeqNO5MmnMNSQxtd5vVwpK5BDcPmO+dZOAy31P1GOgB+NIWrU/C0wWjbAxsCbCY7BQd4PFcvahzZabJH0JaQAn38dRkfeB6z0Jb2L5utA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON+qCcuIT9lnJHBnX2YhEvNdUdOlHivl3e/kOI/CSNs=;
 b=psE7/m3qS9SajtRZwMuA4rX8pR9kP4LKNhTQnqEVOmQCa96yC59JbJOKhKYUt2oX8781wrxU7oO08dqGgRGeQ3UF9kua8t+YeUCnQLAchj8Ck13KE378SEZHyH9h7w8QBTzjEJymep6C19JaBemhcz+QYIzc0cyqvfi+4HDLtgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6251.namprd12.prod.outlook.com (2603:10b6:930:21::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 15:32:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 15:32:43 +0000
Message-ID: <04e0d93c-184d-000d-1c99-c88ff4affede@amd.com>
Date: Thu, 7 Sep 2023 17:32:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas
 <bhelgaas@google.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <2adfa653-ac35-d560-be52-c92848a1eef5@gmail.com>
 <b51d49f3-e3de-6b8d-9cb4-df5c03f3cdc0@loongson.cn>
 <10509692-ce04-e225-5a27-abc955554bdc@gmail.com>
 <a9af88c5-4509-96ff-a7fd-a0f72d2f1e6a@linux.dev>
 <127fab21-bc5c-f782-e42b-1092fbb8df34@amd.com>
 <5d9f9780-995f-33dc-e3db-3112aa085062@loongson.cn>
 <714d5ecf-f0dd-c099-0970-9ee765d35161@amd.com>
 <d3c38433-a23e-56b3-634a-9bb4c492245d@loongson.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <d3c38433-a23e-56b3-634a-9bb4c492245d@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b8d916-2c8a-4f5d-2177-08dbafb7ad78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJHsurx6mkg4Anusds5Ba859hq6Kmc5rfEhP6n4zG8Yn6kceXyxQvn2MhefnA8+XMECA/UbVJmwibtigQ8tn1J5ZLzt8MDQfm92kPfeD+ZOICZi1AuL0yQBk7iTZGNVEWWbD9KDLKT3sRLshpURumjvVK6XH6truHCQ2owcbPEzLo66S1z/SwxCWdB0QaJUXAIUdPH23R3GeZzpVYen5tHhFgRbNdj9gHjNQ9D7n+OxVre2SkNjbwRSV6pBaB1pm3qdM/nzUFBOe677vfMhyLRx5onW8+Vo/dGzr5iP8RFmRqWo+GCwHn0qnF/EkYItQ2Bi/FwstTnGwxqqlL4r0ss47lLUFEM8x2VMMxnUE8UWfRd43aHTEsImbJEHWeMsia7nte2BYFWpfA9Dju+5GKj+wu2JbgJVp4AfAVYflAXJcIi8cOAQeHfFy1yhKWkC8wbBnxm8Ov3lTMQM1Gwh9CX/7vmkrfZZeB6t7weWhCV5nGij7KaX4317+ftVWhikBud0rsQyf6cmjqf1Fh7tPj5dw2XV320ffScClEmDgDG+jUhZR/u5gCp0GaeGeqsPPFA7GAfWhXwtuDVDwHT9pRqVxIFpINFSLwoKoCG9l4X4XDaUIlNZzzuS874etu3m8vaFKPYQdaPHJAXhXzo7z+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(186009)(1800799009)(451199024)(2616005)(38100700002)(26005)(6486002)(6506007)(6512007)(36756003)(83380400001)(66574015)(31696002)(86362001)(5660300002)(966005)(7416002)(41300700001)(66556008)(316002)(66946007)(66476007)(110136005)(8676002)(4326008)(8936002)(6636002)(31686004)(6666004)(2906002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm1aVElNeEtSQWJ2VHBTcHhhV1V2K0hFMUJuUFFITHlpSG4rcGhnWWZ3MkZv?=
 =?utf-8?B?dEZ0YnducHAxeVVUT1k1UFJGeVp2a1lDeVBoM0czK0ZXdGxBSzBXYnNxemp6?=
 =?utf-8?B?UGRtbnU0RXg3RGdoV280Sk9IN1NicXBmdjJEUWFhdkpmSmhEdzRYbFVuUm5D?=
 =?utf-8?B?azRnSktzdmREcUt6SU1kVzY3c0N4RkFwd0k0QXQ2NVhCSWNhS20vMHBoZ2dP?=
 =?utf-8?B?TTFqMUJJMkpKbzdvbnhjWmdXWkRvSnBROUtxMDFVUFkyNVlveGhrUWZSUVVI?=
 =?utf-8?B?ZXI4eUdtb2lNSjdFanh0akNEVnlhSjZiZEJSQUVFTUV6ZFhXNzZ2Q0V0RXNN?=
 =?utf-8?B?dkNxcFdUVXlVNTZ5MG5wZUVZd2M4TU8xZFVRYW50eFYyTUp0d0Q1eHBoWmc1?=
 =?utf-8?B?eDJJSTRodkVrL0l6aHpCQUZncHBlbG5ja3VVSFBtN2dmN1VDUkNTeFNZbjhn?=
 =?utf-8?B?dnJWWmdMM2NxeFAxcHhycktIZmZJOUJwVXpacFZDdkpwblMzRlQ5Q0I0ZjBj?=
 =?utf-8?B?QUZTN2xjbjI1Q1I3ZHVtdW16bXVuSXpxaitURGc4Z2VOR0cxQUdnaGFaYkJn?=
 =?utf-8?B?d3U2MUJ3TlhKWXhCZDVkMDBCYzJvbnZHNk5aM053c3NrNXVjNk1qOU9nZnc2?=
 =?utf-8?B?ZUVhem5GSldGQk5XODVYVDZQb1JjTHppQzU4cHVCMlhkODNxTVk3aDhmODZ2?=
 =?utf-8?B?VkdFS0NvbmRPMytMRXRETTQyM2xKOTNsZHJCUXJ5SEJyTUFKMk9MbzREcFNn?=
 =?utf-8?B?ZnJWZldzRDBoQnE2TVBjTi9ZdmdJUkRSZjgvVnMwQXFBeWhNTmh2ZGdOcjZT?=
 =?utf-8?B?LzhMQzNqSHd5WHB2QVpXQXE3T0ZqRy9LQ1hrK2ZrbHlnWkI3a0xDclZHcjN4?=
 =?utf-8?B?SXE2dVcwZURHTXVsbThQVlRpUWxxTEtGbjViZHNjY3BHZEQyRG5sajBiZVhm?=
 =?utf-8?B?ZzNkWGc0QWpBMHU4OXVEUytIemIzcFlwL2s3WXhCUzBQOWhiMlBVZ2ZsZ3Z1?=
 =?utf-8?B?ZDNkTzlmcUNJU3BhSVNUY3l4UkVnRnJVd0JBN2wxRnloN2h2dERadG10dWIv?=
 =?utf-8?B?djd6b0VIYjVTUnpVR2VaZHgyK2NuZCtZMGFoaFl6TjRPNmN6NkxkL3FWczNx?=
 =?utf-8?B?b1NrMGVjenI0Y3FERUVHM0d5Zkl2Z3drQWNxcm5EQUhET3FwOThVbXhlTjhl?=
 =?utf-8?B?L3ZjZjd6aUhwdW5pSDNta215NGE5WGkyWW10Sm5SamRzL3M3WmkwRGxEcTcw?=
 =?utf-8?B?ZllBb1BVdEZ2R1NEZDhBMDdzUGt3QnM1cXErQU16dm5VbkxMa1g5QSt6dmtG?=
 =?utf-8?B?UW44OHM0SjdGY2tINFMwK0U4c1VabnFCQ1VtY29xV25ROFdxNlYxZFFJeGlG?=
 =?utf-8?B?TnhKZTFKT3pFQnZySjNQREk1TWJERm05eGlQN1ZVaEJsUGxhUi9NMDRDZkV0?=
 =?utf-8?B?RldLSGpyanIxSExabzdEOU52SjZ4WDRwQWpyMDh3c0NLUkFKYkxyZG5maU9P?=
 =?utf-8?B?bVRzVUJqdEgzQ3h4dy9RbTN3aTNRRndiaGtyV01WVkwvbGpSK1c4V2FCa2VH?=
 =?utf-8?B?Mmg2L2gzdmR4VGFWQWdxb1MwamR5R2R3dTgrVENoRURkVDlTVkxCZTFoRkJQ?=
 =?utf-8?B?MjNlTWJHUmNWT012emRhWSszVTA3eHhReG1odkhHc1NGaW1yMjdNUEpYWlpk?=
 =?utf-8?B?TnlGZ3JTK1BOblBUQnJvcXRmZy8xaEROU1lmOVBoVTlZNDlOM2hYZVNISm80?=
 =?utf-8?B?bWRZRTVwT2E3dmRMbU9uYXd1WDVMRW1mRFZnVzZhT0J3NXd4TEg4TFRvcHg1?=
 =?utf-8?B?QVFicFplQmplUlpQOXdiZ09hNmhINU5nK3hHMDI4STNUWHBtY01VN3NTaFlP?=
 =?utf-8?B?TW5tSjNuUEl4M3RHaUVaVHJGcmV3aHZRSnVteG5ESHdPWFhpejZKVXEwNXdQ?=
 =?utf-8?B?T2RQNmh2QWNKdHlWUkh3Z1RMci90NVFlWVdZUmlYaDFkcUo3QzRoRXovNFI5?=
 =?utf-8?B?bzA3M3U5R21pb1pUVFFMYUxvdzBSY1NBenhWZW1rdUloRzFnTUt0TkJLL1lH?=
 =?utf-8?B?cjZ0Z0ZkUHlJUEpzMTBMWWtobFIyN2RzbXFJUFBGano2SEUvemtlRHgydTFu?=
 =?utf-8?Q?xcWMaI7gzu+sTT5tI1eoBC1Cm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b8d916-2c8a-4f5d-2177-08dbafb7ad78
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 15:32:43.0289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HnhqQyqRTRsXcQMNVJyGlR/LUbqzqSDlsYQeYLJDw+VML533wpBfAXOQN0NSDYb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6251
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.09.23 um 17:26 schrieb suijingfeng:
> [SNIP]

> Then, I'll give you another example, see below for elaborate description.
> I have one AMD BC160 GPU, see[1] to get what it looks like.
>
> The GPU don't has a display connector interface exported.
> It actually can be seen as a render-only GPU or compute class GPU for 
> bitcoin.
> But the firmware of it still acclaim this GPU as VGA compatible.
> When mount this GPU onto motherboard, the system always select this 
> GPU as primary.
> But this GPU can't be able to connect with a monitor.
>
> Under such a situation, modprobe.blacklist=amdgpu don't works either,
> because vgaarb always select this GPU as primary, this is a 
> device-level decision.

It's not VGAARB which makes this selection, it's the BIOS. VGAARB just 
detects what the BIOS has decided.

>
> $ dmesg | grep vgaarb:
>
> [    3.541405] pci 0000:0c:00.0: vgaarb: BAR 0: [mem 
> 0xa0000000-0xafffffff 64bit pref] contains firmware FB 
> [0xa0000000-0xa02fffff]
> [    3.901448] pci 0000:05:00.0: vgaarb: setting as boot VGA device
> [    3.905375] pci 0000:05:00.0: vgaarb: VGA device added: 
> decodes=io+mem,owns=none,locks=none
> [    3.905382] pci 0000:0c:00.0: vgaarb: setting as boot VGA device 
> (overriding previous)
> [    3.909375] pci 0000:0c:00.0: vgaarb: VGA device added: 
> decodes=io+mem,owns=io+mem,locks=none
> [    3.913375] pci 0000:0d:00.0: vgaarb: VGA device added: 
> decodes=io+mem,owns=none,locks=none
> [    3.913377] vgaarb: loaded
> [   13.513760] amdgpu 0000:0c:00.0: vgaarb: deactivate vga console
> [   19.020992] amdgpu 0000:0c:00.0: vgaarb: changed VGA decodes: 
> olddecodes=io+mem,decodes=none:owns=io+mem
>
> I'm using ubuntu 22.04 system, with ast.modeset=10 passed on the cmd 
> line,
> I still be able to enter the graphics system. And views this GPU as a 
> render-only GPU.
> Probably continue to examine what's wrong, except this, drm/amdgpu report
> " *ERROR* IB test failed on sdma0 (-110)" to me.
>
> Does this count as problem?

No, again that is perfectly expected behavior.

Some BIOSes (or maybe most by modern standard) allows to override this, 
but if you later override this by the OS you run the hardware outside 
what's validated.

When you put a VGA device into a board with an integrated VGA device the 
integrated one gets disabled. This is even part of some PCIe 
specification IIRC.

So the problems you run into here are perfectly expected.

Regards,
Christian.

>
> Before I could find solution, I have keep this de-fact render only GPU 
> mounted.
> Because I need recompile kennel module, install the kernel module and 
> testing.
>
> All I need is a 2D video card to display something, ast drm is OK, 
> despite simple.
> It suit the need for my daily usage with VIM, that's enough for me.
>
> Now, the real questions that I want ask is:
>
> 1)
>
> Does the fact that when the kernel driver module got blocked (by 
> modprobe.blacklist=amdgpu),
> while the vgaarb still select it as primary which leave the X server 
> crash there (because no kennel space driver loaded)
> count as a problem?
>
>
> 2)
>
> Does my approach that mounting another GPU as the primary display 
> adapter,
> while its real purpose is to solving bugs and development for another 
> GPU,
> count as a use case?
>
>
> $ cat demsg.txt | grep drm
>
> [   10.099888] ACPI: bus type drm_connector registered
> [   11.083920] etnaviv 0000:0d:00.0: [drm] bind etnaviv-display, 
> master name: 0000:0d:00.0
> [   11.084106] [drm] Initialized etnaviv 1.3.0 20151214 for 
> 0000:0d:00.0 on minor 0
> [   13.301702] [drm] amdgpu kernel modesetting enabled.
> [   13.359820] [drm] initializing kernel modesetting (NAVI12 
> 0x1002:0x7360 0x1002:0x0A34 0xC7).
> [   13.368246] [drm] register mmio base: 0xEB100000
> [   13.372861] [drm] register mmio size: 524288
> [   13.380788] [drm] add ip block number 0 <nv_common>
> [   13.385661] [drm] add ip block number 1 <gmc_v10_0>
> [   13.390531] [drm] add ip block number 2 <navi10_ih>
> [   13.395405] [drm] add ip block number 3 <psp>
> [   13.399760] [drm] add ip block number 4 <smu>
> [   13.404111] [drm] add ip block number 5 <dm>
> [   13.408378] [drm] add ip block number 6 <gfx_v10_0>
> [   13.413249] [drm] add ip block number 7 <sdma_v5_0>
> [   13.433546] [drm] add ip block number 8 <vcn_v2_0>
> [   13.433547] [drm] add ip block number 9 <jpeg_v2_0>
> [   13.497757] [drm] VCN decode is enabled in VM mode
> [   13.502540] [drm] VCN encode is enabled in VM mode
> [   13.508785] [drm] JPEG decode is enabled in VM mode
> [   13.529596] [drm] vm size is 262144 GB, 4 levels, block size is 
> 9-bit, fragment size is 9-bit
> [   13.564762] [drm] Detected VRAM RAM=8176M, BAR=256M
> [   13.569628] [drm] RAM width 2048bits HBM
> [   13.574167] [drm] amdgpu: 8176M of VRAM memory ready
> [   13.579125] [drm] amdgpu: 15998M of GTT memory ready.
> [   13.584184] [drm] GART: num cpu pages 131072, num gpu pages 131072
> [   13.590505] [drm] PCIE GART of 512M enabled (table at 
> 0x0000008000300000).
> [   13.598749] [drm] Found VCN firmware Version ENC: 1.16 DEC: 5 VEP: 
> 0 Revision: 4
> [   13.671786] [drm] reserve 0xe00000 from 0x81fd000000 for PSP TMR
> [   13.801235] [drm] Display Core v3.2.247 initialized on DCN 2.0
> [   13.807061] [drm] DP-HDMI FRL PCON supported
> [   13.832382] [drm] kiq ring mec 2 pipe 1 q 0
> [   13.838131] [drm] VCN decode and encode initialized 
> successfully(under DPG Mode).
> [   13.845877] [drm] JPEG decode initialized successfully.
> [   14.072508] [drm] Initialized amdgpu 3.54.0 20150101 for 
> 0000:0c:00.0 on minor 1
> [   14.080976] amdgpu 0000:0c:00.0: [drm] Cannot find any crtc or sizes
> [   14.087341] [drm] DSC precompute is not needed.
> [   16.487330] systemd[1]: Starting Load Kernel Module drm...
> [  619.901873] [drm] PCIE GART of 512M enabled (table at 
> 0x0000008000300000).
> [  619.901898] [drm] PSP is resuming...
> [  619.925307] [drm] reserve 0xe00000 from 0x81fd000000 for PSP TMR
> [  619.991034] [drm] psp gfx command AUTOLOAD_RLC(0x21) failed and 
> response status is (0xFFFF000D)
> [  620.294366] [drm] kiq ring mec 2 pipe 1 q 0
> [  620.298953] [drm] VCN decode and encode initialized 
> successfully(under DPG Mode).
> [  620.299103] [drm] JPEG decode initialized successfully.
> [  621.309543] [drm:sdma_v5_0_ring_test_ib [amdgpu]] *ERROR* amdgpu: 
> IB test timed out
> [  621.317577] amdgpu 0000:0c:00.0: [drm:amdgpu_ib_ring_tests 
> [amdgpu]] *ERROR* IB test failed on sdma0 (-110).
> [  622.333548] [drm:sdma_v5_0_ring_test_ib [amdgpu]] *ERROR* amdgpu: 
> IB test timed out
> [  622.341587] amdgpu 0000:0c:00.0: [drm:amdgpu_ib_ring_tests 
> [amdgpu]] *ERROR* IB test failed on sdma1 (-110).
> [  622.354071] [drm:amdgpu_device_delayed_init_work_handler [amdgpu]] 
> *ERROR* ib ring test failed (-110).
> [  622.363721] amdgpu 0000:0c:00.0: [drm] Cannot find any crtc or sizes
>
> [1] https://www.techpowerup.com/gpu-specs/xfx-bc-160.b9346
>
>

