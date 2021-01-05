Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821DD2EA9F3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 12:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9BE6E0E1;
	Tue,  5 Jan 2021 11:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FC66E0E1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 11:34:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R00dqjf6oW+e+UcFQ/fPEAxajOoYkCjSIUGkstinROWaEBwXBTrxzOBgaeT++uuPdIieBRgiSHbGqp7piYCGbC5oIXiGkTQkMsGZo48TX8wjNAVJmYOlSCXBnWS3tyzOQlLtWI0Mz8ghTlwT9pX52ApIreZ3q/eYo9gn843/VAMTuuwFK/4fwdmT6s7B2wUBjRr9Kb36nyQGyu/V/gidfMYMYmfi3lCpER+FqdRTJRUw4YEGzFYoOV54wpLnZ12RoMiT6BStUoHiwOcMVsXLfgIetRefO5ylfWJ5z57T3Pxcck4qVKXKN++nnMEjUp18uegH+nEmU/FVbUz0AFAzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfZ/BTHhb9ytVWF3yGZos+l+adHXcd36+PCex/aohxc=;
 b=dUnRMTzG8wJ4I4IlvMsL6OyznHF3fo3RX8Hb+7ej3jZFvTfinzMcJ2LY4HMNHUTQGFsNNejJxE1D7AAJIv0qECviRsxvQY42L4D0qFHNOsqdA/pKgHUVD4O+PEm+6cHlSxFuLt3pa5ax6WodgH5LT7OrKqCNkHdcJTA/pHn1GX816Oo5FDulWu+Wcd5BvmredAutL2oC6Vs3e5EO7bT2RzIx8cVgPkDF1osDbOGXLwOtl6BvwcT141+ldnrvFbnXExflm98KJ/Qr4S22SiEFESPIhh8Gri+TMlZ9oD9f6M8OoOQDpml9cO7H8wi3u081n/zmkjIk/3Bf5k1D+Pq44w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfZ/BTHhb9ytVWF3yGZos+l+adHXcd36+PCex/aohxc=;
 b=rD94C1wUIxbOLOppiQebXrMii1BPWp9dtp5dg9dlsRRTmApg6pCc0OvoMG4bQfRaeUIuB8AOSu0vr145SKEtk9wBiT1GPVlJ2dM33PfEsva51FPXgr8v41RNmXU0DjKaB/N8HmT5RjdPPot6nUqg8GtptyysaYawdsIiY8qPCcs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Tue, 5 Jan
 2021 11:34:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.006; Tue, 5 Jan 2021
 11:34:37 +0000
Subject: Re: 5.11-rc1 TTM list corruption
To: Huang Rui <ray.huang@amd.com>, Borislav Petkov <bp@alien8.de>
References: <20201231104020.GA4504@zn.tnic>
 <e3bfa0a4-5d0a-bd68-6cc8-73db1d29f22c@amd.com>
 <20210104105802.GD32151@zn.tnic> <20210105041213.GA544780@hr-amd>
 <20210105103138.GB28649@zn.tnic> <20210105110852.GA1052081@hr-amd>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3bbdaf4c-882e-a5f0-177b-36bf582de26c@amd.com>
