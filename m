Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3EA470F9E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 01:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0769610E56F;
	Sat, 11 Dec 2021 00:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1311310E56F;
 Sat, 11 Dec 2021 00:54:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7YzQzP75Z6EEuQdofSSlClzs5T2+p8kSEpgbJdTV4TtfKlY3/smwSmGMw0xHGc9bZRTOiOTCnyjXbZiCoZrG7DG4MtmGDXzcKZvv+JoUxEZryiFdV2XiHTf/7Mx3pXpToxMxd1LNHq1g5tAtEpBn0bua7Fe47fbFp78sN5lT4JdJRGMHEbOAKBLWmpat1YzU0wjCzrBc9J1ON3aPS8fOK2OZUWIXZaCwNUKU1O0AnMxNun2WepOog0O8lyF1/KRrGjivXfAXka7can/SF8ncH6+vBlMEas7QI+81ziVHmOEMwpUFZWwUJyp5xqNYLEuI0AxXenGT3DryaXTeWRn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jc15YvWOr9/BgI/HQExwrT6kStb2atF+PyG+cJ+lrYY=;
 b=fa0BzWrwrRBTTOQnWU2Xrw7nZR39p1+vJYDTePHlh7/dprsfsQRJY35EMXH5d/rgLUwt7Og/Rh66ighUN95fn1Z+SrHEG0tG2RInNOR88HTSrhoMO8VdQbz8Kiv3eeQyfuWxR3u13cr2n+KDntMSGwaaUiGfR5mE4Ux5ZTHo71U1mdgEgyLel/PaHdkxjTp1+hoW8UhimhkbHf2fdT3SlM7gH3FdPFUc50WiYhPTGBxQ4i9Sg+Voota40upSyZykkvLTkqY9us2TBEdzqppCJ3XJK7X2choE1m+hYPYprrnBc8RufEb6e3hfAKwQLRBGHm1fKu7rVL1PzYeizKsxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jc15YvWOr9/BgI/HQExwrT6kStb2atF+PyG+cJ+lrYY=;
 b=G/0iVXcpIv9IKqln5crvNBN4KwPTyfwb+rxUW8HU9XG142n048P7CspNBiQ3gAvjSDsq/Y+qwR/jZNG6KyN8Fd78mOWvxL8Q2Q8sH+0qNCqwY+BU5p0EIA6sdGsogtzbLQtcCUIf59oj5r2Aa5plZIN/2mcM9hHUyjCLcRWhbhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5276.namprd12.prod.outlook.com (2603:10b6:408:101::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Sat, 11 Dec
 2021 00:54:36 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%7]) with mapi id 15.20.4755.022; Sat, 11 Dec 2021
 00:54:35 +0000
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
 <CADnq5_O8x3_8f7GZ=tme55-QW+nqMJ2YoqvROjDPg2YZP2catQ@mail.gmail.com>
 <a1f4d263-b3d2-4ceb-8a89-948c8129500f@igalia.com>
 <CADnq5_N9ptK4c86LO77YcrF5_M==hket+L7eYjsGCaKbORO=ug@mail.gmail.com>
 <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>
 <6d3c7acf-a23f-3073-56ed-375ccb8cc815@suse.de>
 <99b38881-8c63-de04-50f8-aa4119b52b25@igalia.com>
 <CADnq5_NqPEY6vPSsBQSst5Gsw-VpJ-sp-5DHMeB+EGA2t7KoAQ@mail.gmail.com>
 <56dfb915-036b-0584-f0ef-83c786970d6e@igalia.com>
 <d1de6ca3-11ae-af9e-a2fb-7bcb6fae01d6@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <3988a221-2f6a-540a-3d77-18c2c67ddbe7@amd.com>
