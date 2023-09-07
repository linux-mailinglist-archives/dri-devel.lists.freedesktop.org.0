Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D96797120
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 11:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238FB10E793;
	Thu,  7 Sep 2023 09:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE87E10E078;
 Thu,  7 Sep 2023 09:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GW9XWVBJiDk0wTCwYIGHO7XlXsrc09Mlx1rAjwgIinudeFjbO7oo9l9rNvevBKEspQrYH5dwkFKY4gwAxjGJMBOO+oq5Bk3NarsCX/j//E1SvTsMIcu9555KWhj1cuXLalfN5q+cRP6VoimsAxB8ShOVWqedKvybY+JBlSFRGC2EXH61FFETVT2ZH7P5+JPehl+1x0B4bMQjmzg3xNGupkuOLXF9neBv7ktiVJ2hq+Cr/SCmsxuRF8x99kb7nHPfDAZ+CASyFk+0u1PiTWfp7ShzCZgTox9MheBj38VKuL/C0XLXbDLPHSKPTzUS0jpZW2A1xeRt0wCW/0hfogRERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeAvkaJPL83aU7IXXb/klJXeSAlmHmhd0ecy6cuov44=;
 b=XbphyThQ9/jU0mBJUXGhh/FQwt3uaNG9J0QpbewB5VaE+fJ6ubuwP+WOuuiHphxLgXXSQ2m38eVbvCmYQW24dWk/Sm7p3gUPO/fXY/t8H7Gv6cLMAjFubMk2j+ZP8DRXi2TkcnJka6t9pSjhL7ublDntLAsRgfPOWwgtTzF2iaQV7tTVE4UhmFTUSGlNUQy1ReGw9FMao0z7uj+jKSWUqrcUuEw/zRzoAKHS3T5661SvDVUKR49QJ3bAZks0gkq0w1xlL8Te636LiCTai7H/mWCtpHNlqVNIz+zXf7IiX4gz6ZvQsyiRLuVpYfC7VvXlYAk+c1W0OaxhjeBO5MabCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeAvkaJPL83aU7IXXb/klJXeSAlmHmhd0ecy6cuov44=;
 b=nmymfg3WSc3vJo8Z5fvjcW0peM4FMvehBLzSQJr0BSA0pNk85s06uy1ACD3HhQN+JoXTZDm2rYGK2pLE5xAiIsiK6SLltV0pMZXR/NRXjZu9hllFL7KsXfg2Qi8ZN+rGPMnX923JjSPMiFmy7HSBcOnkxqJ387h2Cr4/2CSvCk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB8051.namprd12.prod.outlook.com (2603:10b6:510:26d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 09:08:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 09:08:24 +0000
Message-ID: <127fab21-bc5c-f782-e42b-1092fbb8df34@amd.com>
Date: Thu, 7 Sep 2023 11:08:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 suijingfeng <suijingfeng@loongson.cn>,
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <a9af88c5-4509-96ff-a7fd-a0f72d2f1e6a@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0258.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: d587aba3-a456-4f16-eacd-08dbaf81fda5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JoV9/E07wa/GoAELsbfGhj2VakEGYD320UHtsTbXueDzaUfWXAjvPj3HLu1mEXNHnatzRRIyjJVfglszrw2T9r7tqt6sX4q1Gywq/5yVi1UJYqxVnYTfOzOCTwLXWOfhFxTE75xHMLevM2cKsTr6zvma1vmz4RDhlJQt8Uzwm4Gdyot5e9le2tMBuw3NPT4j7BVFcJosY5Uh/onjLHujaTGEPRZvolmhtCE1f5jsFUK1BE0E6qHCsyuGqc9Hzx4gI/HDHaG7SSuLGVpmGI84Izu7pfwzm94WgSXaAsxciTnNI/LWSGh3/gl4mfJvRIUWL+lCDUImW2ZqbaIX81931HLnc8JQOlw78sBy7cV2S4II+Z83i42ZCY3TOGIuWhFSuWEKf4kXmdZ0JMWTLlOFN2fZzQX9ivHGOwupUuC6Ul1G2l5PmcgoiI6VHb1f816KJx7ktgQvlDFIGRYv2vLPOFWsC76VM7bIfe8xWqaLoTJM2iEOtZYCePDh8aWUf6PbE6NQ4Tvwi/n0pv3/DNTHAua7K/meDiYdMLY0d7vXFd36AR5sT4FcEh2icbbTMvCslHPyJr/YnfLjfca8N1rRgobWtErhtWhJXXdLaMePodb0SGzZhx8wUMqZ+ZJA9UXrvES8KZN5JlTKWyzP4gPv9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199024)(1800799009)(186009)(53546011)(6506007)(6486002)(6666004)(6512007)(2616005)(66574015)(83380400001)(26005)(2906002)(7416002)(6636002)(110136005)(66476007)(41300700001)(66556008)(4326008)(8676002)(8936002)(66946007)(478600001)(5660300002)(86362001)(31696002)(36756003)(38100700002)(316002)(66899024)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek5kWjNibEYxNHNLMmFBazZCdFVUaVl4cXVhRG52clhMaVRaclNiT0J4MWpl?=
 =?utf-8?B?MWNFL3RYYmVzcUthbHRmN1RpL1ZBZWdlUXVrUERnOWpoYjhLS0NnVXh3RjRT?=
 =?utf-8?B?d3dodTl4QmpQYnorbDZNN3ZQMUZMUDhnYTloUW5YdnhWNElNNHhoZjdjdXBw?=
 =?utf-8?B?VDVCSUIxQ0xqcTluTzZBRWkyOVEvYitBZENwdG1wNWd2azA0YnZVMXVGaktl?=
 =?utf-8?B?QkREQU9GWHNKMU5yODRIVkR0b1F4OVVMSDdNRW9uQjFuakVBS0JVOWZ1Q05N?=
 =?utf-8?B?c3pWV21IOER6WHJJQVJXNjVMa1ZSZzUrWEp1NnR5S0VpQWF4RGE5RWVFS005?=
 =?utf-8?B?NmhUNUFwSHJ3UnpQWkxWN0JkNnV2WmVkSmVyVkFqQzY2azJYRlRqeDBCT29E?=
 =?utf-8?B?YXNvcUVXZDBsSzMzYmNza2paNlE3c3BHUDJ5azhvRmVURTdOYWU0UXdHdnlX?=
 =?utf-8?B?Z2kwcjJIVXhwSDYxSG5WdTBkd2s0VUZEU2FHZWxrSStwdmp4NVNmK2tlbklm?=
 =?utf-8?B?YjJmY1p2NkpGc3p3K2swamNtZnE4elV2WTRqQzN1b3pkeFljZi8yWmJRZlVh?=
 =?utf-8?B?YTZicmdHQ3pKRVFlMFFRN09aQ2pCS2RUeGt6RzlFK21RS1BmOUgzSGp1Vmls?=
 =?utf-8?B?elpzNkFTeS84dzIxTzBGZHZ2aE83NXY4bkp1eURmaGloQ0NkVkFtQkErVzhO?=
 =?utf-8?B?L2J0QmFaRmN3ZE9PdUhHWmpKaGFlMC9tZ1ZjeXkvd3Z6OVVpaXBHbHlJcW9h?=
 =?utf-8?B?TmNZa2FrOU8xQVp3MFBTVTF3K014ZXhvL09qMGY3cm9yNDI0dFlCb3NWMlZ0?=
 =?utf-8?B?bFR0dnl3bHdzeERqNHVyNFcvQi83MmxGM003a0U1Q2NtejVTNVkvMzVIMGxy?=
 =?utf-8?B?RVp0WGlRVW9kTjZPUU5XK3VYYmYwcFZ6cGpVYk1lQzAwNlRRMVJTQVBoWXF5?=
 =?utf-8?B?cC9zWHZoZmI2UnpMMkNDQVRQQU01U05sN0RPMmp6UndPOVRqQzZudGtzTjdJ?=
 =?utf-8?B?NlpTSDVWaHltZnVwT2VRR2pkVmpkWGs2bkFuNWErWVNGZUxrVkRGQkswby9D?=
 =?utf-8?B?eVBZZzFqUHlBMWhRaFNFZ2hGUlI2ckdXYlY4c0piNkZGV3RGVHU2VGlJc0th?=
 =?utf-8?B?RGxubjN5VDkrLzRqRi9DUGQ0N2xSbFh1K2lsL1ltQXFwMlp3bVNzVVJMUXRG?=
 =?utf-8?B?TkhqQjQxT2ZFRERnVnBoaTgyTG9yVjdnZng3dHk3cWx3bjFJd2NmZWJWSVlF?=
 =?utf-8?B?L0dCKzVlSzhWRmRwQ0w5NmdpQnIxQm9aQm5BVDlmcS8yVGNNTG9FRll6WGhq?=
 =?utf-8?B?SU8wZVFBbDZLMllja2FYT2FjaWZDM0FnRjJqRVVaSDdudHhXQitIUTJKTlY2?=
 =?utf-8?B?bWlQUWM1VGd0cVlvYlZOWkw1b0xVZXpWUmtUQVE2dGFHN2lXYk1BamQ4Yk5T?=
 =?utf-8?B?RmhsYVFkblhmYXVVaEtoc3owTC9NaUhvZkF5NDMrVnE1alEvZDBnYkdpMmJr?=
 =?utf-8?B?aE5aRW1yL1ZqSFVkWjQ2akkzRzI1REpUbHZoMGp3WjVqNmZjWEcyNkM2d2JM?=
 =?utf-8?B?RFVjcmNxVWV5ZWFESkNnYXYrMVdjR0dCNXZYVWNTSUQ3R1dZQVN6ZFVSSU81?=
 =?utf-8?B?QW82NVZiKzc0Nkk0N1dFM0xLZDBxK3RvOStOU3MwblZKVzFmUUhKdnQ1b1lX?=
 =?utf-8?B?YmpCczBadWRqK1AwMy9MQXlUSmQxZ0M2Vyt1WVB1cGZqNXl0WVlzRW9pRm9O?=
 =?utf-8?B?VGlmWi9vTnFGN1JxanVCY2JBejJRdDhBL3NodnBCUHJCUEtGU1Z4bXNoUG1D?=
 =?utf-8?B?eGRQT0FxREYxMXNiU1hPeDRlZ1hNOTY2SmxiZ2d3dXY4MTZNaGZnVkdZVEhP?=
 =?utf-8?B?QTNGbFFiWm5qNXJKV1lRTnpEanE4NEJjRnd3YnBib1A1a09wNzRpNEo3b0ZN?=
 =?utf-8?B?WDNCbGJwSjJCOEVUMlZVMHBiUTR1blFLbVVxS0J1czcrcHhqbnFJOEZzemtt?=
 =?utf-8?B?RGtFbldOSStxcGp3NXFRbXAvUUJpSncrNlVpaGJEZjQ4UnZtNnBQeXJZblY2?=
 =?utf-8?B?SzcxQmFDbldXbTVnTHlLZ3V4cDJPcFR2MTZCcUZsRjVSdGkrdVFab0xYU0xk?=
 =?utf-8?Q?ohDAv5XCgCarHxDQdK41rxQMK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d587aba3-a456-4f16-eacd-08dbaf81fda5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 09:08:24.9082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAdYlxZFdyRXrLit0w3tdO37aAF/yt5LeogJuqOG4hnh11l9FimsFFK27CXcWbw7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8051
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

