Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9796849DC23
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAD110E6A1;
	Thu, 27 Jan 2022 08:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86A510E6A1;
 Thu, 27 Jan 2022 08:03:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuTRizXua4ajtOax59GcvnydUvJFTGU5ajOyzMqR+BOtbACbr37AOHJZq+y/JlJAsaaonb81cvx4R1iwc40GFsSFfaX5mra3kUTy4ljd+4t7JO80gmwb+13XrmIKwTeHN8lenUHY5bfoMPUj8EiBXEuNkDM5bP9FQjkb1UFRBGlPwzq2FLQfgZ2q2/IM9PGW6/YorRgygk6pRpQkSfV9Wwwy+cCcQfeMoyY9p9UMl9vNI2WvRpTnKtp3xyNBe9u0bTsgjSXgnH54hj2dx+GI8ZQXxoFVUVHiXdn1vPichc6TM/jHXIDiplifb66s1outTjZvZ23lYyCfU13mkg/67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AR+EDFGOzsUW5LhvTdY3qjkB58bO4nC39U+i2bVySE0=;
 b=XPNIYS5gszOwOrSfb+xa7MuEElMPwtp+wobYff+kupiDypnUcby70BwDODypeh/yF9LVg5CU9lr3wsAOmkAGduhLNOQZM8dTcAQXqekNOmVhlmteX6r8+UzzJf6Jh80Sn4N/fZScXq8WG9BcrjE/exs+dCqzcUv3m5bFYMKHopUm6sM6wtvVhKkhQ37pG+XhvgxF58sKfZcg4krfRQC6l/Uh+OXqedJDeJSHsulygm7ZZ4SpzgoFrGN0HJmdJLLeib07aVv9nZvNoWkDUj60F7UFcB4ciSvQP8gV2skcA8e3Hxpxs0n3mY+UDl0uiDhPQbpQCAB9V1OIeL+PhhfoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AR+EDFGOzsUW5LhvTdY3qjkB58bO4nC39U+i2bVySE0=;
 b=kk8bFkFcOFFlpb3qCJpRv5DuEZ86rLUk0+UfHBys+MkpsOeuU/dOGRCAycZlcQpBI55W3IsQP+XvLmHy5nP2x6R/im0nf/3OKDRL24MyLimTunSI9da/pvGdZVLsw7qulk/F8z45cgQBjh5GEU/FSNuyjB4G9GNQmsyuXJe3biY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 08:03:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 08:03:06 +0000
Message-ID: <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
Date: Thu, 27 Jan 2022 09:02:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/19] dma-buf-map: Add helper to initialize second map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
 <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::34) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e0245dc-f281-44e1-032e-08d9e16b735e
