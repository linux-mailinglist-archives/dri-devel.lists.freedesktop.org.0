Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F6B93380D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 09:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1708610E9CC;
	Wed, 17 Jul 2024 07:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="cx+fsHvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2076.outbound.protection.outlook.com [40.107.255.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5358C10E9CC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 07:33:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISJa1jILgnSy7A/1QbejVFOvS84e9wk5kVl6D3p1zVVM8uMeLGV+uLekoyEuJVJNMAXlDKOBmlsW42fLzNBRsFTdqXaKlcIIPzdQcCDEAL1rooHyvDzUABAyHcXnWlfBqK7VT6F9hV7uMXkwQ+IhDidyymBIhoZy/dPNV3VIawDgfct/rhNqhymn/mbnKUwSHdOtiU+5okt7l6OnZNosngOPw0T3+eQnhIZS0XlV7yfFrKjrL3K/ZGSqmUdNDhhCPJz7oZKLiPRwDBe0fjljc6HAAHOfaEUOpaJNhvJ/tWWlJk7OweLGfWBi1e18IwN7inErwm3lgvcrJ6jwk/+aIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVZaO/zXU0M5G1ZsscO7yiTVqPblpNtozfbeQar23l8=;
 b=LX9uy+stdnvbuIGp0OM/UdBCqayiInaS+sha4+AUY8zRKlmM89Gi4EJTXbnCeOzFUwyoDvifkMjwvxWM17j8APamOnRAadgXInYv5XPtlyUWnllSvbB2BAvfqS3b0BmewGT8QtUHT9OD0727sP+3WkYLcPfiRVsmuOrvkCmlBcRX9q+PS8d7dJl0UWE2epKzwNn3GGOLY15hEBxBo/jhpkidAG0VwPvxyRmW8Fgrn1UHYM2FqDEsqjc1isyYYS1gK0uc/QBUIviH/WHy69yJ7ptZ6de/QcLQfkTTsGFH57DpMWHtC/PLoJvUK1YD3X4HK3UFV9cIyqS2DB7/dpKt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVZaO/zXU0M5G1ZsscO7yiTVqPblpNtozfbeQar23l8=;
 b=cx+fsHvyYB05FEsy2sLv4GKMr7oPwlfr2Nkv0jthRQyVOAi00QjPpKn7naVWOVwH62wmIpDJ+l2ZUBAOPoGT/nwK97yFHsneSiSBqc+U7JP5nsvBC3XqY2RFQjhja24YHbkRwQqNQmq3cKytWehOozI62yZ/1xTvvR77/pi7Vv3q+U/9O6p9coKvjTvIyoop9cI5Zb9pDUfTpkh3uJiI3IctxbTPgKPWRqTDft3oH0RFR/O8gZAN0hedG6Q2yRK3ZqNquTYfMU8glPiHSB1fPrQLVbWx221OW7q4uIAsu2ZUmEcgO8wYLGrPeeggh3wI19acNKyvPMjtKHM/bjpjOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB5136.apcprd06.prod.outlook.com (2603:1096:101:5c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 07:33:24 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 07:33:24 +0000
Message-ID: <6506d116-b6b7-406f-a472-4a4fd7eea6b7@vivo.com>
Date: Wed, 17 Jul 2024 15:33:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
 <d3ad46ea-df7f-4402-b48a-349e957f198b@amd.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <d3ad46ea-df7f-4402-b48a-349e957f198b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB5136:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d2aa08c-39a8-45e4-cc95-08dca632bdbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzB1UlpxRmVQUzBqQXRrYWJ5eHhRYUlZNHgrNC9PRWxjeVV0UXo4QnBXU0Yx?=
 =?utf-8?B?RkRKdXBBdmlESkxndng3TWpNS3JscmxyUDN5YTF2UzdpeExmQmtmWHozZGhP?=
 =?utf-8?B?RWlIYW9JenluSGRLQkloTTE4THd2eWJtYzFHc09kL1paa2ZMa1NQaUlwZG1Z?=
 =?utf-8?B?RGdmS3Azc3JJZEJOYSsvTTYwc3BOdmhlMGhUNUFyQU1BcExPQVJCQmJIWW1i?=
 =?utf-8?B?ZXRTdDRWNnEzY0xDN2lGeStnTkhzSThtbG1tbFhzUStIOCtvTG1jMDUrVmg1?=
 =?utf-8?B?S0RqejNrWVk3UGEvVXkyMWFkSk1vUzh4Uk1kZW9TcThJTjQ4RjV6YU9VRHF1?=
 =?utf-8?B?bmgxYTJjMDRmelE3YzVoY1F5TXJBWVg3dWJXRnFSNEQvZlczQzMzanpwQzZL?=
 =?utf-8?B?Snoxa3FGdXhjKzZRczRNMmczeVU1THQ0YzNoeUlsZVlscVU5L0F1Q1NzamZn?=
 =?utf-8?B?cCthaG5BQVhGT21FbGN5YTl4U0Z4bzBITy9tbGt2RjRHVEFRdmFiNWJnbTF6?=
 =?utf-8?B?UlJGNWRWYUtjUEVtUUNraytFVUpsVGdmVG5wL1k3MkdlaVZKcnArL2pKd0tN?=
 =?utf-8?B?clY5djlkNFhKNW5zeDdFRzd0cTIwSVBtVnl0OVNJN0oxQ3hMNFNKNWMvY2RH?=
 =?utf-8?B?bDBiajJvRmZaZDlHOXNCM2x2ZGx1TUNsR2hhV2o1NWlRN1pvWmVHdFoyYUcy?=
 =?utf-8?B?MWZ4L1RCUUlONWs3QmcyM0RKOXo3YmZPeHhJcGVncjROcS9NMjg5VDc0Snlr?=
 =?utf-8?B?aHN1c1B0Tjc2VWU1WnorMkpvYTFFM3ZWWk1wS1k0emtUUWhoRUkyQjJBdVh4?=
 =?utf-8?B?Sm1xckVVV1lpcUMyNlJUWHg1M1hZVzA4S3hhZVZHVlZOYnlNZndaMFdjTDJh?=
 =?utf-8?B?NjlFVURuSStYMEVxUjNUTzhsQ0k2RlJ3VWw1RUxSQlE5MXRpcG5nRTdpQ1Rj?=
 =?utf-8?B?ZWwrb1p1ZVV6LzhUOEk1VlVLNXlCYzUwTFZ5cERBRnBFd3haeURXQjlwbUVY?=
 =?utf-8?B?Snd0Y0JUNmxPSUFnRHMwSkp2cEhsWnNWOTRvMGZ4VktVRzVYa3FCOFpMMm9v?=
 =?utf-8?B?Z081ZmNXTlBjNkthcXNVeDRYTGMvc3ArMW53d2JJdU5lbmcrQXRnVjEvejhB?=
 =?utf-8?B?UVRmYlNxK2F3a0FwMjZra1I5d0xvV0FCNWdVZ3l0MXFZL1pFNW1haktYN3NZ?=
 =?utf-8?B?Y2ZaL3F0NFFWS3RlY0R4Z0xQZjVrNHZ4VitCVG00emhERVNHbWVvNndrTU5K?=
 =?utf-8?B?Mzl5QXVPeWt5bGhmZktmTTZzZ1ptUkxnTjU5ZWVheFcrVk0rcEpQbUNFbDNa?=
 =?utf-8?B?UEltd1MyOFFLUmVLemUxRFV3d24weCtQVlYzTGpoSmpaaTNWbktTMUtmZkdh?=
 =?utf-8?B?QytEUlpDV0ZnNm9HV29sL0h5L0t0N3NmM3BYeFlvYWN6SEdwN0s3WTVTNU1m?=
 =?utf-8?B?d0xrc2ZwMk5UQ3Zqa2VCYVNmQWJQK3dMeXVNdTRlTWN5cTRTSFhvU1NOb2FZ?=
 =?utf-8?B?WFlNMkhsemVBRGc1OXdPOWpqbzU1SGxzMGo0TXJZcGlFbC9CZ29CTGN5Q0Rz?=
 =?utf-8?B?empzNXRWRnoyQ2l0VTFES1hvd0FQKzJlYW9YZmdaT0FqYm11aEhWQm9OdFNJ?=
 =?utf-8?B?cUZHK0dtUWc1cnNSaDNaTENnVVRlcGJGUTZtT0N2OTBibGtyMGRCUHhJUnQ1?=
 =?utf-8?B?VXNtSVZLNHdVcVY4MkVsdWxOS1dNU2tUeXVUZnZFS2x2M1BwSXBwcTg3QTBP?=
 =?utf-8?B?UmVWLzRpZG54ZVRzQWw2QWUwSTM2d3lEK3M5cmlkNFdkelhnejE4RFkwM2NY?=
 =?utf-8?B?NkRwazlhSmVJZWRtUXZDS2IvbUNWMWZuTVZEZGNjOXREUFJvc1pDTVZuWllQ?=
 =?utf-8?Q?ap7Ck4zj0GO2j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXBiOE5EMEN6YzJnM3lMN0ppRU1RU3U2MUFZQ3d2TFdpNktYZEo2RXU0YVN2?=
 =?utf-8?B?K0pDTkwwcU1LcFdwbHU3emxoeDFIRmd1OGR6aEtwY05pUFlORVhnaG1TZHFQ?=
 =?utf-8?B?OWwxS3FSVFR2ZExsVG44b3dJZ3llS0lydE9CWG5lVkpmcS9KZDFPNXNUejZh?=
 =?utf-8?B?TnpzK0tLMnRlelU0c2Z5bmNkaE9Sam93cFhqWVJDVjdqdTBWRU5qcjVnRlBL?=
 =?utf-8?B?ODJVYWpGTXFZdHlYSU5WekV4bkZnb3htZ3hVblpiZEhidU83NW11T0wveUV0?=
 =?utf-8?B?QnhENFFhTzUxc0syTmVQYmhxQVRydzV5dHFRZmQ4RHcrQkJONExGZTJoaldQ?=
 =?utf-8?B?VngzNWUrTDRhS2lvR0hjQmlqWUx0SEwzeEJtcWh2REtGbkhqaVpjWVpXRXdk?=
 =?utf-8?B?clE4aFcyTHhmSFNTN3UzRVhPR1REOHR5RDA2NmZzREpNdGM4Rjl1a3N2cmRF?=
 =?utf-8?B?VTM3RkFQRGRHUDJla3JyRENiZkVhUWtZQ1dMcE5SOCsxYlBZaWJvWDNPWmtl?=
 =?utf-8?B?M05GY1pEWWJqNTRlU3RmQ2JydjdIQVFEWlM1WEtPR0pIY1RpUTFYL0I3ZTZq?=
 =?utf-8?B?eTh6ZmgxNkVaSnB3WVBTZVZsTCt0b2dXdjVOdHNHa2J3R2toSE15RmwrQnpN?=
 =?utf-8?B?eFhlVW5wdnJYMjBhZjVOM0o0ZmZyaWs5ZCtWZzkvaUlrZ0YvaHJGTGxYcXFs?=
 =?utf-8?B?RmYvSndvUVkwb1dOZXhqV2xjaWxPU1J2bjdXKzdUeU51REs5V2lYV2grMkFK?=
 =?utf-8?B?SWxPWlZhc3hvSmZ0QUZQUHFvdUptSllqVzV3aENYOUcwY2ZkR3JVRkpQcjFK?=
 =?utf-8?B?REQ1NHRjK0dpZ1pKVUk0UHZoKytRQk5LWmprcEdyUlRabmM0ZlAxZytUNXFJ?=
 =?utf-8?B?MHFxU1prSS9aL0JXUjl3ZkNqc2FPdDJUTDhmcVVvMDRvK1pCS09pRzg5Zmpl?=
 =?utf-8?B?VURMbklQZ00vVjhad1h2eVNwaTBDOUtzcC9oNHVHUVVXbjlaNktlOWYvMmph?=
 =?utf-8?B?K21FeFpUeWhqbVkvczN1TUVhRld5Z0JTK3FjU0dhR2FFaURJS2xmSXkzSTNj?=
 =?utf-8?B?QkVOMiswS0l2L2Urc3lJWm9Da0MrbE9qYWhHMTM1eHNQQ3FTYmR3cU1HR0ly?=
 =?utf-8?B?TkM4WUJtOXdkNk5MREMxWFpud29BeldKQmllQlR0NzFaem5rSnBnb2lyUVo5?=
 =?utf-8?B?Q0xvd0ZUaVFPSWVDb2wyK2tXeTBjWXhkdmRkQmxURU5YUVZIQmNrQzA1NXFh?=
 =?utf-8?B?ak1EcEh5WlEwYlFZOE5LeTYrOW1ITWNTcW16OXoxWXVpblhlR25zRVVnSjRG?=
 =?utf-8?B?UzhsazAwdXVjK29Dc2pwZVZzNDd2a1crRGNxbW4yNGx2NkZaQ0o4VkM3TWNR?=
 =?utf-8?B?b2tIamFqZXZ0RDlCSXZaVWVFYlllOHE3OEd3dHZUY1dFb285QWxGbGswRXpm?=
 =?utf-8?B?bmJuU05rTjltdy9FakRKa2NDWmQvMkptYUh3VXBJRHkweVUydys5czBFQ2Rm?=
 =?utf-8?B?elFTeHB0ZTFzOU5vN1Z3WW04ZThQZ3NBdEJQclBmWndUV0wvYTZkKzBKV0pL?=
 =?utf-8?B?aVBPT3pzNUlVOE1Ba3ZWNldxTEg0elkzdzBzVi8vL0lQb0dyTEFjMUJCU2FE?=
 =?utf-8?B?RGhtQmRyYmtxdXR2dEJ5a2ovSHRtaFplU2Vad2NSSCtUWnVGNHdaelBqT1V2?=
 =?utf-8?B?MFppSHRTWUJaNEpQcFdzS3dLNFNrNWNRcmZ0REZrc2pOam5yUllicjluYWVE?=
 =?utf-8?B?VkoxeWU5VnRwd3JZWWVoeDV0V1RUSVFlRS82UWZUUURuQ05PWVoxVTdjQk5t?=
 =?utf-8?B?Rld5a0FHVVhmQTJtSjRacWFBZ29CODE4WEh0ZXJxcS8wZ1pXT1lib0RocElV?=
 =?utf-8?B?a3ZLamp6TXZuREgyQmtjZjFVU0V1OXVJZ3ExNFJUZisrdHZjcjIxVDJtNFFB?=
 =?utf-8?B?M085RlRERE5vVGM3ZE9HcjIzckVjdDY3MWFwb2FBY2M1K0tvd2xiSFk5azBh?=
 =?utf-8?B?SG5YYlNtekJkbS9McjdMa3hUZ2Myc1N3cWdQbG9ORzc5Vm9NNTMxdlFJQUFT?=
 =?utf-8?B?aE5OdDhycWtscElzU1hzWmhXb1l5SERpTFAwUXJlb1RsT3RZK25MS01HZ0Z6?=
 =?utf-8?Q?vLK60RNkpaO1hSRvZeN9nY9yj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2aa08c-39a8-45e4-cc95-08dca632bdbc
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 07:33:24.3457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2PUZSjODEuiMU3hCn9GcaJunwASCKFr5D93HyK+amudzxPJZYuN/DtiJ7OIGsBuwNxOCArojWcaojajLUkyHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5136
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


在 2024/7/16 20:07, Christian König 写道:
> Am 16.07.24 um 11:31 schrieb Daniel Vetter:
>> On Tue, Jul 16, 2024 at 10:48:40AM +0800, Huan Yang wrote:
>>> I just research the udmabuf, Please correct me if I'm wrong.
>>>
>>> 在 2024/7/15 20:32, Christian König 写道:
>>>> Am 15.07.24 um 11:11 schrieb Daniel Vetter:
>>>>> On Thu, Jul 11, 2024 at 11:00:02AM +0200, Christian König wrote:
>>>>>> Am 11.07.24 um 09:42 schrieb Huan Yang:
>>>>>>> Some user may need load file into dma-buf, current
>>>>>>> way is:
>>>>>>>      1. allocate a dma-buf, get dma-buf fd
>>>>>>>      2. mmap dma-buf fd into vaddr
>>>>>>>      3. read(file_fd, vaddr, fsz)
>>>>>>> This is too heavy if fsz reached to GB.
>>>>>> You need to describe a bit more why that is to heavy. I can only
>>>>>> assume you
>>>>>> need to save memory bandwidth and avoid the extra copy with the CPU.
>>>>>>
>>>>>>> This patch implement a feature called DMA_HEAP_IOCTL_ALLOC_READ_FILE.
>>>>>>> User need to offer a file_fd which you want to load into
>>>>>>> dma-buf, then,
>>>>>>> it promise if you got a dma-buf fd, it will contains the file content.
>>>>>> Interesting idea, that has at least more potential than trying
>>>>>> to enable
>>>>>> direct I/O on mmap()ed DMA-bufs.
>>>>>>
>>>>>> The approach with the new IOCTL might not work because it is a very
>>>>>> specialized use case.
>>>>>>
>>>>>> But IIRC there was a copy_file_range callback in the file_operations
>>>>>> structure you could use for that. I'm just not sure when and how
>>>>>> that's used
>>>>>> with the copy_file_range() system call.
>>>>> I'm not sure any of those help, because internally they're all still
>>>>> based
>>>>> on struct page (or maybe in the future on folios). And that's the thing
>>>>> dma-buf can't give you, at least without peaking behind the curtain.
>>>>>
>>>>> I think an entirely different option would be malloc+udmabuf. That
>>>>> essentially handles the impendence-mismatch between direct I/O and
>>>>> dma-buf
>>>>> on the dma-buf side. The downside is that it'll make the permanently
>>>>> pinned memory accounting and tracking issues even more apparent, but I
>>>>> guess eventually we do need to sort that one out.
>>>> Oh, very good idea!
>>>> Just one minor correction: it's not malloc+udmabuf, but rather
>>>> create_memfd()+udmabuf.
>> Hm right, it's create_memfd() + mmap(memfd) + udmabuf
>>
>>>> And you need to complete your direct I/O before creating the udmabuf
>>>> since that reference will prevent direct I/O from working.
>>> udmabuf will pin all pages, so, if returned fd, can't trigger direct I/O
>>> (same as dmabuf). So, must complete read before pin it.
>> Why does pinning prevent direct I/O? I haven't tested, but I'd expect the
>> rdma folks would be really annoyed if that's the case ...

I used to believe that a pinned page cannot be re-pinned, so performing 
direct I/O on it would fail.  But I misunderstood, and it doesn't have 
any impact.

dma-buf mmap vaddr can't to trigger direct I/O due to can't pin kernel 
page(PFN), So, not same.


>
> Pinning (or rather taking another page reference) prevents writes from 
> using direct I/O because writes try to find all references and make 
> them read only so that nobody modifies the content while the write is 
> done.
>
> As far as I know the same approach is used for NUMA migration and 
> replacing small pages with big ones in THP. But for the read case here 
> it should still work.

Hmm, with udmabuf direct I/O test, I find this will not effect it. Test 
code  I set in email tail. Maybe pin only let page can't be reclaimed, 
rather prevent the write?



With mine test, udmabuf direct I/O read 3GB file, average cost 2.2s.(I 
use ftrace to trace f2fs_direct_IO can make sure direct IO trigger 
success),  Same as mine normal cache file read cost

My patchset average is 1.2s，The difference between the two was obvious 
before.

>
>>> But current way is use `memfd_pin_folios` to boost alloc and pin, so maybe
>>> need suit it.
>>>
>>>
>>> I currently doubt that the udmabuf solution is suitable for our
>>> gigabyte-level read operations.
>>>
>>> 1. The current mmap operation uses faulting, so frequent page faults will be
>>> triggered during reads, resulting in a lot of context switching overhead.
>>>
>>> 2. current udmabuf size limit is 64MB, even can change, maybe not good to
>>> use in large size?
>> Yeah that's just a figleaf so we don't have to bother about the accounting
>> issue.
>>
>>> 3. The migration and adaptation of the driver is also a challenge, and
>>> currently, we are unable to control it.
>> Why does a udmabuf fd not work instead of any other dmabuf fd? That
>> shouldn't matter for the consuming driver ...
>>
>>> Perhaps implementing `copy_file_range` would be more suitable for us.
>> See my other mail, fundamentally these all rely on struct page being
>> present, and dma-buf doesn't give you that. Which means you need to go
>> below the dma-buf abstraction. And udmabuf is pretty much the thing for
>> that, because it wraps normal struct page memory into a dmabuf.
>>
>> And copy_file_range on the underlying memfd might already work, I haven't
>> checked though.
>
> Yeah completely agree.
>
> Regards,
> Christian.
>
>> Cheers, Sima
>
Test code, if test above 2GB, need this patch:

https://lore.kernel.org/all/20240717065444.369876-1-link@vivo.com/

```c

// SPDX-License-Identifier: GPL-2.0
#define _GNU_SOURCE
#define __EXPORTED_HEADERS__

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <dirent.h>
#include <malloc.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <sys/syscall.h>
#include <sys/mman.h>
#include <time.h>
#include <linux/memfd.h>
#include <linux/udmabuf.h>

#define TEST_PREFIX    "drivers/dma-buf/udmabuf"

// static int memfd_create(const char *name, unsigned int flags)
// {
//     return syscall(__NR_memfd_create, name, flags);
// }

int main(void)
{
     struct udmabuf_create create;
     int devfd, memfd, buf, ret;
     unsigned long size;
         int filefd;
         struct timespec ts_start, ts_end;
     long long start, end;

         clock_gettime(CLOCK_MONOTONIC, &ts_start);

     devfd = open("/dev/udmabuf", O_RDWR);
     if (devfd < 0) {
         printf("%s: [skip,no-udmabuf: Unable to access DMA buffer 
device file]\n",
                TEST_PREFIX);
         exit(77);
     }

     memfd = memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
     if (memfd < 0) {
         printf("%s: [skip,no-memfd]\n", TEST_PREFIX);
         exit(77);
     }

     ret = fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK);
     if (ret < 0) {
         printf("%s: [skip,fcntl-add-seals]\n", TEST_PREFIX);
         exit(77);
     }

         filefd = open("/data/model.txt", O_RDONLY | O_DIRECT);
         if (filefd < 0) {
                 printf("%s: [failed to open model.txt]\n", TEST_PREFIX);
                 exit(77);
         }

         struct stat ftat;
         fstat(filefd, &ftat);
         size = (ftat.st_size + getpagesize()) & ~(getpagesize());

     ret = ftruncate(memfd, size);
     if (ret == -1) {
         printf("%s: [FAIL,memfd-truncate]\n", TEST_PREFIX);
         exit(1);
     }

     memset(&create, 0, sizeof(create));

     /* should work */
     create.memfd  = memfd;
     create.offset = 0;
     create.size   = size;
     buf = ioctl(devfd, UDMABUF_CREATE, &create);
     if (buf < 0) {
         printf("%s: [FAIL,test-4]\n", TEST_PREFIX);
         exit(1);
     }

     // fprintf(stderr, "%s: ok\n", TEST_PREFIX);

         void *vaddr = mmap(NULL, size, PROT_WRITE | PROT_READ,
                          MAP_SHARED, memfd, 0);
         if (!vaddr) {
                 printf("%s: [FAIL, mmap]\n", TEST_PREFIX);
                 exit(77);
         }

         unsigned long rsize = size;
         unsigned long bytes = 0;
         while (bytes != size) {
                 ssize_t rb = read(filefd, vaddr, rsize);
                 if (rb < 0) {
                         printf("%s: [FAIL, read]\n", TEST_PREFIX);
                         exit(77);
                 }
                 rsize -= rb;
                 bytes += rb;

         }
         munmap(vaddr, size);
         clock_gettime(CLOCK_MONOTONIC, &ts_end);

#define NSEC_PER_SEC 1000000000LL
         start = ts_start.tv_sec * NSEC_PER_SEC + ts_start.tv_nsec;
         end = ts_end.tv_sec * NSEC_PER_SEC + ts_end.tv_nsec;

         printf("total cost %lld ns\n", end - start);

         printf("going to check content\n");
         void *fvaddr = mmap(NULL, size, PROT_READ, MAP_SHARED, filefd, 0);
         if (!fvaddr) {
                 printf("%s: [FAIL, mmap file]\n", TEST_PREFIX);
                 exit(77);
         }
         vaddr = mmap(NULL, size, PROT_READ, MAP_SHARED, buf, 0);
         if (!vaddr) {
                 printf("%s: [FAIL, mmap dmabuf]\n", TEST_PREFIX);
                 exit(77);
         }

         if (memcmp(fvaddr, vaddr, size) != 0) {
                 printf("%s: [FAIL, content is not same]\n", TEST_PREFIX);
                 exit(77);
         }

         printf("%s: [SUCCESS, content is same]\n", TEST_PREFIX);
         munmap(vaddr, size);
         munmap(fvaddr, size);
         close(filefd);
     close(buf);
     close(memfd);
     close(devfd);
     return 0;
}

```

