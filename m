Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1B4703E7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 16:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4795310E570;
	Fri, 10 Dec 2021 15:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E779C10E561;
 Fri, 10 Dec 2021 15:32:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SW+Oye94yq2qJuC90OS9r5D0aL4C/ejZvpbB68n+nTr2itba8gxxLt14QX6Ji9F9VqKKkDwA2viamfhC9rkKoPycbEVGo6tsK59jXVSkPshL0nPjKVBs3+g452emWGca2UyHSxU3++LURfeLAG27eyqa5E24ssKpdFXPjQyqFaz/tc8gCtJjZe/9TS3Hqtjf1MR+0SCmMTxx1wY5U8WkqgDkt6Xs8RGIZdw2TC9U6Det9hvoeYmy3KRk5W2eip867kxdX+IqKJ5c/vlK1PxGPN9SJpPLn9J86do3/yChy0v5vEUAqtvV4xQtgfVck0rKrNi6xDH+eAJLiYT0idrqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hqd9G+ve83gNuN8Q4VBPf5O1PHxRRUF8QUXRM1vjAYk=;
 b=U5K5rwAE+kQDjYrsJm5dTgzBEMGMogf4H5NFdA24qm1/19DPTOJUDhPSrRU9woXm4Tank/7R2hg4ALBvgS48QUlcPr8l+w2w4Xu3biOlk5uTdlScUwpQ0gFQMPZekL4IjNjDy1ODYN67JPhpNQOGZxYvL5M3VqEVSnIAZGbNBdDvVtuEJTVK+IEmmgLGPMz5CT9TF1498VQDNc6DPlZJe/7BaZOK961AXnPVTD619qiET9oX1k9K1lZb8Cefiz1TIiQqMX4Av0AmFvszJl0/lps+w6Y5kRS6Pnyoc/J1DxUHPsuKmQ/d9wUECuH5Rd/IMBMMZOMgsiMAdfOO/xiwfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hqd9G+ve83gNuN8Q4VBPf5O1PHxRRUF8QUXRM1vjAYk=;
 b=OeMNjKHOTokqFiwn4Bw2yP+57G3tTt58oZtvsTXKE+/TFjm2Ll5tbjx/qnuY/I7i2td7wrWan7f6hB40Y9RdoMshvRlpHv/BrBAuG0EfLEozpcDr2tMdsfJkmWiTolIXhGMApw1DDdmViTeU0uh9YPa1TSlYoF/9KexlWVklezg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1837.namprd12.prod.outlook.com
 (2603:10b6:300:113::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 15:32:16 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4755.027; Fri, 10 Dec
 2021 15:32:16 +0000
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
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
 <0847ff12-8b1c-a046-eb05-f0011f81e172@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <81a250d2-5469-6985-b9ed-62ee6a7b4326@amd.com>
Date: Fri, 10 Dec 2021 16:32:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <0847ff12-8b1c-a046-eb05-f0011f81e172@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR0301CA0040.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::26) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:9f71:eea0:f459:9080]
 (2a02:908:1252:fb60:9f71:eea0:f459:9080) by
 AS9PR0301CA0040.eurprd03.prod.outlook.com (2603:10a6:20b:469::26) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 15:32:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c13008b-5703-419c-9bc2-08d9bbf23ea2