X-MS-TrafficTypeDiagnostic: CO6PR12MB5473:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB5473DD5BC44AB7CEF7AC1EAE83219@CO6PR12MB5473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LX8U+OTeYsy2Visv2MIflc5t5HOnB1qYPCwWEL3dn92t2debJgxL/q3CASlBXj8MSRpGs3Z8fpFtaIv05OlRgsHQb1D3QppAmEHUXpEHVZ5/RDq0fnPx3LONfMZxQdyexz/7h8YYqqh69fVUst6UHBmZM6PoCJur/fDIc0CdsRHp2KbI20ZnpWXp0t1AzvtUHPXwVsEWf3tYPF6UdYFj1ujDCFSKmvEwO5AzA4bWqMi94CrOq75kta/v/bOJB9EORhk4ogK6AbVnPoDjZHLPJ6PB9RgG8TOLtJeBM9D2TEOgWbVlM6aWmqJT6sUbcM/y2VpZRyI1zkkWgqUAClCNXtw1nJQYN/hSZtQLem1ALJtYH333Ita7KojyKr3+8u3cx4iHn3OagaCPdkibi9C9CA149XeZAgajpbFXBPIIl9+TzLlmieyP/JZcgGOkDYNL8hYn8QQVzhgX9nf5IQBycVinVtY9AFsERV8VV5WuKFF9PmwfEPL+qnMSLH06szigE1v6wShUECYIDHxykd1aEaXhelrqh9Dvn9C6SFAgBnNjJ8U0VgH51Yp8nN8p2qr5Toho2cTYwK3b7hwOc/U+uK2ODWOwsutHdnDq2e8I9Z1MqVV4+hqRPBEWnwSoUshykPchr0Hrp6DyvMTTLQQUTfj+vEo4+hxxei6T9huoxuMbDeuJnbRtiljR/UyWKtKrxFP8C/xw0PAkEJDXv4QnTFoOeaoo6tdgoo5YjvBdcARjxyJifpIC6njt/MBuVMUT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(2616005)(66556008)(66476007)(186003)(8936002)(8676002)(316002)(66946007)(6506007)(2906002)(31696002)(38100700002)(86362001)(31686004)(36756003)(6486002)(5660300002)(66574015)(508600001)(6916009)(6512007)(4326008)(6666004)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE0xUVJYMFRvVnY3TzRLWjFSLzQvUmRiRWlJZzd4ZVM0anRHb0hsMWVkVVFo?=
 =?utf-8?B?NFZxeWZ2NFM1ZDBQeDB3QTBnUVlXNzFVSWxGa3I2N0ZXNjIxUXR0WXNrUm41?=
 =?utf-8?B?YzFHNlBBbWh1NWJRV0ZvTnV3S2FWdHVRMjJCM0trcHdEV2tlTzgwT1hWWE8z?=
 =?utf-8?B?WkoxTjVrSElrNG5XSkthWDZ1NlRnZVhRUDVQbDVZQWg3aVdNZ2d6aWswWFZF?=
 =?utf-8?B?d1prNXVEL1N1R0RoVktyeVc0UEorTWhmV0R6aUo2QzBPNzRlenBnMDhISFBC?=
 =?utf-8?B?SWgzaTN1M21VSDIwTTEyRmxadTlUTSt5Mmo4c0h5YXRjQk5UV05VYmYyZmJz?=
 =?utf-8?B?cVNJekF3WHFJTTBzWTc1aTdkYmlkbzV3dFN6ZURTN00zR2xBTUxQa3dwU0pM?=
 =?utf-8?B?YXVKUmNsSEdXbjdsby9xaUlUMnhqMzlVNngxRFM5eFZ6YzV2N0NET2RGNm1N?=
 =?utf-8?B?OW5wYlMyZFEvMmFmck5SRVo1NE5heHBISnBCVWpScXNva3pmN3A5WXpTUWcr?=
 =?utf-8?B?cHFXQU1BMVdEME9BZzc3aHl5VzZnK3NKcTZNaEpCNXB6UEEvcTZvUHdyY3pG?=
 =?utf-8?B?TTl5Wm10ZXBHQSt1N1VQaDlpaWQ5ek1RS2NqQWZza0NSRHhOb3o2aG9ZVDVE?=
 =?utf-8?B?VFVwM0pVMnJFY2pkQkplN1ZYWjRaeTNROG1vYSthbklTd1BIbmVCeGVSeVRX?=
 =?utf-8?B?LzY0K0FjakZDeXpybm1Xb3NtMXlKWFU5dktxSDNML2ZiYUJrVS9Xa0sxM09y?=
 =?utf-8?B?TW43TWJKR1BUZlh4WEU3SjZnMzgwY1hKanl2cEJSeXVCNGlBZDl5a2lnSWdr?=
 =?utf-8?B?eE93akFEWHFQdDZZYnBhS1d5MFJsUjlMbkR0SFZjL0M1MEFuQWErc3VuV1B2?=
 =?utf-8?B?TVpjQnJTMHFMZmNGVE9NUWp6b0oyWTlnK05YcUUxUHY3bWJzRnk1UVJSZGtt?=
 =?utf-8?B?VHFtM1FpclJIdXVlUDUrR2p1M3RKNmx1aUoyTFlJMTZyWWpVOHRQck5aa0lx?=
 =?utf-8?B?QkpUdndYV2c4N2RBQWViQ3hhNHBmTlN1K2lma0thUStrVGFiVllsV041Qm9S?=
 =?utf-8?B?MWNlNTdGN1YxUzI2R2h4THRTclRrZjlOUWl2amdrQ2o3TUNGMHYxMmIwY0ZF?=
 =?utf-8?B?M252bmpKd09vZ3AweVhJOVFSYVV5ZTBsRVZXQW9wcjJQN2U4cVZBUEdhNTFG?=
 =?utf-8?B?OVg4U0s0NVdBOExwYThCd3NiUXYxSGZSOVhMbEhVYXppNnhNNU9hOEpnLzJq?=
 =?utf-8?B?S01IM3YvclgrTXdES1BsSjRPU2tHNXFIV0ZZSUJxcW1TS05EVkZFY05UaGlJ?=
 =?utf-8?B?ai9RdHU3WVZod2ZXNDBoRWFDUHM5Tk9WbW9VZ1ZIby9tOU5wMkxaZkFsbFE1?=
 =?utf-8?B?dGlHdWNsZm9vT01MS2JseDlrOERsWXpaQStZTVpEL01ZSUhDRVphVENzNFV3?=
 =?utf-8?B?SWVxWUg1cHYzMlZqbkNRWWdpbUg1dWh0ZGJydm5qMGZqN2poQ0tYWDJKMWI3?=
 =?utf-8?B?STU2MERnbG8zTmZKQ1ZYbG1SK1F4UW5qcjQvMlNYdWFQdlBUVGVCdHNyV2F2?=
 =?utf-8?B?RFRrTlh0SVdVZkptMW5EU3dZeW5jU1A4OGd2WXZ4MGJ1dUNVdXBDU0h4MEJu?=
 =?utf-8?B?UTFJNzI4eHFNNVpJMTNzVlJ1UTl2RnplV3B6TnZoTjdyaDNWWmQ0b1M2ald3?=
 =?utf-8?B?dzQ5eVFiWkVmcGJoclZlTkZTMmFQd1VQZkxTQ2lhVGl6NHdQSEltRURrbTRx?=
 =?utf-8?B?QzdtZ1l1dUVML1VITkFzRTNaTWx5eWF5K3VrV0ZSd3dOVU96ZlpoY2VZMC9H?=
 =?utf-8?B?RXl6bnAwSXFweVlsTzRWdWQxTjZBMWcvUkhzRFNlTlg1UjladHZLK3B3RTYz?=
 =?utf-8?B?SDhlbDdHQ3VBYXBGOENyN3IvRFRLM3ZtMm1UUEIyUnJVV2pOaDIwYVMyUEhU?=
 =?utf-8?B?TGZoWVdDNTJlejI1a0dBWmdzcG1aU29YbDdWMnVrV0dBUHZpejFXd2lWVGt2?=
 =?utf-8?B?akRWeEU4c2ZiMkcwQUcyV0x6R0NUd09ibjNUelNoa01aUlZMQ1ZsUjF0N2Zy?=
 =?utf-8?B?YzJvcVhod2NrempyOExrdTMzc095Vm8rd0phYXcyQmhhenlRaERQbEw2SUtG?=
 =?utf-8?Q?S9Cc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0245dc-f281-44e1-032e-08d9e16b735e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:03:06.4802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ev7j0D85yEiTy+bY73916INA6q54x5FghEEwvXHcvtxFMo+fWkrbRtMUowMpQ/DU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5473
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
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.01.22 um 08:57 schrieb Lucas De Marchi:
> On Thu, Jan 27, 2022 at 08:27:11AM +0100, Christian König wrote:
>> Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
>>> When dma_buf_map struct is passed around, it's useful to be able to
>>> initialize a second map that takes care of reading/writing to an offset
>>> of the original map.
>>>
>>> Add a helper that copies the struct and add the offset to the proper
>>> address.
>>
>> Well what you propose here can lead to all kind of problems and is 
>> rather bad design as far as I can see.
>>
>> The struct dma_buf_map is only to be filled in by the exporter and 
>> should not be modified in this way by the importer.
>
> humn... not sure if I was  clear. There is no importer and exporter here.