Date: Fri, 10 Dec 2021 19:54:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d1de6ca3-11ae-af9e-a2fb-7bcb6fae01d6@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BL0PR0102CA0026.prod.exchangelabs.com
 (2603:10b6:207:18::39) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [172.27.226.80] (165.204.55.251) by
 BL0PR0102CA0026.prod.exchangelabs.com (2603:10b6:207:18::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Sat, 11 Dec 2021 00:54:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecccefe6-f74a-4f87-ee51-08d9bc40cd31
X-MS-TrafficTypeDiagnostic: BN9PR12MB5276:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5276CEDB85E3265ADC0BAA9D92729@BN9PR12MB5276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0pNyuKTvDdj4rqvQ1JxZe0XBx2U35HUkCfUJtUPYXoP7n1+zb3Wh2QkmCCzVEgcoWNW3EkvEkhEHWrcsfuTo7+Kr8v6Lc5S006kjJI7fRMcjhHE04IBXd45n+MzoCR1Z8CanQZZ91k5rKRI3nRTmkF0sRK+F4EGqC5wa9Hcx+zc5ohhdo3RxL3ngGAFuI3tS5NxTyVIxroJrgK/k702WB6NqfYwRSyk7FfelE/cJ5Ik+nicsVJI6NBmNT4FGoEH/Ed7qM9rDUTow4h8ptyRI8rUqroUdGiIKR8IX5DISg+d/EHOIMw1D9bfY+8Y4HVK7amLQm11koF4LCvofaHebo190+EbdCwsrCMeiFx4b08VHZch7j53vDbcuBJoNyJsyrJLtUUKs9DdIu7v5t5G3ubr4Sur9ST3KXSg+uy0KU6zot/FnGRfIAQ2FuCSqC3kpXiOwdMtm12ZdwGhY+YF6fkUCt574VRvrPOmrekPdNVijZ0oNqGXjZZWvMWdJvmk8wjUzjj22meCsV7eGWwnCpHzQrEheHGCDJ//Z7eo600xXq3NT9KdNTgEBuoknKfcXkMuCRhNzwmtawUCcLaRZ99ZKmDK1KLMynW0wXEisC3nKuLpAy6umCvSirARxEySMs7sm6pr+S0EXg1lk/IgDbsCTSGLWtewt4SXcf9GQZs+lOYcydzN39Qc/emfaB5qrSdAnQ++kpn1iMiaW3E25TQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(16576012)(186003)(66574015)(4001150100001)(26005)(44832011)(956004)(36916002)(4326008)(2616005)(316002)(8936002)(54906003)(2906002)(6486002)(110136005)(66476007)(31686004)(83380400001)(86362001)(36756003)(5660300002)(66556008)(508600001)(66946007)(7416002)(38100700002)(53546011)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmVtK0N1WndCQW95WXhIZ2ZYRlJFbGl1MFBscWEyd25WZXBCb1FySHFUMUY3?=
 =?utf-8?B?dU94eWgrS3VtTitCMW9HOWdqeVRnaEJJOTlTcG9lbGUyaGl4c2RVcVdOZEhX?=
 =?utf-8?B?b1FGSlNod3hCZFR6em8wcW5GQUpyaEdTWDdXVGhBOGgzQ0FXMFc5QVRCUnpL?=
 =?utf-8?B?K0ZrdUJPS0RudUdpNCtxanE5V2ViNDdiOEZwTXdHeTdrZnE3WjNwRmZKaU5x?=
 =?utf-8?B?bGNzeVZ2YmJJTDVtNllMMG1CTzBxUHNDU3ZzT1FpdTk5bjA1Q1JyKzMzbU1i?=
 =?utf-8?B?R0REVkRYN1Zhb3R6bjVCZHpuUTlxMlE3WXRTTGVpc0hBRkF6elhnUjdVKzBi?=
 =?utf-8?B?VHRvWERScWxuTTBFSStGOFdLM1JLRG4vbzVGeFh0VVhyUHJZS1I0M0I5bXhs?=
 =?utf-8?B?Rmx2aWJFSURrTFJzR3VZZWF5WmpvM0drVGp1bDRRMWFHTWFUaEJqTmZ0RjJY?=
 =?utf-8?B?cHJhMHhRN1NuQ3VpV1liMTBBbVU5ZDRWZ3UvU21aTUFGWDMzWW1vMXdxUVZx?=
 =?utf-8?B?bnRnRVNYMjd5bEcyVHcrV2F5WXZLTlJnNjR0aWJqMS9qWGsvczJjMG1qOFJY?=
 =?utf-8?B?MjczNEVTYjRnbGxhSXFvZ29TYUxHMEIrZm42QXE1ZEx5ODliMFVJMFNxZTRt?=
 =?utf-8?B?ZnFseVlKVFBiMDE0UmtRamV2RTJQTDhCczZ2bGNmZHJlNzhtNTNWQXlaOENI?=
 =?utf-8?B?UVl0U0VpaGkxTjVrbXNFNHh5R1dGczYrWEdJRzZLbjNCN2ZaWEVBQWE0TDRY?=
 =?utf-8?B?WTlTK3ZZTGtnSlpQMTA5K1BoRWhaSzgxRFByUWdFcmszTkdvaHFibHdTekVI?=
 =?utf-8?B?R2FablJqNEh4OGQwN1lIVXJEeGhORWl3dXBPbnhMeHpCYllhWENmc2lIZFl6?=
 =?utf-8?B?d0s3aUxNdExPTmxHRElKc2p6aTN1VnIvRTlJRXNpYW1nYUUzYTAydjBWMVpP?=
 =?utf-8?B?K1JpaCsvV3pkSU1EdlFJOXprWEJMME1QbnlmS2dTZHkyRW52M0gzTXI0dzhu?=
 =?utf-8?B?eW4wdFlKTHhZbWFVbEUzSWxWV1MyT253NnhwRjRybVlPTVd2M08wM0RRN0Fl?=
 =?utf-8?B?dzBWZXBXUzZQd1RuNXE3dkVJL0FYZFpiMUhuN1RxWjdZOG1pNEZUSmZtMER4?=
 =?utf-8?B?T3dXcW1FcXZyaGoyNVdGdENNOCtmRVVpMDNvZjUrN1kwdUJodEkyQWxlbXN0?=
 =?utf-8?B?U1ZTK2tzei9OQUFmeGQ2dTFpWHdCbVV3akl3MEVDQktJZE1FbENub1Q0WEdB?=
 =?utf-8?B?SDhNWTVSczM2a3lpVkdTUmhnMVZNaEQvcUtwUzlzKzhXVWZLZ1pDRU16NU5S?=
 =?utf-8?B?TWdrOGhueVFmUWNiaHJCSWNaZmxRL3ZnWFZORmVYVEV4SjQ2bGxWRloxOWp1?=
 =?utf-8?B?MDZKQTBLcUtLMWVUeHBOYldrRDkxUWY3VEpLUHVxTGVSVmNWUURzamFMYlFj?=
 =?utf-8?B?OXhBcit6UjJWcnZuMWtyRytReXR4M3czY2Vwa0w5b0plTUlOcWR4WUFJT3Er?=
 =?utf-8?B?RHZpN0FBUmhiVFpCUVlFTHhCejdGQm82NC9ldXJQK1FqNC8yc2xLKythSWJj?=
 =?utf-8?B?cEErandKbDU3MHVSUm1nbU0rbzZRVmROdFNzTzk3RXJTK2hXZFhFY3hhczV2?=
 =?utf-8?B?eGpBVjJLazRxNXFCdkVSSHRlMWwzNVhuWVJKRHR5cllJOThNNGExUkhhUUZJ?=
 =?utf-8?B?cHdJWmRwaTh4WlVqbzFxZnh6S2cxa0c0Y29mQTNlZ0VPSitNQzVlbmNaMGdY?=
 =?utf-8?B?dlR6RFlNOUtPRUtsOGtrNDU1QXJtKzRwR0lZa3MxeEpuTDNQSWdhYmNlZUw5?=
 =?utf-8?B?Y1o3YUxkWTEvc3JkZGRaa1YvV2VUWU1jbHI3YUN1Rml3YXdZSmJTNGFYQ2M1?=
 =?utf-8?B?cGpJV09mTFkyaS9HYXVXcDdsK1ZmblZ4cmNwcGlYcVBGa0w4SDloWVdjeTZa?=
 =?utf-8?B?cURWWTJOejJFR09jMEZKZTkrcnUzUVo0cFdJTWI4NHFEdFdIRHd0dFIrSEdJ?=
 =?utf-8?B?UHNmTFNjQlcxZjlUcXhOKzhzSmpRQWxQT3RyckhSL0cyL3gzMThSZU9ZbEJK?=
 =?utf-8?B?NStlMy9ab3RrSmY1dDFSbnhsQjM2UDRycVE0WVVzZXZLSFV6TTdsTzhTaWlH?=
 =?utf-8?B?eVJFZGh3YlNHM2JRUVVLOUdPS0dvRmFFNDRrd2YrU1FIOU4vcUc5elFWL2NM?=
 =?utf-8?Q?1Lurydfa6+vJ9vEPzmaQvjE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecccefe6-f74a-4f87-ee51-08d9bc40cd31
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 00:54:35.9312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EO+9EODOgc2d64mCWRhS+Dfbb9K7oD8M1TDvD3DKF8gylYvH17sD9tkqAzxz+DrKtjuI1OVjGmGQ4pi/nU9zrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5276
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 kernel@gpiccoli.net, Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=c3=a1lvez?= <siglesias@igalia.com>,
 xinhui pan <Xinhui.Pan@amd.com>, kexec@lists.infradead.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 pjones@redhat.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-10 10:13 a.m., Christian König wrote:
>
>
> Am 10.12.21 um 15:25 schrieb Guilherme G. Piccoli:
>> On 10/12/2021 11:16, Alex Deucher wrote:> [...]
>>> Why not just reload the driver after kexec?
>>>
>>> Alex
>> Because the original issue is the kdump case, and we want a very very
>> tiny kernel - also, the crash originally could have been caused by
>> amdgpu itself, so if it's a GPU issue, we don't want to mess with that
>> in kdump. And I confess I tried modprobe amdgpu after a kdump, no
>> success - kdump won't call shutdown handlers, so GPU will be in a
>> "rogue" state...
>>
>> My question was about regular kexec because it's much simpler usually,
>> we can do whatever we want there. My line of thought was: if I make it
>> work in regular kexec with a simple framebuffer, I might be able to get
>> it working on kdump heheh
>
> How about issuing a PCIe reset and re-initializing the ASIC with just 
> the VBIOS?
>
> That should be pretty straightforward I think.

Do you actually need to restore the exact boot-up mode? If you have the 
same framebuffer memory layout (width, height, bpp, stride) the precise 
display timing doesn't really matter. So we "just" need to switch to a 
mode that's compatible with the efifb framebuffer parameters and point 
the display engine at the efifb as the scan-out buffer.

Regards,
   Felix


>
> Christian.
