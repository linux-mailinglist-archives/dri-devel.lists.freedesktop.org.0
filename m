Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC1A91DEC4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 14:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BB410E3DE;
	Mon,  1 Jul 2024 12:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mx++WN2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017BF10E3D9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 12:10:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSYi3pTx8mSjfdsnvn0xe56HmjUvrxNAPQOPgK98iJ04qcs2G9kL9eLYOXhVXH/ZwM9DKLXvUmygl7ECGS7Yx827wkwxhC/coqNkHksqN98p7TiTLnMd5acxKAiRPUS8foNSCnH7b4NS1PmfM0lLQvtL77zFZS34YbTFnos5GDD3IoDn16+nfIchujZX+S/tU7YhmrD7eQdL3qF0RPuE2PlEZiV6lqExqEXX+R26cSAEEJGbMZLjmkO1ukxxl3kvfk8wInnuGi8/0HFxE1cuywh6DLX1g5B79X+3muInXGnJrUhvFL5mfJyHK2zDXpbKphSY0Sc6kOnF/oo6nHArVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/KEgtped9l3OPAsS8/5++PhjlYe6gjLuwJo+HFJsjE=;
 b=ZkQ0B2jMOXZrsjVRX3/qplKw56bNkoDy0fsC5dOQ+W7KncurII5T0er/y9Gzb+l+WMqK7we9Sc31oHHUf2eHW6FvBdj363cJ6qrBunUPnovLdQ07Uh3RLJJW5aq18yCE6kpovcbIrWi7mZWEbIceg+gT9JHyDLqocA+cm4+T+JtHhZQKa9fo9pfZRAQpl1FUNn4nDYVWN9TlHjhslxTPyOVdsfsjRfrYG4ABgVAZd2YuXefnKDx6RTV8x+hpm+1jy/e3Pj/m/w4qoPbm4JjHPdGA9tFYMQwFimbQKheXnlrXXvzm+QVkYrB4MjVN27mvHNnk3ZEN29LgvlVFCCg3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/KEgtped9l3OPAsS8/5++PhjlYe6gjLuwJo+HFJsjE=;
 b=Mx++WN2lkp2i6pBMBZVc8osoome/+tYUMLZOkBTH+yOC53KRKRSZZdxHZ3OMROD6Psw7rHUrqQ8eCrX/WmuQk4C5h6K2RAI705WnA0unVjWL63H8kEOmYDsFvt0VhLMwWMO9aJQ8EVxNLgRI/LEd+IcjIZBWtuvdB1fjQEH8Zl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB9322.namprd12.prod.outlook.com (2603:10b6:8:1bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 12:10:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 12:10:26 +0000
Message-ID: <c31b6dfb-86be-419e-92af-61d9ad95c12f@amd.com>
Date: Mon, 1 Jul 2024 14:10:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] drm/ttm: downgrade cached to write_combined when
 snooping not available
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Icenowy Zheng <uwu@icenowy.me>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240629052247.2653363-1-uwu@icenowy.me>
 <20240629052247.2653363-3-uwu@icenowy.me>
 <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
 <2760BA02-8FF8-4B29-BFE2-1322B5BFB6EC@icenowy.me>
 <7e30177b-ff13-4fed-aa51-47a9cbd5d572@amd.com>
 <e9465468-b931-4171-8961-0f1ecd4a227e@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e9465468-b931-4171-8961-0f1ecd4a227e@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a30d900-c1a4-4e08-e112-08dc99c6ca9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SU96SFl6cFVHY1k0SXBTM1lnQ0RPRG1rRkY2ZUxGN0hURTNCT0ZrdzRaWVZa?=
 =?utf-8?B?djVHRHZyWmtMZEN2ayt3U0NjelBMK2JHd2g2Z0srYlJNSGRpSEdHeXBNTUx4?=
 =?utf-8?B?T0xqNDhXNzJaVU44SFBqODNpYlJhM1Y3TktSK0NFc1RidEQ1eHlpTTIxbVFH?=
 =?utf-8?B?ZWIrakF5TVRITlJuOE1LWjRscHM5VlNkMDhGSzNLSnlUK0tFaE9jZCs2ZG5s?=
 =?utf-8?B?cTdvamJIcU5HNjRuc0dheHErSHJuaXJSd1JNOWl6OE5VeFlJR1FDc2NKTTRN?=
 =?utf-8?B?dHBBYUg3MGh4TGRMMmlZZUFRUlRFMEtqRkVsTFVaVjVPczJqdFlvdUdrZWsr?=
 =?utf-8?B?VVlpRjdJcU95NTZGeEFLaTk1UVFES1dlWXFhS2ZiYlpJQnIzWjQvdDl1TmM4?=
 =?utf-8?B?bWwvQjhzNW5ya1RlK2RkanUzNzlNaW1EZWJka2hkeHM2K3kzeDhwVmUwcjFt?=
 =?utf-8?B?Y1l0U0tWUTZJT2RnL0FUQ3FaaWRSUnZoaitoWWMwc0ZuamVDMzdxL2dNdUdO?=
 =?utf-8?B?c0pnODZRN1ljSFlQSjlxMExmbUFBTS9Ra3EvYldkM0FJcm82T0ZLY3hxZytK?=
 =?utf-8?B?ai9RcnBCNnpESEo2ZFM4cElIN1lSYmNTM21jQXZYbjRBdTZTZWtIMVhzZW83?=
 =?utf-8?B?c09vWCtSeGdMbFd5S1BQTGpEK1orNXBSaWRMNXRhQ2tiMlcvVW8vTzkzQWdU?=
 =?utf-8?B?bkZvZ2IvN016UTFtRVhqUS9VRGQzZVhNYVpkUExYUDlZdzhQbmZ0UGNLdWVu?=
 =?utf-8?B?NjViemo4b0lBdFNndysyNzJNbERjdDVyU05odEdlMGlXOCtUa3hKd0ZodGVN?=
 =?utf-8?B?TkY1UG5mUTByMkpqbXhPZUNJRjQwdWllK1pVZHlsZmowTDZDUzk4UHhIdVV0?=
 =?utf-8?B?cmRpa1QwelYrelFWUkZPalFYbTVOd1VEbVoyVWVueDN0T2tyR1FJeUVRYlZH?=
 =?utf-8?B?ZlpaU3h5UWpvZFBMNTRxMDlsbmw5OU5xekdVQktUNU5vZElSN3B1bXBFUDhU?=
 =?utf-8?B?Y2Z6VllxaVNndlNVSTFvaUVZelA1OENJZlhPN1lSTVpUWnF6Si9VNklIclJE?=
 =?utf-8?B?RUZqRXI0MWwwZUVsQkg4cm5OV2l1ZFdLTkVtSWtmY0daVEVrUExzN1BEdk5x?=
 =?utf-8?B?ODhZREJzMjhyUmlsTEVlcjhXZXl1V0dGanAxK05lYkpXdUU2aUpWc21iam03?=
 =?utf-8?B?OWhFL1hoVjdXb1pJZ3lTTTBQMDNqY1NxdkROa0JjajM3alYwWkF2QWJzTlNw?=
 =?utf-8?B?d2xFdHhsSXlPNnhwcXNRcitLMjVsTi96Z01oODJnbUtJckNldVU4SjNxbW5y?=
 =?utf-8?B?aGVvL3Y3ajZRTndXd3l1WUY3cGVxWlNzaFhYRncveUNYazMwTFRZc2lIY2VD?=
 =?utf-8?B?L2ZvZEE5cEx5TmF4WmhBMXhzVWRwRVJlTXZYOGIwaXp4MDJnSUFIVWl6VXVl?=
 =?utf-8?B?eWhHUW9iMTZnalRJM3EvMXQzZERPR3A3c1hrMEI2ZjBmclNPaXFWQ1pzNHBz?=
 =?utf-8?B?ZndtQTdrVGVnZDJvNS9BVjk5NVZaRldGNDFMWFpCdWMyR0EvaC94blY4dXB4?=
 =?utf-8?B?dUVudGo0WlRGWnpLSTFpS21CMkx5K2tVQ0FPdG1MMkpqY1k5eE1rUW1tWlZJ?=
 =?utf-8?B?V1I1b2VHMXZpYjlKWDVMdEpLN3BWMTlTWG4ydk82aTdxZFBvWlJtSVJRVUNo?=
 =?utf-8?B?RlM0bnZjUmVpbVZMeGU3R0JwRHJ0dVRzTDlic0hUbzhsamhLWnBGVDd5clk4?=
 =?utf-8?B?TXNhUStUaTJqOHFjeFJ4TGJTaXRkV0JZcnFBRW4wTXNjUUFJK2ZQR2p5eXJO?=
 =?utf-8?B?MC92VUxoeHZDUEcxaEx0Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2d3alk3cFRaKzdhWjdBcHh2VlhqWnVDWFF3Ty9BRXpwclYvUXhrdlBDVHRk?=
 =?utf-8?B?ZnFNSFpPNWJDOHpnSVhGMmVORW5Hem9XKzczNGhLa2R6dHIyejFMaU15T1hv?=
 =?utf-8?B?dEhyNmFBenFNRitDZXBHTTJvT0NWRWhvbHQzTDRZTmFlMkxjVkx0M3RtemNl?=
 =?utf-8?B?OWQwRzQrQjZNYUJWYmxvNGhKdEVTc0c5TXp5TVMrRklYcnB1T09CZlBhUnky?=
 =?utf-8?B?RVN6Vmw4cmpPOExvRVd3NDEyVTVTajdXSzdNUVcvUGFZTFhaMDJ5NTV5bGhH?=
 =?utf-8?B?aTJpK1RsKytWQ2R1emprQ0NKVWwxb3ZVaVRNLzR5ako2SjRncVN6ekNJV2Rr?=
 =?utf-8?B?WHFlMC9KMzUrdzFsMFJGYXNid1pNR0tRQ2tvcUJSdGNrM21Cd1VneWtiWjJy?=
 =?utf-8?B?R1NWazdZbGVraEU0ZFBMeEtiUWNBSE1rNStOMXQ4TVV4cDBYUFl3TkhJd2FU?=
 =?utf-8?B?Z1hxY00vWjVXaDJ6T1cwcXkyVHY2MnlGYzBHVURnalNqWGxJMVZMdEZyUkwv?=
 =?utf-8?B?UklmSFMxcFI1cnc1cndoUkxkcTFZWjZFeU82MXUzRlkzak9nWUIvd0lJN3RN?=
 =?utf-8?B?clAyamtwdTQ2SDVBZDFraXZBODB1aDB1RXNSd1Q3WVNtL0pock9YMXp5Skpy?=
 =?utf-8?B?VUkrcXlST2w1Qkh4TVBMWHpRaE9XVzBQalA0bjFEbDFCSGtJblJkcSt4Z2l6?=
 =?utf-8?B?OUtVWW9McHR5MXBiMDRGS0UzTS9hdHA5SVViVEFvcHhvZGFEeklLUDNIUlBt?=
 =?utf-8?B?aEJFTEk4SVh2TlkwRWxaMk9HZXFyMU5oZlJhVzRPcEFablpXRWpLNzc2anVS?=
 =?utf-8?B?NmJhdTRMM093U2NUQ01RRkpEcGFWN3Zsa0twa3RjdkJoVjFLTWExMkp2N2c0?=
 =?utf-8?B?ZmcwYk9JMUt4d0tlZ1Z6ajZ5US9YSVVSSmZCMlBwMThVOTlaRzdiWmhuWU5o?=
 =?utf-8?B?b01XVEltSEdxMHhGM3RXWnpuakN0TVYzbm9LS0QyVDdpUGFDUmZpeVhkdytw?=
 =?utf-8?B?Zm1lM2hNV2N2akp1SElLWGpqYTNXWTJpUTdnVm4rZG9uYjA3eXNyUzZyMHZR?=
 =?utf-8?B?R0VKSnV4SngrcGVkTnc2WGdhZExTeTN2M3pBYmJiTUtHTXdQeGE3eWV3Qkdv?=
 =?utf-8?B?WjZVRnhaNEJSQnB3WjBhQTJoK3lmVGtDU3R1TXViZXhQQ0hERmM3S1BBeVRG?=
 =?utf-8?B?Y3g0Zlkzek5jamdaU2ozYnpPUHVDV0Z1YmhWRUw3NzJMZloySEdtRC9iaHo0?=
 =?utf-8?B?ekpNa05vNENudytJV21QR2s3K0tSZTNLMklQcE51bFAvNjBPOVpnVnpFemhP?=
 =?utf-8?B?Y2pSOVprTytHNFRBTDdybUJSNDUvZ3Q0UGFnY3FKYjFnN1FJV0l5bnI2Mmp5?=
 =?utf-8?B?ZlFZTGdLOW84WHBMWnY4d3FnUGdCRFRMWS9oNHFHUGJna3ZvTmRRbHlTSThG?=
 =?utf-8?B?U0NtZ1hTNzJQMC9kMTh0bFU3MjZnQWdZYlJFL3QxVHdQOTFKWHhBSUdRYVFp?=
 =?utf-8?B?eVlSQ1RleGV1NFNVcVpoL085MWthMkRpbDg4ZmVneng3a1c3OS9KUEx5YmJN?=
 =?utf-8?B?QTlrbjYwT1NyeTNLOUVNL0g5UkdOaTUrbXdaeEpkT2Fza2dtNUQzUmRMZitw?=
 =?utf-8?B?QUEwTFU5NTZEVzZOTGlacmo4Z1pqUFpUWXpvVUx4aDA0SEY3d2pxeGZsVjhQ?=
 =?utf-8?B?OUROMTVWZ1FXZitqcEEzS1FJZnp6NjR0OVgyRDV6L2lFaVVoQkNLOWgxME9r?=
 =?utf-8?B?VHg2VlhGd0RzRzJxWFcxZnIydGNuanp1U1prQmdEUmk0d1V3ZlZMb0x3d0RX?=
 =?utf-8?B?bjJmMTFaM2dsdTRaVjNzTVZHY1NndWVCUGVwRHNaVXlMZDJ4UnFyU1pSa0px?=
 =?utf-8?B?VGhsRWd3WUNUMEZ5SGJCSnJtR25vclR0aW9yUU9jMTFqMVk2b25KVTVkYXYw?=
 =?utf-8?B?REJqZFpKUzdYMjhFcllFZFlyWEZVT3lvQWk1NmJuMU1kamVwdTJUL2toeFZs?=
 =?utf-8?B?aWpsTHZDNWZSRmtLNDVNREQzZ2dZNzlrL0R5S3k2dmF0Tzd3SHdqVXNFVDNl?=
 =?utf-8?B?RUUwYmV2bnlMY2hqazZLRVYxUnBaL2JZOHFvMWJSN1Uyd3lrNzJZQ2tGYW0x?=
 =?utf-8?Q?5e2GEe6rL27zAHn3gHE7Ho5/D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a30d900-c1a4-4e08-e112-08dc99c6ca9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 12:10:26.2806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/xS/XZ2dADJkgyAuGzt8pvqXkG1pc8jzE3LrbcGElOmYwhLL+19kk/frDhToJ3I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9322
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.07.24 um 13:52 schrieb Jiaxun Yang:
> 在2024年7月1日七月 下午12:40，Christian König写道：
> [...]
>> Ah, wait a second.
>>
>> Such a thing as non-coherent PCIe implementation doesn't exist. The PCIe
>> specification makes it mandatory for memory access to be cache coherent.
> There are some non-PCIe TTM GPU being hit by this pitfall, we have non-coherent
> Vivante GPU on some devices.

