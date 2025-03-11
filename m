Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA95A5BC62
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 10:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEFC10E549;
	Tue, 11 Mar 2025 09:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="ik5NxzOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013010.outbound.protection.outlook.com
 [40.107.44.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E351210E547
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 09:35:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBlxtPaRhTue2pVgyDMjT/Z8LCgJPAYKxfNrRaceVzLQMwFf76WZPEYbWwJTj1XebPB2RjhXEJfZ75kdV9bWw8mpwFb7KMf9fmIhaT1qnAKJanv714XESC2Rhv3lwsU9ut6T0j21wZwF2fb/R5DQw+Skru7QAeTRQl60K0/j4QYLHAufVSNTtYyTsCuqxF/bc9P13qLJd/3YluWBv4hGrb55JzLdGY6TbA8JbXHgufMdoMp5svFgm71hY8UNTBko4tjIaMLs3VPM91DascoDE5QeZdNcVA32IAGDN5racrjsV5MFBQtqoXVYNkmA9QmNJkmuWAwpNQLPVzVDmHsa+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/O9eHrCaTThyzdZ+4hLwEb1RgcCD+E/ziDm3Lvk79A=;
 b=EysPIn3ia6ioQ/+5DUkFwiS6FkCz5N9qS5lozrzNAqKt6Wpwhx43imeYgfGu8OynbTMXDg8JH81qthX8C0pAP2iHfw2MQj6tB5alcnZYZweqpy2QZK2uY84/+sKZJlCxtLKh4DKfkmHGmw0BM3Q7I9vXTF43nhij/suadHOzQjXBeyl3A8gwj8jxO9EdR6EpH2LkKAgW9yw2IrT8IMl4dAI879Mrdc3oXQahSOR2449AS78Rb/G/uW4TDorjlwrvtsZWp+tQspEFEXk9iAbEhJ/L3pvqXyVWDnR9cweMfdx/IiEwWuTKTzdBMPdYQIIPw707w003u1Tq4XQVVpMymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/O9eHrCaTThyzdZ+4hLwEb1RgcCD+E/ziDm3Lvk79A=;
 b=ik5NxzOpRQ3ibSA3KqLXSAmyN3MJyAugFxLk4jZ57XOi3x82bSqwAhPAmqLfrzQZ7iSMsSpk6Gl3aSDcnO1uVpJGe5l+kMC3Wz6Q68HX0rCt8KuLvfK0EsE+86IXta1rgxLAKtYYYOuSfM5t2mOgTqrkpceq8U0coK5ShNW02+yWg949WzKSdiZJb6ZTK6w7dqSX0hC4biHT/K/tvRwH8Th4GP9A/8OBGAjZp3zcmbv1d/RekLnCzAH6CmdF7XfiJ8KjZM7k5LwIeCXzaCTyxsxL4aMEqeO4icFo9q9zpXVtBqliu0I5mCbhmqf6cF2eO3yge+bYEnXDQnKSSof6Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5010.apcprd06.prod.outlook.com (2603:1096:4:1b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 09:34:53 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 09:34:53 +0000
Message-ID: <5da7bd8a-c6db-4995-b947-444e2c78aa7c@vivo.com>
Date: Tue, 11 Mar 2025 17:34:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: udmabuf vmap failed (Revert "udmabuf: fix vmap_udmabuf error page
 set" can help)
To: Bingbu Cao <bingbu.cao@linux.intel.com>, vivek.kasireddy@intel.com,
 ryan.roberts@arm.com, hch@lst.de, Ryan Roberts <ryan.roberts@arm.com>,
 Christoph Hellwig <hch@lst.de>
Cc: linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
References: <9172a601-c360-0d5b-ba1b-33deba430455@linux.intel.com>
 <d7a54599-350e-4e58-81b6-119ffa2ab03e@vivo.com>
 <ab468ce7-c8ac-48eb-a6c0-386ea7aa9a0c@linux.intel.com>
 <78cd737d-5e85-4d3c-8bb5-0b925d81719b@vivo.com>
 <29445257-b8df-72bd-0650-44c8deb1506c@linux.intel.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <29445257-b8df-72bd-0650-44c8deb1506c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SG2PR06MB5010:EE_
X-MS-Office365-Filtering-Correlation-Id: 487b063c-598f-4fc3-f6a7-08dd607ffa0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|13003099007|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEtRK0xZTkt2ZFZMbURhTWtkSGRKVzJDREdZRkl4bmthTEdBUmpIUlA3eDUr?=
 =?utf-8?B?Q0pZNUtxajNpUjhiZlMvd2x1Wi9uTjV6R29vSlpaZ1d4eElKTS8ySlMvZUt1?=
 =?utf-8?B?ZTJwZWhla05sODRGS2tMY0RaRG1EaDNITUMxU0tsaFV5LzBLalB3MkNSamJO?=
 =?utf-8?B?UzdIQmJ2bThiTlRmbGZCcUNTdHpKNEU4Q1BGaS9EcngwNjFrUlp0UEN0K3la?=
 =?utf-8?B?dFJkdnI4VUJrWWpEVzBqOUdmRE1Ma0xOL0FPcERrZUNBeUdBQjZWOTBWcVQ2?=
 =?utf-8?B?dFV1NDI1T0tUcE1Qbnc5MDRTZzRpTXJuQ0hadHUveXY0Z3JnR0lzdVNKdnA1?=
 =?utf-8?B?Tzh1N0RBZldQMC90aGpma0FzMVdtV2x0VTFLVWQyNlcxV1AvazZUMGx2dDZ1?=
 =?utf-8?B?ZENMc2RsZEpxYnZZb0szZkg3Mi8zbGNZTXZKY3NMREpIWmVNbjlSZFZZbktQ?=
 =?utf-8?B?ejYwejhnSW1zWGk4c25aYkc2eW9ScHVTbEdLejRyeklBak41Q0ZEdzl0RHJU?=
 =?utf-8?B?WXlvOHhScGEySHF4Y0F5Z3g4UEo3TWRHOXVQVVJWRXovTERacDhsb0gzRW91?=
 =?utf-8?B?QVpnM2F4c2h1aHhlNFM0SWdsQmJWUU00RGNKVkE2T0Z4U0s3bzJOdHpXMGQw?=
 =?utf-8?B?OG9qUVNQY255Z1lMNFZ3VlVPd05PcVFuZFBEOFM4cElMaHdpUDdVUC9FUkV1?=
 =?utf-8?B?YVJoZzQrYTJWWDNTUjRkcEkxTmxEdHh5N2RmQXdGeVd6dkxyYzdyM0NTSllj?=
 =?utf-8?B?VFNENHlMNlBNQSttMTlQU1d2TjRCa3NjODEwWU9kK2dOVnpiRDFCL29zWm1D?=
 =?utf-8?B?UnVNRHhFSVoyTmFIYm9wK1BGN0NrbytXK3FsNC9MMXBQblBMNCt4WWp2QkI5?=
 =?utf-8?B?MFhLSjdCemJtYTdsOHNVaDZHYmhVbldZdk9iVndFdGJqeTk4UWU4dDV5Mk1t?=
 =?utf-8?B?M0l2ZEg2TkhyK1pRekcvc00wWWNONk1IWEZlR3laZ3lweGdRWEVMbnJFUXpJ?=
 =?utf-8?B?T2JGbXFmYVM5VU91WmlCaWVwaWJha1BDOGwwdHlLT2hsak5JRUJJN1Z6ZWtK?=
 =?utf-8?B?dHBFdjhJZENseVozY0JGWjVSU05KYVl2UThOTWdCRCs2RFdsQXhRaURPMWtt?=
 =?utf-8?B?YkRpL1lIM0tLb1hqR0JueVJPZ2YwcHkycWU2ZlIzd0NUUjhjbjJ5UjFVY24r?=
 =?utf-8?B?RnNOK1pldVhZR01GMFowUmxBM1ZjM3YvdXlUYmVCUEdjcmNMcExReE84NVpT?=
 =?utf-8?B?WmJIL0tzenJ0aXRvaW50L010bVpQZ2JCSzgwaDlWRGx4RVZzRUt6ejVrVGhT?=
 =?utf-8?B?U2MrLzZ5emwwcElXZU9rRy9PdldVSkx1UWlMR2dwT3pEY3VBZ295M1hUa1dl?=
 =?utf-8?B?M29tekdyWHZQNUk4YWNQY2R3b0NXYzRkTCtsaUdHUTJzb2pzblU2eTRsNkVT?=
 =?utf-8?B?aEpOaXF1SFh4Y2ZTMDh3NzBTcTN2UTRNVXY1Ny84TjZMQThFaTZoM1VadStQ?=
 =?utf-8?B?azJqUVpsc2wycW4ySjFid01IR2VPRlZyUHpnK0dtc3ZYcWVtTG1weFoxS0Vl?=
 =?utf-8?B?cmxTMUp5VHlvbE5hNnR0VDFaaEhDaXhrVndjQ2dQY1B5alJ3TnV0Y091Y09R?=
 =?utf-8?B?VjcvZWc3WnlMekNHWFRVeEN6a052d2QvRWRjR1JINnVPdjFjaUw4N3RCODJN?=
 =?utf-8?B?dTlTNFhXUjFZVWF3OTVQMnFEL05SaTBmN2c2RnM1T3ZZcDJFNTR4NjYvNnBJ?=
 =?utf-8?B?R0pTVWsxVWNBMVRrSVJuZHZkZzlmaDBmaEpjSWZVbzhubEhIWUNCaWpsK0Ni?=
 =?utf-8?B?dm9NeWNSNVluR3NkUUVQdmxoN0Z0ZlI0VHEwNy9oRzF6T0hZZlE3NEliWjRm?=
 =?utf-8?B?cjNKM0RWUm1IVlpFMkNiSTNtR2t5WjF1c2lUOHpIVFNXbkM5QlgzRjF0N3pp?=
 =?utf-8?Q?0EmX0hzP83RWVoD3tdztD4kZ54rx59Es?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3JVYlhTbFptU0dtaUlXYi9qUUtVeXQzMkZ5R0dyK3c1b3FhWmV0cjNWUDBi?=
 =?utf-8?B?akN4b2llMTU0WkpMMkRTcmVLMGQ5MkxNNzdYVGVVbHNrMFY4RzgxdVpXYXNa?=
 =?utf-8?B?eGppTkhzWktJb052b2RDZ29hRDd6MkVqeGFJbFc2a0JjTGlkUEFXQ1Z3ZHJx?=
 =?utf-8?B?K01rdTYrSUREVzNHOFgrdlFUNXdBQTdkMnNjWjJ3eVFYT0ZCSVNOTjhnTnVm?=
 =?utf-8?B?REl3ZzlRblNIWHRaNmtMZnBIOXRSaVI4SGZkbU1PSmtKZVA5VlNVdjdoN0pr?=
 =?utf-8?B?SGlYTDRKeW1TOU1XK29lRjRnWkQrN29XYlhkMURLRW5xeEE0TzlBVUp5cXpT?=
 =?utf-8?B?Uk1RYVcwYmlHMEk2T05vdkp1U2JvS1VoR29FSEpIVmVkd3dJZ3lMR3NQbFUy?=
 =?utf-8?B?L1V0d1pVWndtdFh1NDZ2OXZ2c0QwdVlFNUVWU3NneEdTN1kyMUJUV285M0JD?=
 =?utf-8?B?U2Z6VlY5RXkxUmhHTjJFNTY0ZUJVdC85TjI1b0FJVzV2SU5pZGs5MFl1a2ZX?=
 =?utf-8?B?cUkxd09jZUx3SWFVL1k1OThtdDI1V1F3QjkraEpHQm8zdFlUWCsxcEJpRVFh?=
 =?utf-8?B?UUgxZHl6aHlkaHl3NFZwMlZIZHRYOS80QnZzd3hwQVhHVkVENEk5VnpHb08y?=
 =?utf-8?B?QWdaL3ZHRGVhS0hmZlI4YjhmQlJhOVpxZnh0alBNa2xLMVJDOG1YQmlLR2lL?=
 =?utf-8?B?eklwZk9mK2FLdGVPMnRJdTFrY0RHQzhNdWtHcSs3K0FpYmFBb2U3VFNqZFE5?=
 =?utf-8?B?dUpvVDA0WnpUQkNXS3p5NUtXczNBUGN6Uk94b0hqeEplcjgzd01zNExGM1Vi?=
 =?utf-8?B?eDFqOU1DNHMweGRUNkxtaHBtdm10Z1N1NzcwMmlhY0hmTmdxTlc5aUx0SW8w?=
 =?utf-8?B?SWprN01iUGlwN1k3SjZkZ1NWV2JKakJJakVkYkNheGh4alZGTk9DT3RRQ0tX?=
 =?utf-8?B?aGM1M0ZSU04rME00U3JoWkRRazZFWitqVDV4UkZDdE1GcGlkRlptelVMajd1?=
 =?utf-8?B?SGgzMStmbFVwbGNpOGQxSnJCS3BqSVpBcitnZThRajBrMzRrUkJsVzF6VEk1?=
 =?utf-8?B?MW01clZvNzRHY3J4eVlqYmRCblNLRy9xd3BJNkc4UGQ2N2hEa1JtRURTY01v?=
 =?utf-8?B?THdyeGgxczYvbnNJTHFkR2paZXExd3pSNEtsdkdNc2hiWmczRHlxdUlwZndL?=
 =?utf-8?B?ekRCMm43MVN2eXdEanZuSnZPZ3pkNFovMG1aMUFnNFg1aUFEVEo2TnJsblRa?=
 =?utf-8?B?dFlsNkVtRE9RSWg4b3FWQ2hVL3FQMSt2WGdLQ3gyL0txSHhrUG5mV0FSY3h5?=
 =?utf-8?B?cjhXaHNTL1lLZENsMEdXMUpxNDdkaWQ1c0p0TCtvSEROc3J3RU9YQmZqMVpX?=
 =?utf-8?B?eVprdVRBM3I2dzN3ZDhRdWlVanZTeDZPak9obmtudXBHbEY5QnR3dWJESXNQ?=
 =?utf-8?B?YkoydmpnWElPVzc1RDRCUjdxdEVyTkcxYU1xWmQwY2VhdjBjaGpaenRFU1Rn?=
 =?utf-8?B?ZlNIUndHczdtTngvMERYdmFvNUlTalk3TExoMEpzZENqZktORlJnQzNER2g5?=
 =?utf-8?B?UmZHb1l2MnRMNHlhNGwrakExSlN3WVVGNXpyRHA3M04vZnVvZHR1c2E0WEpS?=
 =?utf-8?B?dFhRWlIzUDZLcjJmRWMrZHhkQlUvbm5qb0xVQ3JaYUxKVzUzUW5qemlhWWNS?=
 =?utf-8?B?NE41OEROdWkxMEdYa2xXUHhnaDZ1MkhNZUxxWGY0RUlxZlBTZlN5YWhGMEkx?=
 =?utf-8?B?SUNRelJFK2hDcjZqZzEydFFob3hRM3h4VlFtTmE5TXI2dmRMREZZRks5WktX?=
 =?utf-8?B?RkN6MkJndGszUTlWVUVsUE13UURYbXhqMmN4SE5mcnlUaW5oY1dBc1YvNVJq?=
 =?utf-8?B?T2dwR0NBS2JCRW9jVXA3ZTVFdThyQUtvNGxoRXB3NE1VZUhTNjJ3eXI3UXh6?=
 =?utf-8?B?cUMvNFR2azNvQ2ZQV2QvZ3V1Y3JpR3pvMFhTd0xyWGxza0NnQU1OeE5WNnAy?=
 =?utf-8?B?dVRpNXlEN2Q5R2ZjUmt0RkFIV2VENzVmbjNLN2dlV1ZsNk9DWG9LUU9BQS9m?=
 =?utf-8?B?dTlleFZIQlI0SXlUZUppc2ZyR0VJTmEvNEFLVW4xeUgvKytUbzJjUUV4UWpw?=
 =?utf-8?Q?V3eMGWadJFlpegmpQ3MQQr+9L?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487b063c-598f-4fc3-f6a7-08dd607ffa0a
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 09:34:53.0525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQk2RGKNaqQannNwOkjjECj/EfeLuxHb/CTWut162Mi2ATyL77ViRukMUkhReysaVlmB/KKZ4rCZh8rQ5LXGHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5010
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

Hi Christoph and Ryan,

Can you help us check vmap_pfn's pfn check is right? Did here mischecked 
pfn_valid?

Thank you.

在 2025/3/11 17:02, Bingbu Cao 写道:
> Christoph and Ryan,
>
> Could you help check this? Thanks.
>
> On 3/11/25 4:54 PM, Huan Yang wrote:
>> 在 2025/3/11 16:42, Bingbu Cao 写道:
>>> [You don't often get email from bingbu.cao@linux.intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Huan,
>>>
>>> Thanks for your response.
>>>
>>> On 3/11/25 3:12 PM, Huan Yang wrote:
>>>> 在 2025/3/11 14:40, Bingbu Cao 写道:
>>>>> [You don't often get email from bingbu.cao@linux.intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>
>>>>> Huan Yang and Vivek,
>>>>>
>>>>> I am trying to use udmabuf for my test, and I cannot vmap the udmabuf
>>>>> buffers now. vmap_pfn_apply() will report a warning to complain that
>>>>> the pfns are invalid.
>>>>> I dump the pfn numbers as below:
>>>>> [ 3365.399641] pg[0] pfn 1148695
>>>>> [ 3365.399642] pg[1] pfn 1145057
>>>>> [ 3365.399642] pg[2] pfn 1134070
>>>>> [ 3365.399643] pg[3] pfn 1148700
>>>>> [ 3365.399643] pg[4] pfn 1144871
>>>>> [ 3365.399643] pg[5] pfn 1408686
>>>>> [ 3365.399643] pg[6] pfn 1408683
>>>>> ...
>>>>> [ 3365.399660] WARNING: CPU: 3 PID: 2772 at mm/vmalloc.c:3489 vmap_pfn_apply+0xb7/0xd0
>>>>> [ 3365.399667] Modules linked in:...
>>>>> [ 3365.399750] CPU: 3 UID: 0 PID: 2772 Comm: drm-test Not tainted 6.13.0-rc2-rvp #845
>>>>> [ 3365.399752] Hardware name: Intel Corporation Client Platform/xxxx, BIOS xxxFWI1.R00.3221.D83.2408120121 08/12/2024
>>>>> [ 3365.399753] RIP: 0010:vmap_pfn_apply+0xb7/0xd0
>>>>> [ 3365.399755] Code: 5b 41 5c 41 5d 5d c3 cc cc cc cc 48 21 c3 eb d1 48 21 c3 48 23 3d 31 c0 26 02 eb c5 48 c7 c7 c4 3c 20 a8 e8 5b c0 d8 ff eb 8a <0f> 0b b8 ea ff ff ff 5b 41 5c 41 5d 5d c3 cc cc cc cc 0f 1f 80 00
>>>>> [ 3365.399756] RSP: 0018:ffffb9b50c32fad0 EFLAGS: 00010202
>>>>> [ 3365.399757] RAX: 0000000000000001 RBX: 0000000000118717 RCX: 0000000000000000
>>>>> [ 3365.399758] RDX: 0000000080000000 RSI: ffffb9b50c358000 RDI: 00000000ffffffff
>>>>> [ 3365.399758] RBP: ffffb9b50c32fae8 R08: ffffb9b50c32fbd0 R09: 0000000000000001
>>>>> [ 3365.399759] R10: ffff941602479288 R11: 0000000000000000 R12: ffffb9b50c32fbd0
>>>>> [ 3365.399759] R13: ffff941618665ac0 R14: ffffb9b50c358000 R15: ffff941618665ac8
>>>>> [ 3365.399760] FS:  00007ff9e9ddd740(0000) GS:ffff94196f780000(0000) knlGS:0000000000000000
>>>>> [ 3365.399760] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>> [ 3365.399761] CR2: 000055fda5dc69d9 CR3: 00000001544de003 CR4: 0000000000f72ef0
>>>>> [ 3365.399762] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>>>> [ 3365.399762] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
>>>>> [ 3365.399763] PKRU: 55555554
>>>>> [ 3365.399763] Call Trace:
>>>>> [ 3365.399765]  <TASK>
>>>>> [ 3365.399769]  ? show_regs+0x6d/0x80
>>>>> [ 3365.399773]  ? __warn+0x97/0x160
>>>>> [ 3365.399777]  ? vmap_pfn_apply+0xb7/0xd0
>>>>> [ 3365.399777]  ? report_bug+0x1ec/0x240
>>>>> [ 3365.399782]  ? handle_bug+0x63/0xa0
>>>>> [ 3365.399784]  ? exc_invalid_op+0x1d/0x80
>>>>> [ 3365.399785]  ? asm_exc_invalid_op+0x1f/0x30
>>>>> [ 3365.399790]  ? vmap_pfn_apply+0xb7/0xd0
>>>>> [ 3365.399791]  __apply_to_page_range+0x522/0x8a0
>>>>> [ 3365.399794]  ? __pfx_vmap_pfn_apply+0x10/0x10
>>>>> [ 3365.399795]  apply_to_page_range+0x18/0x20
>>>>> [ 3365.399796]  vmap_pfn+0x77/0xd0
>>>>> [ 3365.399797]  vmap_udmabuf+0xc5/0x110
>>>>> [ 3365.399802]  dma_buf_vmap+0x96/0x130
>>>>>
>>>>> I did an experiment to revert 18d7de823b7150344d242c3677e65d68c5271b04,
>>>>> then I can vmap the pages. Could you help what's wrong with that?
>>>> Sorry for that, as I reviewed pfn_valid, that's someting wired:
>>>>
>>>> /**
>>>>    * pfn_valid - check if there is a valid memory map entry for a PFN
>>>>    * @pfn: the page frame number to check
>>>>    *
>>>>    * Check if there is a valid memory map entry aka struct page for the @pfn.
>>>>    * Note, that availability of the memory map entry does not imply that
>>>>    * there is actual usable memory at that @pfn. The struct page may
>>>>    * represent a hole or an unusable page frame.
>>>>    *
>>>>    * Return: 1 for PFNs that have memory map entries and 0 otherwise
>>>>    */
>>>>
>>>> So, if pfn valid, it's return 1, else 0. So mean, only 1 is a valid pfn. But vmap_pfn_apply in there:
>>>>
>>>> static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
>>>> {
>>>>       struct vmap_pfn_data *data = private;
>>>>       unsigned long pfn = data->pfns[data->idx];
>>>>       pte_t ptent;
>>>>
>>>>       if (WARN_ON_ONCE(pfn_valid(pfn)))
>>>>           return -EINVAL;
>>>>
>>>>       ptent = pte_mkspecial(pfn_pte(pfn, data->prot));
>>>>       set_pte_at(&init_mm, addr, pte, ptent);
>>>>
>>>>       data->idx++;
>>>>       return 0;
>>>> }
>>>>
>>>> Do it give a wrong check? maybe should fix by:
>>> I guess not, it looks more like warning when you trying to vmap a
>>> pfn which already took a valid entry in pte.
>> No, I think here check need pfn is valid, then can set it. If a pfn is invalid, why we set it in PTE?
>>
>> Also, I can't make sure.
>>
>> BTW, can you fix it then retest?
>>
>> Thank you.
>>
>>> However, the MM code is so complex for me, just my guess. :)
>>>
>>>> static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
>>>> {
>>>>       struct vmap_pfn_data *data = private;
>>>>       unsigned long pfn = data->pfns[data->idx];
>>>>       pte_t ptent;
>>>>
>>>> -    if (WARN_ON_ONCE(pfn_valid(pfn)))
>>>> +    if (WARN_ON_ONCE(!pfn_valid(pfn)))
>>>>           return -EINVAL;
>>>>
>>>>       ptent = pte_mkspecial(pfn_pte(pfn, data->prot));
>>>>       set_pte_at(&init_mm, addr, pte, ptent);
>>>>
>>>>       data->idx++;
>>>>       return 0;
>>>> }
>>>>
>>>> Please help me check it, also, you can apply this and then check it.:)
>>>>
>>>>> -- 
>>>>> Best regards,
>>>>> Bingbu Cao
>>> -- 
>>> Best regards,
>>> Bingbu Cao
