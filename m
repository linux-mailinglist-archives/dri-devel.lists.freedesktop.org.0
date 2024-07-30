Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC60941177
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 14:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9129D10E50A;
	Tue, 30 Jul 2024 12:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="qYGHgWHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2078.outbound.protection.outlook.com [40.107.117.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBF610E50A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 12:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJdLgjr5I15R8hAXRpv3jPVLM59EndiUVImeqOD/t6nI39bq2YtpYwIv3nRb3hLvDFrhrKoXMNW1iQM0O8EPM3idbpuDNJTAm2hxIGsSRStz86stwKdmN63XPmtvevaM7hzTIVhSvVdP+pYbfxplZi5azr5eKfBKRqLp4hBBH60DvbxuMhVMEpfWSfWwG539tX+Aa0PSf5k6Gka+1KN9Z1hbZmdJT18cyoNfcx4w3qTTd2biRxh2l9qXv0jYVxThYMhcblSvhE9jfgFX09Hgc0UiuumSFCbb1Wl/+NKdFoLW+IwI15PtvxRkA/jSdCTvx2+n6pSvpytvB7LornXDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmdVkcDeU1z0aYSqIMfqjo2tosEpadt428IBbZ+koCk=;
 b=FZop6QIgoFtp9bR8AOLDFaX50rU1jBVfeIBvpPz4VE6Sceuynuv1fk3Zhu+Lpk4PnatEhAhpvvJLYrDwKaChNFIamk9s0Gk2KwmD82PRHZu+o3O2skb3sg1Wfjnszg44Yieu524M7abnNmp2NHAFShmUfjBeFb1jVU6lDe75puGOpgSt1+1ftBSiYwzD1MChYU/audW4gzfe2/z4KPIkSNL9+ipRROrwnJ7sn9CPqEQNEJtGxV65x1L/Gf59lOD+3pCHGFnCQvlwSH2zfc1bzx7Af+A4Ql+/PqROwxhnptYhxn3RJE8a4fIfU/fNyob4Rygb0AAgqh/MttfkW28USg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmdVkcDeU1z0aYSqIMfqjo2tosEpadt428IBbZ+koCk=;
 b=qYGHgWHZAcBbeMsnGThulD5qj6RRfxyGEOrLWSksOqu8hh95686x9UQMvJdpRJ+JLlL8I9/bHtGCDWXWjkPC6/EgxBSv5L/Gf3k8DZfo0LaioXkjvEpoa09yFrjWeKoEq/hamfK9N3Q4h/jhdQTeGHq9L9KD2cILg+VWxJHDPFG1snBVYSFTq1pv1+4tZdSC7GU9QqTEpsmTfG7mruE2bvN6jPL0c66DgCPwEHIEaRXASdzYks+sHZntsrn6amqdcKu+yO67QGjEKv6to05BgyR7GjP/WllDewoP3ZoZ/4NCv+Rnm321Kx4/D/Mkt/CCKbMAZRFm1ROP3P9J/SweAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB6611.apcprd06.prod.outlook.com (2603:1096:101:18a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 12:04:09 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 12:04:09 +0000
Message-ID: <37b07e69-df85-45fc-888d-54cb7c4be97a@vivo.com>
Date: Tue, 30 Jul 2024 20:04:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <Zqiqv7fomIp1IPS_@phenom.ffwll.local>
 <25cf34bd-b11f-4097-87b5-39e6b4a27d85@vivo.com>
In-Reply-To: <25cf34bd-b11f-4097-87b5-39e6b4a27d85@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0065.apcprd02.prod.outlook.com
 (2603:1096:4:54::29) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEZPR06MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: bc83207f-9537-4df7-4845-08dcb08fb7e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sm12ajhxU0UwbE5hNEM5YmwyeFdXNlZ4UmhVeFpVTHY4YUlmTFduMWROOC92?=
 =?utf-8?B?TWxzNjNXOXdwMDV2NzRvdDVPUVAzUnNrTWZyWnlEaGVmS1JWaEVSUmZuTlR2?=
 =?utf-8?B?Zk1XSTNwVHBZMkExbzVSOWttdE4wR0t3MXJiYTFHQkFZbTJpc255bWV6R0Er?=
 =?utf-8?B?cmdwNFNwRnE0SUJwSWZOdHBWZm5FajJMSFdRdmowWWdybGY3UWlRTGN6aTBr?=
 =?utf-8?B?blkxV3FjRkg1Zm9hYlhqK3hjTEFhTHVhRHlvbnphdFhrRkljQzlFUytWdkRJ?=
 =?utf-8?B?UlhJSVQzTWJKMHNYT0RCQTR6YzJwSTROMitaZndBWjV1ZmVsblhpbWM4S2R1?=
 =?utf-8?B?QTJ0NFBqb3l1ZnlZcVozb0dkbnczSUk2TUVPN2VkS21tTktIazFvMXlrQ3ds?=
 =?utf-8?B?SloyS1pDU2x4ODV6MmJHSmxhckVGeWRGV1BuNHU1eFp3TkNma25vRXhHcHJO?=
 =?utf-8?B?bUZBOFlGQytiaXpHOHdQL1l1Sm5iSXdsTVl1N1lnRDJ2SG4yME0vdGsvM0ht?=
 =?utf-8?B?STJCUjhjYzZBaGZqTUx5L2w3M3JPVGhpanB5VHhudU9uWkZUVTdYQXZFVms2?=
 =?utf-8?B?MEFHT2xIellud3E2c0VEUHFXSmNyRWc1cEpVSVdSdFpKbHVKOE1ja0JIZXBy?=
 =?utf-8?B?Q3VkL1dtS3NZVWZiZVp4aHZBd0RJRUFOQXI0M3hKQ1ZOeTA1R29PeG11ZUNr?=
 =?utf-8?B?bVY0eWlSUEd3NzV2QVBPSHhQN2NqQjBjLzJ3bFNoY1ZxZDhQMUUxdi8vSjNq?=
 =?utf-8?B?RU9md3VzVE8zWTY4VlFGM1pmLy9UTEUxWktudTJjTUhxZk8zQWxHUkEzNnhh?=
 =?utf-8?B?eFFJOGNzZ2tidkZpWFQ2blgvMGJPWS80M1NuQnpTejNQTkE0QU1PT1dnNnpC?=
 =?utf-8?B?STBUU3FRdlBBaXp5UDIyTkk5UlM0MWl2VXE0L0xoS1kxeTVPb3U2Uktta2Jq?=
 =?utf-8?B?YkxaaFJGckFmOGh3ckU1ak1lc1Rud294WFBqdFQ5VmJIbjd2UjQzaXJJc3dD?=
 =?utf-8?B?SVJxaHdkcXQydlV6OWY3R1lTeTN5b2xUbzR5S1ZCM3dpejZ6OVpGdlJNZ2ti?=
 =?utf-8?B?a09zK3VseEMxdGhSejdLK2FpS1FkbVVGVldkL0NjRmw5cU5zbTlYU2I4aVF6?=
 =?utf-8?B?NWliNUFPdTYvTEJhWDRSYTNJSnBDY1RQK09aeHZEZWVCaGRMVUJSVFdzRmpT?=
 =?utf-8?B?OW5SUzZoc0lvcjQzSndudCtWaVRuU2M5RzZwVG1WMlBNMXJsQ09YNFpnRE5J?=
 =?utf-8?B?c0swVUtZOEpLTEV5RWorYlNqem4zc3VnRndEcFRockU0RkZCS0MwcjJYNkln?=
 =?utf-8?B?RW10Vng1YldjVTBsY25FTldWamhSYWhaWk5JbkxQSmtwak1jcWpJcXAxbnJQ?=
 =?utf-8?B?UkdEdnpONzRXNEpTMlFJOGFadXlSQlVkMTVpVXY4aWR2MWJ5b1hJVDhlSGQ3?=
 =?utf-8?B?am9DU0JkRVFlVVdMcllqdHlHbW85NDdmd3E2anRCY210azEzdzRkNXVXbXVR?=
 =?utf-8?B?NkF2eEtrejFOWDNUQ3BwZHFvTUZQNm1BL2JZL3FPZE92Nm50bU1sUVpKbVN6?=
 =?utf-8?B?WGRZaE5uVXhFN1NQelhPNXM1aGJWQVc5U2dZcXFRZUdHek0rdjNIR2VxekNH?=
 =?utf-8?B?andkeFFONlhpbnNTa0lHQ2dWTzNZaStLbXBTUmc1dFlsdW9Da2hLbW1vUmsy?=
 =?utf-8?B?cGIxbDZlc0V1aEJpcjJSSjk0eElNM2cwVTZuTzJ5WXVRSWVzSjZPYW4vemhk?=
 =?utf-8?B?U2lvVDZkRlI4RnNWS3VlZnptZE82cXdWTUFzbFhINFYxN0Rlb0hzNmh6YkpT?=
 =?utf-8?Q?M28ZD92MVedJM09g1HCCikqfxTSA3BCpFhwPY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTh5NlhZVEVqSDBVaElPNlhFK1loejFSMWZFOWFvMk5TSVRoRFptaEZuZVBT?=
 =?utf-8?B?WkMvZ2lzZC9Oa3N1aGFPa2N4UmdobHBoYThzSHNWTGpjcVVseEV4Nzh0cHdu?=
 =?utf-8?B?STdyV1p1THNVcHRvenFOVUNhbERhUzByRFgvOGIwak5CMzk1VGNuZGJ5RDRJ?=
 =?utf-8?B?Y1NBTGVObDVOV0I5Z1hGNEpTamNUaUdYSEJNOHowR0h1VWEvWGl1c2tWc2Nk?=
 =?utf-8?B?M3d4bHRVanRKd254dWI5ZFoyQTk5YVN3d0luWmJwWnZWM2JiUTlzVGdxemIx?=
 =?utf-8?B?OEcwa2JuYlVaS0IvL0RkMXNsYWt3QW9yNVkyNmUyY2txR255TTZncWNGN2xO?=
 =?utf-8?B?ZzNQMTQyUk55N1hGVFkwZlhCUnRyVXNYaExIZ01pZ2RPR1BWbWhNd3NjRTlL?=
 =?utf-8?B?bUhGR1RPZlpMaW1pcHNkeHFFUVNYdEFOYldqNVdFd0JrMCtYWFZGMXNNbC93?=
 =?utf-8?B?dmtRNm5LVDdmNFVoZTZKd0pQODdydXhBdThEUmxOcWI2UnNKMzZIQU5SVUM3?=
 =?utf-8?B?dXlLQ2dhZ2xpczJnZUgrRnE1dVg3VVRJcE10SUFmZ3cvc29qQmlLK0pVdzB5?=
 =?utf-8?B?OHFWTThJVThaZlR0MVNxS1B3VWVEZTdzM1JRejhSMGF5TFFjWjdzZ3NTZ2RB?=
 =?utf-8?B?U0ROcitZaVEwWnFIRWtleTA4RCs2WWhVOWU3Z05TbzhUUmpJOE5aOWFCaWMy?=
 =?utf-8?B?V2FwV3piYnpWK254YWZKRnMwcStSQzhPSG1XZXlVVHprcGVabjZ1VDFGbFhE?=
 =?utf-8?B?bWo5bmpoSStQM2dsc1BQK0hUS1RaK21FUm5jVGdZYnV3UVNyN1FTRlVya0pi?=
 =?utf-8?B?Q3lBV1diL01TSkxpYjB4NzhVS2pDWjBNL3dQYW1OM05uQ0xLTUdBM25XNWVW?=
 =?utf-8?B?cjRCenczaWtvM3AwNVpzT3VSb1FXemFNUGV6WkYyMTN4NVA0RlFOZ0RqeGlr?=
 =?utf-8?B?M3J5RlR3UGk0TWdvZEsyL3NEOGV6M2xlbnBZRnBkNGt1WVhKY2JtcUJBTFRY?=
 =?utf-8?B?Nk5ocHBCblBWUDBTK1J0VTgwcDdpSkNnTHB2eWdtNzFVV0JpZ2RyREJQcUJu?=
 =?utf-8?B?Q29IWDZBOGJQK1hUT0NMZk5ucEw2Ulp4NVFtcEJCeU1iOEQvbzhzbXYzT1Va?=
 =?utf-8?B?cVMzTll4R1Q3ek8xNnNqeVdkNE5XR2lSTXJFZTd2dkRrOG05aG5BeTZRcFkw?=
 =?utf-8?B?YjM2bmhaaGNzWWZpTzVja29ObW9DTWdqeWJ5dUR0OEdzeGtNeFVabXdKUCtw?=
 =?utf-8?B?RFdwaDVJR1RXbXlMNnIzK3Nvcm5pdGVPK0YvSTkrS1l1emswU2l0SEZIakdP?=
 =?utf-8?B?TlF5TkxXMVdPU2lQQWdxM3g0aTJqU2xuamowK0REQmQ1ZFk2OFR2QnZod0Ry?=
 =?utf-8?B?bGJLYTVVckRNc0VRd0N2QWJsMFB5VzczQzlRMHZMakJOa0xub0FQZDVtcmVW?=
 =?utf-8?B?ZGlWSXVINlg5eDFZYXJlbnZoL0RDT21SYWpoMjdpSVpoRlNUaW9XbFlyT3JR?=
 =?utf-8?B?SzdUVlRMdE12UWpvd05VeG5HUWd3M2JjSWxORjJ2d3I2bGZ5ZkQzdHFuY0dK?=
 =?utf-8?B?Zkpic2JMRUxpampYcEp1RWJWZmtxVTY1WVY2b1E5dVJEVThvMlJwaStvV1dn?=
 =?utf-8?B?RVV2aFpOaG5kOFAxME1CbnpvYjdGN2hJcFlkS2hwa0gvaUtOMkFrQnVNWVVF?=
 =?utf-8?B?VzVHNVJkN1YxdlNOeXNEem53cFBSb29xYWtJZmcwQVN3Tk5zMFd3RnlnZ3p4?=
 =?utf-8?B?S3k4VkN1a2JPVnRBcDRLd1Q3b3k3SUJpQ0x0TUtDcGN2bG5COUh0a1NKekhy?=
 =?utf-8?B?cXBJbVFpQTlFL1FGYmpVdXFJSEhPQ0QveS9RTFRjMUt2cnhEckhWZlZrVElv?=
 =?utf-8?B?L3l1cFNYNVh3MDZSKzA2Q2dHV1dwUlBROTQ4SjU5T3F6Rm1sM1FjdURBMFJJ?=
 =?utf-8?B?VllSVkRMMjRaeW03d3dORytISTZyNWNaQ0tIU3RBUEVpZ2lZU09WS1d1a3NV?=
 =?utf-8?B?ZUFETFJkZ05oZFNPMEFPdEExSEMrNVBzdG9BQTFwczZYcmtpdEdORXowZ0Zi?=
 =?utf-8?B?c1psSkxCZnVxTTZ3cmgxMWN1cEViWXUwblhQNkNLUUZRWXZVNlc4OWY1aDEz?=
 =?utf-8?Q?1uSFcfhDf3b6B8zgarwC/p+RS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc83207f-9537-4df7-4845-08dcb08fb7e1
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 12:04:09.3480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDkBtJTTeXkrce5oOSwiVoLMy1r9RBHZqWnbdcqCFfNAQQnOOTsqvptOEUiCRIKsS+isn5pV5x0GeARmg1Qg/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6611
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


在 2024/7/30 17:05, Huan Yang 写道:
>
> 在 2024/7/30 16:56, Daniel Vetter 写道:
>> [????????? daniel.vetter@ffwll.ch ????????? 
>> https://aka.ms/LearnAboutSenderIdentification?????????????]
>>
>> On Tue, Jul 30, 2024 at 03:57:44PM +0800, Huan Yang wrote:
>>> UDMA-BUF step:
>>>    1. memfd_create
>>>    2. open file(buffer/direct)
>>>    3. udmabuf create
>>>    4. mmap memfd
>>>    5. read file into memfd vaddr
>> Yeah this is really slow and the worst way to do it. You absolutely want
>> to start _all_ the io before you start creating the dma-buf, ideally 
>> with
>> everything running in parallel. But just starting the direct I/O with
>> async and then creating the umdabuf should be a lot faster and avoid
> That's greate,  Let me rephrase that, and please correct me if I'm wrong.
>
> UDMA-BUF step:
>   1. memfd_create
>   2. mmap memfd
>   3. open file(buffer/direct)
>   4. start thread to async read
>   3. udmabuf create
>
> With this, can improve

I just test with it. Step is:

UDMA-BUF step:
   1. memfd_create
   2. mmap memfd
   3. open file(buffer/direct)
   4. start thread to async read
   5. udmabuf create

   6 . join wait

3G file read all step cost 1,527,103,431ns, it's greate.

>
>> needlessly serialization operations.
>>
>> The other issue is that the mmap has some overhead, but might not be too
>> bad.
> Yes, the time spent on page fault in mmap should be negligible 
> compared to the time spent on file read.
>> -Sima
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