Am 07.09.23 um 04:30 schrieb Sui Jingfeng:
> Hi,
>
>
> On 2023/9/6 17:40, Christian König wrote:
>> Am 06.09.23 um 11:08 schrieb suijingfeng:
>>> Well, welcome to correct me if I'm wrong.
>>
>> You seem to have some very basic misunderstandings here.
>>
>> The term framebuffer describes some VRAM memory used for scanout.
>>
>> This framebuffer is exposed to userspace through some framebuffer 
>> driver, on UEFI platforms that is usually efifb but can be quite a 
>> bunch of different drivers.
>>
>> When the DRM drivers load they remove the previous drivers using 
>> drm_aperture_remove_conflicting_pci_framebuffers() (or similar 
>> function), but this does not mean that the framebuffer or scanout 
>> parameters are modified in any way. It just means that the 
>> framebuffer is just no longer exposed through this driver.
>>
>> Take over is the perfectly right description here because that's 
>> exactly what's happening. The framebuffer configuration including the 
>> VRAM memory as well as the parameters for scanout are exposed by the 
>> newly loaded DRM driver.
>>
>> In other words userspace can query through the DRM interfaces which 
>> monitors already driven by the hardware and so in your terminology 
>> figure out which is the primary one.
>>
> I'm a little bit of not convinced about this idea, you might be correct.

