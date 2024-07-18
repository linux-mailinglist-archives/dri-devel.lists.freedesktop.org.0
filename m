Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B54F9345E9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 03:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BFE10E1F8;
	Thu, 18 Jul 2024 01:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="bIo7lFlA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2059.outbound.protection.outlook.com [40.107.117.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232B510E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 01:51:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNn/EAqvAuQFy2wbXg6v+D7el16I1x0pKsl6IZSaNqMP3g9x49xPN0KfW6huVFLxW6fGBb+YnlPKTdVIMBKdFogtnVnZIj/tAIGGL2Cc6n1AtK9xenY3ppkj39w3ntKgL43fvXKbI5+OncNAUFuSFlcyUc5IMeOShz2cUeRIvoEqTQWS8b3Ul1Lmk8U+KAvEb+/p9S2gUdEYxe5gbLkNnCrUtreQ2bgtxuZUUGY907ehSet4v2N6h3+z5vnDWZp+KPOIONxaS87f78PHaxE9Wg3Hl9xK1IH0qGXYFEU4Qkj4Nn0mDi+Sbhlh9Ujk8mjHzkhAbUzmFRDuixtLO2QrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpL7g4xdX7luCR1v3OrmoiAGKG0lpxcIFChmNB8OgHg=;
 b=O0zPw6Ed4IUqqp1WQONA8s5G0OL3y2QikhkEmwmtIjvixnhDDPpxrn+GTXI+yB2LaZzqEvPd8wT0aMeuqSG0hkpHtz8mElh1xYcmRzk/EkNixleaTy8HhlG4ktGLQuZdVMqntkWhJithvlvulHl8PNHlZXHLWwVGz6aeseDMY9aQ/xJZn/CDsHc0+r0MQ2ImllE1LBUItOhzzUU+zfNC39W1oQb5hzKq8s+s1wyQzzdi67k5fybuWHll4HwNn4XbyIFg97Kn/05bhOHwB4agT8bL7AGLFkIaIrDBM+9ev+8j0yQco+aIT9lgOrRQwDfmBsxGUxxSMtmTQhyT3HDq6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpL7g4xdX7luCR1v3OrmoiAGKG0lpxcIFChmNB8OgHg=;
 b=bIo7lFlAbdE4c2QnFjQP3xFFmjePqC+srKSqdXFCeJ8RRlZIdA0Qjf/lvGrNcFc8yLmFF/TDTInS8/d7QBHl5bf3aczWLR2kAKfiJNWJwNS0i3X4F2evUQI4WObtg5vS/eyAvD5wi6U+TpTl48QSk0PhUD6LpUpddmFasS431j/jKJ5pVNB9+Des3Eo9RlD4MQNVu41/Zb6meJHP5xFqnEGYUYWKBw0kWvxwA63YIEXxhQ3PjA1vTpdGFWulbzZd3TneT3bR7UbN1zgp/L7xV+PiMfgTIpgkbEVgjLwX3SV2+NKttJTuSf3gXn/KrEV9pKgxEaIFOysR5rUCwLZiuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYUPR06MB6271.apcprd06.prod.outlook.com (2603:1096:400:352::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 01:51:43 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 01:51:43 +0000
Message-ID: <7140a145-7dd5-43b0-8b2a-0fd12bb9e62d@vivo.com>
Date: Thu, 18 Jul 2024 09:51:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
To: Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240711074221.459589-1-link@vivo.com>
 <20240711074221.459589-2-link@vivo.com>
 <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
 <ZpTnzkdolpEwFbtu@phenom.ffwll.local>
 <99364176-a7f0-4a17-8889-75ff92d5694e@amd.com>
 <06713006-c5ce-4773-a1b3-ca3bea56ee45@vivo.com>
 <ZpY-CfcDdEhzWpxN@phenom.ffwll.local>
 <b18ad853-90e4-4ad7-b621-2ca8a8111708@vivo.com>
 <Zpff-8LmqK5AD-a8@phenom.ffwll.local> <Zpf5R7fRZZmEwVuR@infradead.org>
From: Huan Yang <link@vivo.com>
In-Reply-To: <Zpf5R7fRZZmEwVuR@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY2PR06CA0030.apcprd06.prod.outlook.com
 (2603:1096:404:2e::18) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYUPR06MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e3dc2a-1239-47a1-4546-08dca6cc2cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qk5nRFEwKzdBOWZ4UzJaOE9SaG1BejFzN3NGRGZsNDZrcnZPbWxuQW90dmRl?=
 =?utf-8?B?OUpyUnVHaCt2enBuQjFPalc2eDk2cFJtMXdmMGtxeXU1dTNueitsKy96M1Q4?=
 =?utf-8?B?b2Y5dU9HdHpYQSt4RGZOdUVhT2krU3VzRWQvbjVUYk4vUE82bmxteHNYVmlh?=
 =?utf-8?B?NFdTdHAyeUVBK2pNL0w2M3p2clNnRTZnNzlpNXpjV01KQkFRRURUZlhJL2VH?=
 =?utf-8?B?UlpFbWdtc3lwcjcvQVVTc3AwNTJpZWlOaFVubUJ1VTNDb0UvclM5L3JJKy9T?=
 =?utf-8?B?R055TTVFOStlTVJ5QzZsTVlkMzJ6OE16MURZdnJwMjNUTko0eVRUQWhsNDlR?=
 =?utf-8?B?TE5sNWRPU1RKUnYwSHNkTDM4c1dickFxNjZ5aEhNdWhZS0UwLzkxMEc4YW1V?=
 =?utf-8?B?M2VBb2dJN0ZUdW9lNmlFb3VzVnJyZ2QwZ3dDZUlDeWR2WDdYZUJBTGZXR2tS?=
 =?utf-8?B?QnMwbm0xNkswbDhIcmhvZ0Q5QWh0OEJKYUVHbStqMjJCSGs4WllCTXJLSTJR?=
 =?utf-8?B?TmVtaEdrakZaRkV4aTRveUVpVVdOczNEOTJFSzIvQkRuMFJPbjgyR3l3ZGZ1?=
 =?utf-8?B?NThYdWpMSUFaaU5TODd2V2c2S2R5MmZjcXZEUVRGckYzOWlLRmlZblNPMXJS?=
 =?utf-8?B?OVJvSlM4dkRHanZsK200TzVsbEFFS0FuemRBRTBXU3JKWExoVGk2MFhWNDFx?=
 =?utf-8?B?K2g0RGtZVTI3UktUN1ZMaDE2dmRxZHZJZFFHeDEzakRFOU5iWHQ2eTM5eERJ?=
 =?utf-8?B?ZlZvcVhyYzJZQXBPSkI2ODJjMXZzdC9RdERzZWY4SVVVN3NKSXBabnRwbklv?=
 =?utf-8?B?YlcwdWR4RU93dm9ialRsWm1meU16T2pFNHZML21YQlVYZDNzY0ZwODdXVElQ?=
 =?utf-8?B?dk5Kekl6NFdQZFpYbitrckY3RUxJWW9HYW90MHdYc0dBemVnVGN3Zk5sUngv?=
 =?utf-8?B?MUVRdWNPeURTVTVIcVV0c0ZnaTI1M1lLdS95bHpIeDhYQVY2c0RLTzBkK0t1?=
 =?utf-8?B?djdqNVZXUkVWbzR0WXFJQi8wdWYrQkl6a0VBSTFzUjhiRFJleFFBdVNMeWFm?=
 =?utf-8?B?Sm5ORG94QW1oUUt3b2RQR0ZUUDFxT2tUMTdubStYZUlUWGZyS1VJN0UrSlVH?=
 =?utf-8?B?OFhVMDFSaEpQbWZwN0JwdEJiaFVoTWs1VTQzVWlFeDAvOVFiVDE4dU5EMjdx?=
 =?utf-8?B?ZVFYV2EzcnVzaTB0Z0VlUnVCM2FvMlJhMjlPQ0hkMm5mTW50S0ZnM2lvbVda?=
 =?utf-8?B?Zm0yaXJrak5aNlNRYnZWOHkvMnBFYnpuSUVra1hxL0IwVWl2ZW1lUjVNcS9C?=
 =?utf-8?B?R0JJTnlsTDRTZDZtNHloVHdoM2dydWQyYm4rS2RReVVRdUZvSlpzVUh1QlRM?=
 =?utf-8?B?ZDV4bDR4djR2RzhrbWpHcFI2SXRPOTdoZ0NpbWVqQjlxS0o2UXZhL2xpc3Fu?=
 =?utf-8?B?Y3RBVGgzMnRiQkRYOXpxZFBZUHd4Z1drTGRXQW53b2d4c2lVaHZnd3g1bGNL?=
 =?utf-8?B?cDN0OU9GTEs4SCtLQkozY3hjMTVTcUV3NHNhWk00TjM2VDgwZEMxMlJQNUxD?=
 =?utf-8?B?VW5Hb3Via09UWm5CZXR1L3NjWXF3bjVmRTRJb0xGUjNZVHhzd3o0UlJmRHNo?=
 =?utf-8?B?WWJSSElmTGlpS09sVk1yVjFGUElZZXZ0c2pqcmlBaW9lbUNFTU9hMlBONnE5?=
 =?utf-8?B?ZGljUklpT2NjclhtbzdUdFFhemVyUW1ZUWhaNnRNS3ZHckxscVdBazNpbEZX?=
 =?utf-8?B?MzVoR0V1TkF5V2F4QXhiTEJXM09FdDRLVGJRMk5jUDJuRkhvN2NZaUxWV2Q4?=
 =?utf-8?B?TDUwVGJQUzlnWkNlRTQzbHQ5OHVPbEEvU3g5dThXM09NMzh0bHNSN2hJMHJM?=
 =?utf-8?B?REFvT1JZMmpoV2FvbDdsaXJudVFRWmpzL3FTV2hSSkJCcFF4dFBTL3FuVDB4?=
 =?utf-8?Q?4BPzSb8tjH0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjYzanlMNmk5cUgwUjVjcUQrUW8yaFFTT3RWKzFhVGc4N2diaGcxM0tYUjZ3?=
 =?utf-8?B?RndZczJmUnE0RjR0R2FPTUpjYm1ZRktnUzRUeURjOGxhenNPU1h5bnNWMVZh?=
 =?utf-8?B?Ky91VmdQTldhQUdveXF1cEVaa2ZIK0x4YzROeDRVVUxYR2RvNkV1RDBMREtE?=
 =?utf-8?B?bXptY0N2cFlEbmUwaUFleVNjK05MZWFERHFkaXRvUThCQUVzaUNXVWUrcXhi?=
 =?utf-8?B?azNlZFo2UUJZbUxqWlpaOWozMkk3RndPSWc1ak5MNnlIZWV6SXAwQ09MSUhz?=
 =?utf-8?B?clM5b2VxeXl5NjZqQXZZUE1kQUdpczV5eDJ0YkJDeFlRTm1IdFkxQ2dTa01p?=
 =?utf-8?B?RlFuTUovMEtZK1p2a0RFa2tGSXlndk8waFJNekREQytNVkJoODR3L0xWMjky?=
 =?utf-8?B?S2ZEQ09hTHlxMUtzbGQ4SnRqRTFYbG0vNTNrOExNVmI2aXNKblEvWkdadTdh?=
 =?utf-8?B?K0Q1NlJoQU9wcmZJbVJXV3VnV2FhOXZjS0V1dnFwUXJ3ajlrbWxqN0xETWsv?=
 =?utf-8?B?Qy8vdkI5Njh4ZEtpbXBkL2RaYU9qUjdrY1l4YWViMS9sS2FGZjBaZmtJRE9L?=
 =?utf-8?B?aGNlQTMzVWZUK3Y2aXBFK3Z1bFQ5ZWtnN1c3NnE3RlpEekxLb2RnbTRaL1BP?=
 =?utf-8?B?VGNkWHdTeXlOWWZ0Sk1rQzNZWWcvSEc5MzZCbXUya3M2T1RXRm5ER2hOcUdC?=
 =?utf-8?B?T1AvdkgwL1ljLzgydm5KdjNBUGNGSThoM2hMaXdBeDYrbCt5TW1LRm9sSjk2?=
 =?utf-8?B?VG1TM05oRGlxelh0TjJTQXpuTWJWSit6UDJEV0tYR0ZyYXBJYUdhcVhENGsv?=
 =?utf-8?B?SHVRNjJvNXBFZlhzb0pMZEhvNXkwSFgxMDdVSHAvRElLT1ZNcStYT3JvZkNt?=
 =?utf-8?B?RTA2VUhJcFFDb1BsdTZ5ZFFtQzIwMThRYlNxbnRUQXVuLzdkVjc3ckcreHVw?=
 =?utf-8?B?VnpWaDJBdmhiS3EwU3Q2RlFYQ2QrdTB4cmFVbG1Gd3JVRFVQV2xUc3psUi8y?=
 =?utf-8?B?TmlRd3ZZSzFwYXo3b2JTaHpoWDR5azZKc2E3Y0lnQkU0MEprL2E0ZG0xa01U?=
 =?utf-8?B?TUJQV3lIUjFuY0wwWlhVQ0gyN0QwMkxnRjR3cjhUYVVrWC92aVN6RlBQMWNr?=
 =?utf-8?B?aFp0Sm9POGV6UXZpNy8yMlZtS1Jmb3ludlBOSXRPUkNVRVVJLzYrd0JDUnJG?=
 =?utf-8?B?a0w0NXBlWElueVJ2ZDFibWh3YWhrN0E5UW5oSnlFUXJBcm1RV1lzZnJFeFhw?=
 =?utf-8?B?L1pucnZtcGU3SStHNkFEYjlmK3ZDVTlKNTc3MitCem5nNHMwWHdYZzlTM1hx?=
 =?utf-8?B?aktsN2dQaitGajlPMWJCbWkxSDFHRVRLWEtKY0JYL0draFd0cUFITElabVh0?=
 =?utf-8?B?QmxMZWZIZ1RQYUUzQ0t1Z3FoYkE3dXZubm9YMXRWSDhJNjBIN01aSjJiRk1o?=
 =?utf-8?B?RjlKR0dPa2Q1VGhkOFI3N3YyQithMm5pWWVWeXFGWVdScHE0TG9pSXRYK3l2?=
 =?utf-8?B?UUpwdWE2NUdXWkNSS3ZXQ3RmT3UwUVArRm5RaDIvUDZCWXVWZkNyWklsWkZp?=
 =?utf-8?B?YTVkZUtUL3BxNXdQN0JhRHZFMXE3RWg0RmtIK1M2RHd5QVhyWkNhSVV1L2tE?=
 =?utf-8?B?UHRyVUh3aXhjUy9qcFpCbUJFQXVJVFdMY241eXVyaTR0ck1rZHpTN1FORjNX?=
 =?utf-8?B?NUNYR0pXL2h3anNKS1JaREVLZlBGY1NHdGVxeFlYSnY3UkQ4MFNTWmU1YWJa?=
 =?utf-8?B?Q2VHVzhhQ2FsNGV2aG5hM1p6L3RubzJzaXV5N1AyV3dBQy9zM3p6Q0lobndF?=
 =?utf-8?B?dEdrVTlMT05vdG9DeGY5Znd0akpodkNOYkFvWVNZcWZZRFFwM2k3bmdJbmRQ?=
 =?utf-8?B?ZUorZG5MN2tHUWhtd2RrQmF5alV0NGt6QVcrSlZ2STJJakttSkttZ3E1TEYx?=
 =?utf-8?B?b3VUajFFSzNmUy94ZE41d0lUOVZBYnNhUStHZFRxSkZraWswRi9sRmRCSVpQ?=
 =?utf-8?B?RjBmR0Y1QjNOSXFsUEZkcm5OaEp0Ym8va2tBUTkzRnJ5dGdEYW9Fa1N2bXZ0?=
 =?utf-8?B?N204QkFjRVNDeGtNWUdLcmRSbTNNRHVjVTYvbGxjQS83aWpIdTFZQlpkTldU?=
 =?utf-8?Q?959M0bplvgwk8YP5w5EtZpQWn?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e3dc2a-1239-47a1-4546-08dca6cc2cad
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 01:51:43.4375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GkIeZ2xh0SBptEBFZUO8aNsiEImc61nSOESAtFf+PkRba3loPYr208WsZYNRkrGkoiA4EXTSyBqSgQHhSL64w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6271
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


在 2024/7/18 1:03, Christoph Hellwig 写道:
> [Some people who received this message don't often get email from hch@infradead.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Wed, Jul 17, 2024 at 05:15:07PM +0200, Daniel Vetter wrote:
>> I'm talking about memfd, not dma-buf here. I think copy_file_range to
>> dma-buf is as architecturally unsound as allowing O_DIRECT on the dma-buf
>> mmap.
> copy_file_range only work inside the same file system anyway, so
> it is completely irrelevant here.

Yes, actually, if dma-buf want's to copy_file_range from a file, it need 
change something in vfs_copy_file_range:

1. in generic_file_rw_checks, dma-buf file is not a normal file, but 
inode_out check it.  need bypass

2. file in and out need in the same file system which you point it. So, 
need bypass it

3. if dma-buf above 2G, need bypass generic_write_check_limits's file 
O_LARGEFILE check, it only allow copy range below 2G.

I feel that the above limitations indicate that copy_file_range is not 
really suitable for copying between different file systems or 
unconventional file types.(both shmemfs and other's)

Perhaps enabling dma-buf to support copy_file_range is not a good idea? :)

>
> What should work just fine is using sendfile (or splice if you like it
> complicated) to write TO the dma buf.  That just iterates over the page
OK, I'll research it also.
> cache on the source file and calls ->write_iter from the page cache
> pages.  Of course that requires that you actually implement
> ->write_iter, but given that dmabufs support mmaping there I can't
> see why you should not be able to write to it.
>
> Reading FROM the dma buf in that fashion should also work if you provide
> a ->read_iter wire up ->splice_read to copy_splice_read so that it
> doesn't require any page cache.
>