X-MS-TrafficTypeDiagnostic: MWHPR12MB1837:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1837EA8F32D121305E4AB51F83719@MWHPR12MB1837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ETVlyyyeouKrBOfkS4YREQlz5PpTFf+EiK9x4S6uIkgVCPNs4Xiziq5wAFJ18BJlLbvsKrrCPUeMgytnKnHOfLgD7J3YsDYNRWQrHEeaqa374h9/DlzyiP/5b9J/st5hly9vcKahN1lO4sJb6Vqj+pTrztnqaVNyluh8FTibjixQvLa43r8qk8NPiD/nlBxCBfCPOsRl13YqD5byHn2VyGDdltv8Wqv7TFQE6Lu9ZqdXDQFidNBvbHMmC/EP/kUZA5TD1zh+3dzRxjCs7GUs7JLOetv4dRJB+0nondp2nTLRQkhPZTSBzmr1OTxOJkg0mC2FZc4CPEMjTOUJXixjtQSn0b+YXmQn8m2K8AAfpCA3lRsTEYa7Dn81XFCNgO+AFUCPIultcrOKPjHStd0Ev3QlYbCkjJ/6LekmHL3mi7YthkwRd28IwhCOmlpaPNutp5wPxS9xvGJweOOhSX0xLs5TA3n6103rnJxbUUQmeFPFIeD2bf4x2Fr2ONimnF5TDmPScoOmyOj65qYQsjzOTtFn08bjGHrpX222dPD40UyAdwH4c5JFBwIxY7SNFmF0N44g7Nhe7VqEXkNbpsC0Ac7t67+5qZTLYv23+yP24/b/jTum8wk7QsRuoYKB63tieG04u77g5MZyQsELlVFnIAZmKRxHqF0ObwBPaSR8lACtTcVVXgsUFgYG2Y7XB4ceyjdLFNXmSL3wqzqf2M+/0i/1Bun45CtRIRmK5D6ZmBVbCgY29Qz+prp4Eu0AdpWN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(86362001)(54906003)(31686004)(508600001)(66946007)(186003)(6486002)(5660300002)(31696002)(2906002)(7416002)(8676002)(8936002)(6666004)(36756003)(4326008)(66556008)(2616005)(66476007)(38100700002)(316002)(53546011)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDZsVUtqbkNXcjZDUTFhNEJ1NnUyektSTjhDd1RONWZ5amxwblFtdDFsRXFH?=
 =?utf-8?B?RERubnVpS0xzWVNXL0RhRGdQMDdjWVZDUzh3VGFFLy9MMDJ3aFp6NWFud1hL?=
 =?utf-8?B?OWtQdkhwZk5GUzh6WTMyMkJDeWVFRjNRYWNwTFRSYXA0bkh0ekIxeDV6QXov?=
 =?utf-8?B?RDcrWDJKVjhWWVAvRU5tdGJ2THc4WldzbFhRa1R6TWJwYkFIUlZneVlabFkr?=
 =?utf-8?B?ZmN1R2h2NCtIQnEyZ0oxWmtsNUVNTzgzUGpJWlNoYUpMNksxODRGUVdHZ1pv?=
 =?utf-8?B?dUNsMlBacm1kRW5GcGIvejJQMEV3UitVblpkNUIrZGJaZWkrQlBicDk1TVRX?=
 =?utf-8?B?Y3BmMFVwWUJ6TkcyOTQxbHB2aE1hV2dZUlcyRXd2cDhKMExIZUNQOGE4czZv?=
 =?utf-8?B?RGZ5RjVyVms2Sk5oNkM4SUlJdDdBQ1FBVk1WUzRiVDhvRmI4OEU5bkFGK1g1?=
 =?utf-8?B?WFpRQTJQVTcveDJXZUpWREVTcjByS0tOeU5takg0dFlIb0JDbFU5ajdiY09C?=
 =?utf-8?B?L1pyazdSNTZzNEQ3WU9qOXlhcVN6N2w4NmdJTmN2NGNxNmlLMnVkTXBLOGZk?=
 =?utf-8?B?bUV0MHVtem41OHV0cWJ3UXZ6WEVla1czK21rcm5XTHh3SDJYS0l6UzB2ejFD?=
 =?utf-8?B?VlNWeTdFaHRGZzFmcGJ4T2t5Y0hxenA3eTlKUy9SSVBLb09HbWFQd3JxUjls?=
 =?utf-8?B?S3ZFYXJTZVMvWFV2aTNJa3JNRk00bTZycm9MbE1LVVFneXExUGE0SCt2Y0xx?=
 =?utf-8?B?QmZkQytaMUMzbExRcW5yQ1JCeXZqVG56R3Y3VEhYNmx2eUFjZ2JiQnlzaFRv?=
 =?utf-8?B?bE9FZk80ZXFGaXBmZTVxeFEwTWw3THVhdUVGbEdNc3llWmpubkNrV2dRMmZX?=
 =?utf-8?B?QXByMllGdFg3VkI2UmduZlNKL1dJc0ZRVTZ1eU9nMk40allPckY5dnNhYnB5?=
 =?utf-8?B?V2c0MnI0S3ZoU3NFWmxZSmR3cEtiMUpVMnI3bjNaaU00Mm1ubWYyNUE2TGk4?=
 =?utf-8?B?aDQrRCtRMjhmZkdGaHhVUzdHSGJiRGMrK1dUYzZBbEhxa28vZ1lVQThuZG9R?=
 =?utf-8?B?Sy9OS2VEMGVLU0F1SjM5L0ZmNkxXcEZKVXVkZWF3dklwUzBxWG1uZ0dyWVFJ?=
 =?utf-8?B?dUtLRW5uRy9MemNiY3BrT3RMVE5EMFJzODBmZVJIMFZjcTlrc0hFTVRkR01t?=
 =?utf-8?B?MVprb3RrUyswTDlORzVMaEJNQ0RrUGl6cGJpQjgvUExTRktFbkRRaFVoSWI0?=
 =?utf-8?B?K1hXK1RrV2VZUXo1N1k2TXVESkYwN24xRUlnU1ZZOE5obGpXTXJrczVGWU9m?=
 =?utf-8?B?YWtVSGROVzEzaW9HVTMzNjdLczhkTHM0NnhoVk1sOGJabUs0QWVUNTh0UjFC?=
 =?utf-8?B?TVNnVHJiTzV5VW1CY3B3N09YUzJHN0J3dC9NT01sS1BPU1M1YkI5Zk1FcEJa?=
 =?utf-8?B?aUFhZ3IvREJHcHBWVDM2dlhWMlBEU1RXMXN2UENyQTF2OVI0MEhQZU5Xbllj?=
 =?utf-8?B?OUxBVlM0R1g1L21sUk1tWWIzYmVYV0N2YzNSQUFFM0hTMVZwMTM1bGdBNDVE?=
 =?utf-8?B?U09pUVF0RG9VV0ZuSUdoSUx5VzJHeHJFVW1pbVpTSG1VZCtUdW1zL2taQjdS?=
 =?utf-8?B?VWJ4SFNNazlZaCtud25OSHF5T25saUx3a2phU0FwN1hXcXpIMmtFVWllaFVa?=
 =?utf-8?B?bUdNa0pQMHJpOWtoZzM3MHZSd3ZRUjVBdzNZZE9OWFU5bUZUTStsQ3YwcG1a?=
 =?utf-8?B?UjgwbDRGZm13S1VzR3I5dWJwZmZRbmpLNFVuaklFNDNkdEs0bkdyTTFVemg4?=
 =?utf-8?B?V2xuTnMwekoyend2UkYrSm4xOWlBUHovanVDNTNydDhHMlVBb0dUWlRKUWdU?=
 =?utf-8?B?eVVpRzBvNENhY09seFZVMmZaSTVEeWNNQlhZUzNvT2FXZ0Jra3VHTzRiclFu?=
 =?utf-8?B?aVZmVGJFL2VqZHJIclpkN0pwTllqOTlOM25xa1BaODZXZDMvQ0JGZEpUSWMv?=
 =?utf-8?B?UHpxUGVxUDZCMTFTUzAxK2pYY0xCaWkwMVFVMlZFQk5sbExDZ3JoMXlidGN0?=
 =?utf-8?B?WnV5VWdoeUEzYVI1VFN0bDZDMXVXeGpIQnJYUW9uTDBMRUMwcDRYQ0FYbmpK?=
 =?utf-8?B?UUdMWStVYVo3WDk1bUg2QWxYdEZRblhTMGRjTVpBR0laVGIzWVJMY3hLa1lk?=
 =?utf-8?Q?ShTL/V477AChV8o7lqrFaWE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c13008b-5703-419c-9bc2-08d9bbf23ea2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 15:32:16.1027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1l1e85qubiduAzhjFgKRSleW2B8Be3bZFRH2stoPD3i7VdMS5EmD349M82EHP6X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1837
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
 xinhui pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=c3=a1lvez?= <siglesias@igalia.com>,
 kernel@gpiccoli.net, kexec@lists.infradead.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, pjones@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.12.21 um 16:24 schrieb Guilherme G. Piccoli:
> On 10/12/2021 12:13, Christian König wrote:
>> [...]
>> How about issuing a PCIe reset and re-initializing the ASIC with just
>> the VBIOS?
>>
>> That should be pretty straightforward I think.
>>
>> Christian.
>
> Thanks Christian, that'd be perfect! Is it feasible? Per Alex comment,
> we'd need to run atombios commands to reprogram the timings, display
> info, etc...like a small driver would do, a full init.
>
> Also, what kind of PCIe reset is recommended for this adapter? Like a
> hot reset, powering-off/re-power, FLR or that MODE2 reset present in
> amdgpu code? Remembering this is an APU device.

Well, Alex is the expert on that.

APU makes the whole thing pretty tricky since the VBIOS is part of the 
system BIOS there and I'm not sure you can only re-initialize the GPU 
without a complete reset.

On dGPUs just making sure the ROM is mapped and calling the VESA modeset 
BIOS functions might already do the trick.

Christian.

>
> Thanks a lot!
>