Date: Tue, 5 Jan 2021 12:34:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210105110852.GA1052081@hr-amd>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0302CA0028.eurprd03.prod.outlook.com
 (2603:10a6:205:2::41) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0302CA0028.eurprd03.prod.outlook.com (2603:10a6:205:2::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Tue, 5 Jan 2021 11:34:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 81b571e6-2f90-4f18-579f-08d8b16de1ea
X-MS-TrafficTypeDiagnostic: MN2PR12MB4221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4221BA443E10C70B8B490BE583D10@MN2PR12MB4221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CIPmutGi1UhNpKPSP09BXiUwclHn+G3xZe93fZkSg4Kkygdb1Am3wY+eIbDTIlGzmrVWziHQ1BR4KDLEfyDrw+vRZDgqjt6PvrCY5d2obFcRRDU/Xyd5xR2SQpCJnxxxlrvUOH7fMP6BQZpV/2vtEsidUogGUWFW1EcV913c1Mtji1MdKC2SKkOD6stxkIs4ss9VHnRAU4bchGoZmLgqRioKs3bdAwh5BfNdzf//RiCSlTABIZ0jMsOgca0csuCfR29ReuYNtjccvbIoefsbW3FxgytMrwo2ddTypvhMYLv00QwYn2KJncoNhY0pcry+UuB1C4LrOqdjDx3n/nf8ByQw04h4HxvRbbNZ/Rxc+DhdE9qnOGCuqQzoome1XhNdT3qXtoZ4cRnxbcShkQ7V5CAxXWDf3sw4lyT5cefs+BvlR9kTyS1Hy4OIFFMg9Bx0vqxtFLeV1idn32eWL/0bZWFsq8fVarY4aUv/Sxq0eZxM2WNDPKhIBEYNwsc6dgfc3UH0r+6rEotTexNnrFZa4IOiNornLpLnPZLQmKfbzEkOD0vdRGZwNtnb0pVEDCuJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(6666004)(2616005)(54906003)(36756003)(8936002)(52116002)(31696002)(31686004)(6486002)(86362001)(66556008)(66476007)(186003)(45080400002)(5660300002)(2906002)(4326008)(16526019)(110136005)(8676002)(316002)(478600001)(83380400001)(66946007)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWxlSFQyand5MlNHVFRheFo5N05wZEZmWVp6ZG1KN1NtalFZSm1hV3JjRzlT?=
 =?utf-8?B?aTByeC80MkJVL0ptdDVhcm9UUm81eE5CUkNEbXE5S1VTMTE5VkhmV0tXbmhM?=
 =?utf-8?B?eXR5Wnc4Ri8wUXU2QTVPYTdLUmFycjdsUExrQ3FUNEI4bHhSWkVLMlVsM2Vx?=
 =?utf-8?B?cWlzazhOSGI4Yk11bXlLNnFUUTVVQjFtOUNzc25DUmxVSHhINEdFc2VDdTdC?=
 =?utf-8?B?aHFQSDFKcXZEM1lDOVhvbmZZT2c3dFdXTElZNUNxRjlnNWJWZVFWSmZ1SzYy?=
 =?utf-8?B?c0NPMzBSZENGbzFsM1NRK3FRWWVNN1B0ZjlPYjF5U2Y2aW5rSlZtTk0wa2dz?=
 =?utf-8?B?TVJWRnpKRHJMZWwxTG1JRkZ1bWFBNWY3a3NWcHZnWC8xNVZ4UzQvdkdmMHNS?=
 =?utf-8?B?L2Rsb2RLYnFPNmYwbUZ5WnJTeGJRbjFmRFhUQjRQRlNBRWZvaVppamNlSzVi?=
 =?utf-8?B?QXdzOWRVcE5tcEljR2FVZkJFYkJQNkNtd1BjaStmMmlHMXA1NUJ1bFJiM3hW?=
 =?utf-8?B?bTU5TEVNUlFYS3RJRm5hTGJIdUp1ajhjNVQzRXZQazJTbW1mTHZ3eVYzbmJy?=
 =?utf-8?B?YlBJcXpBMm5KTEN1UHdxek1McTM1NTJ6WVBHRW5kZTd3V0NjQ3pNTThaT0FL?=
 =?utf-8?B?SHhzWjNvZ2ZiejF2RnlxaFRITUZpSFNDNE5kcVc0b1VrU1RFNnZJd2V2R1Jl?=
 =?utf-8?B?OUZlWC9SM0U5VTJWaGdlOHlxSmprMFZOUnl1YjUwOVhUQ2YwSUJtMTRkMFNk?=
 =?utf-8?B?VVBUcUdYbWlGOWNmZGNOS0xyNjRUU3lkM1RGb1Yxa0FYSm51L25NU1U4a09j?=
 =?utf-8?B?UEVVL3pHRGRJeVR6MmJaeEI1NmZKbkd0L3A0ODdZTCs2cWYyWmtIMXJxb2tz?=
 =?utf-8?B?eG5uWkdmUmEyWGMrUURLVmlqek5FTzM3L1Y0Y0JkSlFyMmNuVldPSFVFbTRU?=
 =?utf-8?B?Z2hRYm1KNEphY05peVFuSDF2aEI1Q3BoOEYzMlFvMThrQjJuV3JMYU41UjVS?=
 =?utf-8?B?VHY4WWppTVIxcHEwenp5VGxJaUxVUjl2RG5lM2hBS2dpeGp5cUlGWUdweGQ4?=
 =?utf-8?B?WVlmaTBSQjZKWE01Uk5zWnBmZTR4RXZQbTN4V2QzMk1WYXlndVZXb1Axengz?=
 =?utf-8?B?VUFmUnlPSkcxTmlCTzNZcG1aTkhjblRCZVFMVjNsczRqaFBodkZFY2FJOWJI?=
 =?utf-8?B?OHBTVytTNzI1TERCcEFOZ2RlY0RkVmNWbGk2Ui9EMHozdW1ZcVNEMjlsODZs?=
 =?utf-8?B?MURGWlJnWkhNNGNBK242NVRySmMzTGtPMFR4aUhnbm55dmNReXJDcDF3SDRv?=
 =?utf-8?B?Ukx2VzhHTUFCb21TWmpyOEFOV0xKR29xQnVMOTRkZzZiYTlCNG45UDRoWS85?=
 =?utf-8?B?YUU3aFVlR2xvd2c1aDM4bjZhUFRpZXJWVW1tY0dIWVFzQ1JJNUlEZnpkM2dm?=
 =?utf-8?Q?T/wLmFn9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 11:34:37.1598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b571e6-2f90-4f18-579f-08d8b16de1ea
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agoo1YAMHgbxnzs8jBDY7lV13TgrOSPM87NSsK6qsQmKbPQz+aCRHx2sbmBE6xqF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
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
Cc: lkml <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.01.21 um 12:08 schrieb Huang Rui:
> On Tue, Jan 05, 2021 at 06:31:38PM +0800, Borislav Petkov wrote:
>> Hi,
>>
>> On Tue, Jan 05, 2021 at 12:12:13PM +0800, Huang Rui wrote:
>>> I am reproducing this issue as well, are you using a Raven board?
>> I have no clue what Raven is. The workstation I triggered it once on, has:
>>
>> [    7.563968] [drm] radeon kernel modesetting enabled.
>> [    7.581417] [drm] initializing kernel modesetting (CAICOS 0x1002:0x6779 0x174B:0xE164 0x00).
> Ah, this asic is a bit old and still use radeon driver. So we didn't
> reproduce it on amdgpu driver. I don't have such the old asic in my hand.
> May we know whether this issue can be duplicated after SI which is used
> amdgpu module (not sure whether you have recent APU or GPU)?

Ah! Thanks Ray for pointing this out. I have SI based hardware here.

Going to try this in a few minutes.

Thanks,
Christian.

>
> Thanks,
> Ray
>
>> [    7.609217] [drm] Detected VRAM RAM=2048M, BAR=256M
>> [    7.614031] [drm] RAM width 64bits DDR
>> [    7.639665] [drm] radeon: 2048M of VRAM memory ready
>> [    7.644557] [drm] radeon: 1024M of GTT memory ready.
>> [    7.649451] [drm] Loading CAICOS Microcode
>> [    7.653548] [drm] Internal thermal controller without fan control
>> [    7.661221] [drm] radeon: dpm initialized
>> [    7.665227] [drm] GART: num cpu pages 262144, num gpu pages 262144
>> [    7.671821] [drm] enabling PCIE gen 2 link speeds, disable with radeon.pcie_gen2=0
>> [    7.703858] [drm] PCIE GART of 1024M enabled (table at 0x0000000000162000).
>> [    7.749689] [drm] radeon: irq initialized.
>> [    7.769826] [drm] ring test on 0 succeeded in 1 usecs
>> [    7.774797] [drm] ring test on 3 succeeded in 3 usecs
>> [    7.955500] [drm] ring test on 5 succeeded in 1 usecs
>> [    7.960468] [drm] UVD initialized successfully.
>> [    7.965047] [drm] ib test on ring 0 succeeded in 0 usecs
>> [    7.970316] [drm] ib test on ring 3 succeeded in 0 usecs
>> [    8.626877] [drm] ib test on ring 5 succeeded
>> [    8.631376] [drm] Radeon Display Connectors
>> [    8.635496] [drm] Connector 0:
>> [    8.638503] [drm]   HDMI-A-1
>> [    8.641339] [drm]   HPD2
>> [    8.643835] [drm]   DDC: 0x6440 0x6440 0x6444 0x6444 0x6448 0x6448 0x644c 0x644c
>> [    8.651102] [drm]   Encoders:
>> [    8.654022] [drm]     DFP1: INTERNAL_UNIPHY1
>> [    8.658224] [drm] Connector 1:
>> [    8.661232] [drm]   DVI-D-1
>> [    8.663982] [drm]   HPD4
>> [    8.666479] [drm]   DDC: 0x6460 0x6460 0x6464 0x6464 0x6468 0x6468 0x646c 0x646c
>> [    8.673745] [drm]   Encoders:
>> [    8.676665] [drm]     DFP2: INTERNAL_UNIPHY
>> [    8.680782] [drm] Connector 2:
>> [    8.683789] [drm]   VGA-1
>> [    8.686369] [drm]   DDC: 0x6430 0x6430 0x6434 0x6434 0x6438 0x6438 0x643c 0x643c
>> [    8.693636] [drm]   Encoders:
>> [    8.696555] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
>> [    8.788923] [drm] fb mappable at 0xE0363000
>> [    8.793036] [drm] vram apper at 0xE0000000
>> [    8.797064] [drm] size 9216000
>> [    8.800071] [drm] fb depth is 24
>> [    8.803249] [drm]    pitch is 7680
>> [    8.807106] fbcon: radeondrmfb (fb0) is primary device
>> [    8.918927] radeon 0000:1d:00.0: [drm] fb0: radeondrmfb frame buffer device
>> [    8.938461] [drm] Initialized radeon 2.50.0 20080528 for 0000:1d:00.0 on minor 0
>>
>> HTH.
>>
>> -- 
>> Regards/Gruss,
>>      Boris.
>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpeople.kernel.org%2Ftglx%2Fnotes-about-netiquette&amp;data=04%7C01%7Cray.huang%40amd.com%7C31b8dcd4040e4a49380e08d8b16517ad%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637454395066317813%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=al4lLGA%2BCdHK4HzO8M5VJthY8Iv71xQ0TsDGwJpgs1A%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