Yeah, but those are perfectly supported.

If you have a non PCIe device which needs uncached or write combined 
system memory allocations you can just specify this at memory allocation 
time.

> Handling it at TTM core makes more sense on reducing per-driver effort on dealing
> platform issues.
>
>> There are a bunch of non-compliant PCIe implementations which have
>> broken cache coherency, but those explicitly violate the specification
>> and because of that are not supported.
> I don't really understand, "doesn't exist" and "bunch of" seems to be contradicting
> with each other.

A compliant non-coherent PCIe implementation doesn't exists, that's made 
mandatory by the PCIe standard.

What does exists are some non compliant non coherent PCIe 
implementations, but as far as I know those are then not supported at 
all by Linux.

We already had tons of problems with platform chips which intentionally 
doesn't correctly implement the PCIe specification because it is cheaper.

At least for AMDs GPU driver we reverted to rejecting patches for 
platform bugs cause by incorrectly wired up PCIe root complexes.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>>>> Unfortunately I don't think we can safely ttm_cached to ttm_write_comnined, we've
>>>> had enough drama with write combine behaviour on all different platforms.
>>>>
>>>> See drm_arch_can_wc_memory in drm_cache.h.
>>>>
>>> Yes this really sounds like an issue.
>>>
>>> Maybe the behavior of ttm_write_combined should furtherly be decided
>>> by drm_arch_can_wc_memory() in case of quirks?
> IMO for DMA mappings, use dma_pgprot at mapping makes more sense :-)
>
> Thanks
> - Jiaxun
>>>> Thanks
>>>>
>>>>> +
>>>>>    	return ttm_prot_from_caching(caching, tmp);
>>>>>    }
>>>>>    EXPORT_SYMBOL(ttm_io_prot);
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> index 7b00ddf0ce49f..3335df45fba5e 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> @@ -152,6 +152,10 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>>>>    			       enum ttm_caching caching,
>>>>>    			       unsigned long extra_pages)
>>>>>    {
>>>>> +	/* Downgrade cached mapping for non-snooping devices */
>>>>> +	if (!bo->bdev->dma_coherent && caching == ttm_cached)
>>>>> +		caching = ttm_write_combined;
>>>>> +
>>>>>    	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
>>>>>    	ttm->page_flags = page_flags;
>>>>>    	ttm->dma_address = NULL;
>>>>> diff --git a/include/drm/ttm/ttm_caching.h b/include/drm/ttm/ttm_caching.h
>>>>> index a18f43e93abab..f92d7911f50e4 100644
>>>>> --- a/include/drm/ttm/ttm_caching.h
>>>>> +++ b/include/drm/ttm/ttm_caching.h
>>>>> @@ -47,7 +47,8 @@ enum ttm_caching {
>>>>>
>>>>>    	/**
>>>>>    	 * @ttm_cached: Fully cached like normal system memory, requires that
>>>>> -	 * devices snoop the CPU cache on accesses.
>>>>> +	 * devices snoop the CPU cache on accesses. Downgraded to
>>>>> +	 * ttm_write_combined when the snooping capaiblity is missing.
>>>>>    	 */
>>>>>    	ttm_cached
>>>>>    };
>>>>> -- 
>>>>> 2.45.2