Well I can point you to the code if you don't believe me.

> But there cases where three are multiple monitors and each video card
> connect one.

Yeah, but this is irrelevant. The key point is the configuration is 
taken over when the driver loads.

So whatever is there before as setup (one monitor showing console, three 
monitors mirrored, whatever) should be there after loading the driver as 
well. This configuration is just immediately overwritten because nobody 
cares about it.

>
> It also quite common that no monitors is connected, let the machine boot
> first, then find a monitors to connect to a random display output. See
> which will display. I don't expect the primary shake with.
> The primary one have to be determined as early as possible, because of
> the VGA console and the framebuffer console may directly output the 
> primary.

Well that is simply not correct. There is not concept of "primary" 
display, it can just be that a monitor was brought up by the BIOS or 
bootloader and we take over this configuration.

> Get the DDC and/or HPD involved may necessary complicated the problem.
>
> There are ASpeed BMC who add a virtual connector in order to able 
> display remotely.
> There are also have commands to force a connector to be connected status.
>
>
>> It's just that as Thomas explained as well that this completely 
>> irrelevant to any modern desktop. Both X and Wayland both iterate the 
>> available devices and start rendering to them which one was used 
>> during boot doesn't really matter to them.
>>
> You may be correct, but I'm still not sure.
> I probably need more times to investigate.
> Me and my colleagues are mainly using X server,
> the version varies from 1.20.4 and 1.21.1.4.
> Even this is true, the problems still exist for non-modern desktops.

Well, I have over 25 years of experience with display hardware and what 
you describe here was never an issue.

What you have is simply a broken display driver which for some reason 
can't handle your use case.

I strongly suggest that you just completely drop this here and go into 
the AST driver and try to fix it.

Regards,
Christian.


>
>> Apart from that ranting like this and trying to explain stuff to 
>> people who obviously have much better background in the topic is not 
>> going to help your patches getting upstream.
>>
>
> Thanks for you tell me so much knowledge,
> I'm realized where are the problems now.
> I will try to resolve the concerns at the next version.
>
>
>> Regards,
>> Christian.
>>