Yeah, and exactly that's what I'm pointing out as problem here.

You are using the inter driver framework for something internal to the 
driver. That is an absolutely clear NAK!

We could discuss that, but you guys are just sending around patches to 
do this without any consensus that this is a good idea.

Regards,
Christian.


> There is a role delegation on filling out and reading a buffer when
> that buffer represents a struct layout.
>
> struct bla {
>     int a;
>     int b;
>     int c;
>     struct foo foo;
>     struct bar bar;
>     int d;
> }
>
>
> This implementation allows you to have:
>
>     fill_foo(struct dma_buf_map *bla_map) { ... }
>     fill_bar(struct dma_buf_map *bla_map) { ... }
>
> and the first thing these do is to make sure the map it's pointing to
> is relative to the struct it's supposed to write/read. Otherwise you're
> suggesting everything to be relative to struct bla, or to do the same
> I'm doing it, but IMO more prone to error:
>
>     struct dma_buf_map map = *bla_map;
>     dma_buf_map_incr(map, offsetof(...));
>
> IMO this construct is worse because at a point in time in the function
> the map was pointing to the wrong thing the function was supposed to
> read/write.
>
> It's also useful when the function has double duty, updating a global
> part of the struct and a table inside it (see example in patch 6)
>
> thanks
> Lucas De Marchi

