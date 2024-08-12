Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B9F94E533
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9646C10E07A;
	Mon, 12 Aug 2024 02:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="HsAXe/Ax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2053.outbound.protection.outlook.com [40.107.255.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFC910E074
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:49:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlEvsVUvU0FrS0BHWJva6jLv1zNP/5aKrtRbLZvsNsUAsdFzTRYArK4CB26cXJFkPeUuBVuDPMa29VnmdK+FOt78VkyXkp26CLFCt43pPkfEnzejE4l8hCpYTURbu20Rci0JBerN5Co0+0GZtjB5xnh0CJHOGZZ1t++3AX1MQkWo4XAUzvJugCsRdE5OczsMwzyUU693Zz3ROIRwlS9s7RDbzwbMl/z+HRN1RrCvhg0wKdtdieFpkfcwEGxiu+PKq7iryFJa7xF9sFGfTl/c5lTiUxaZ063FElc7WxDxpJjRci8qwqNe5oJ5O01Q6E2/ybJQorSqmr1YOkuIGn9HhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkA9ZMhJX7B5kIy8GK6ReUi9hqvPWy1G+Wddl7tgVhE=;
 b=e6LGTFAN3eb2MpQVuA5ohMpX6GdsGhjhbynWR9hdu4kGizsYo4OEGLjfFNCzL9lxZrYIiCUkpFCm4dABYD9u8gsBJyKdLooQA8t+w4mh1AnIFpgwlyBCe6hY2GWnB6TUAL+wrtVurUHCgK7yP9yzos9ANk8m8Ze0xYCrQ0N/kVSOM4AHNeM0xm4yAWja/KxXoy/f9mor3Hjo7lqCswBmEHnF5isDYBMX1Q++kmjOwzeo0l8HvssF4C4yuObGjTjAq2F7/1GiVIfhIy6690cS5G3PaOUG7C6/2A7+owOUmxfkBHtY9QgxpPKz/pVMC961QzborOZsrQhvU5GdCG3Ypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkA9ZMhJX7B5kIy8GK6ReUi9hqvPWy1G+Wddl7tgVhE=;
 b=HsAXe/Ax+otpPF1xwOIKd+QfQeVGXx+YZ423BbTvnOheD7M07R+45jfrVURY3BbIdzL0K6gVuZciZo4qLBpGN4oQ8rHPGd8ck6CZWdoT5YlyRCPSf09y3ShEssBftykmER6owK8Ge1AWrLQQG52ZOHBUN4S7rxigDGJpNScq/fICxwH93h1pfLvbVz60OYdeEXXEeHhMeLiMWCwTCs58hxG2Eub/MrHJMXa89KWayh34yuwoJY4hQSMUqUpx+j+r3oiFHpFwjJUsG2WMl/fgZqsNCey1SSn5U4nvsX9jjeT2B7ZTGPhHQr1hIEu8bAPilJ8hn3SSSU+t2LbKsK/mFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by KL1PR06MB6687.apcprd06.prod.outlook.com (2603:1096:820:fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 02:49:52 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 02:49:51 +0000
Message-ID: <6beb93ba-3e9b-44e8-badf-7258a7619d28@vivo.com>
Date: Mon, 12 Aug 2024 10:49:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] udmabuf: remove folio unpin list
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240805032550.3912454-1-link@vivo.com>
 <20240805032550.3912454-5-link@vivo.com>
 <IA0PR11MB7185115BF4B741E9229D0E68F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB7185115BF4B741E9229D0E68F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|KL1PR06MB6687:EE_
X-MS-Office365-Filtering-Correlation-Id: e62b852f-8a12-41af-f400-08dcba797045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGFvY1FXYmpKUkRJME9ZOWFyc0RMNWtyenpxQUZoM2tlRHllRmZnN1dXOW9Y?=
 =?utf-8?B?dkg1QlZwVW5idnExdUF0blF0c2xveU1sSFNNRU5hWHc3TzhyZnV1U0lmV3k5?=
 =?utf-8?B?TzRnR01CWHNxRHJzZ3V0ajRxN3ExSnU2UHdZY3F0SGdrNVp2endKNkJSM2da?=
 =?utf-8?B?TE1MTjJZYjNNdzU5VmtxbTkycmpycDZSNHZNMVRGSms0ZFcxa0w1VGpCS3V2?=
 =?utf-8?B?S21VT3ZMTm5WNnNZYTU1MnMvYmdoajFxMzBheUZZcU1FOE5aS3lYaWxKZ1li?=
 =?utf-8?B?dmZlSjZLSEtmUnNCNTUrTzNZaGVnQTE1RkYrWFBQdzJUZWdTaVRBTHFsNnVS?=
 =?utf-8?B?N1dDOVpjaXY5Rm1lWTBjckFVMDBCVjlCRXROSkFsdGdSYVEzSTQxeGV4em1O?=
 =?utf-8?B?aXlWZWpoclBPajFKOUNmd1Fkc3RiNnYrMll6QXlKYk9ZZ1V1em9ZN0dnWitW?=
 =?utf-8?B?YUhjMjdjN0pIOXJEa2R5SzBWajkyYm5FN0l1alFYVlk0eEFGK3RKL1RSSm5O?=
 =?utf-8?B?SUtVUkpzODQ5cklBYloyK1dOSVN4TVljVW50UHo1bXBpTnZWbVZmWUNBNWdP?=
 =?utf-8?B?cEZ3NTlYZGtIdlFuN1pVS0RhZEh5ZG5uN3kwTWhnUzJnY1FPWjZLWnZmamZq?=
 =?utf-8?B?V2ZQc3ZSMzNxQmtoVEZWaC9sZ3RMMENvNElHdCt3REg0eWVkUndFMG1haFFH?=
 =?utf-8?B?dUgxbkpwdjJIZVNwdzhTTE9VTVFvelZIUFpYMlcvUWVPKzdXc3NpNExsZmRx?=
 =?utf-8?B?bDM3a3pwMDc0YWI5NnByRFI5YUU4WGUrVjlpTlgwL2paeFdnM08vZ0R4NXBt?=
 =?utf-8?B?M3lVZjRiTnBmUXc1eEVuMzNEaUVrUVdRUi9yNkxuVlREbFRjSnZVVFZVUnhI?=
 =?utf-8?B?RXZvZkJhUVJPZ1ZVT1F1eW5iQVZQaERlcmFWWW5FVW1HZmZMaVlNTW5DbTFo?=
 =?utf-8?B?YVZyYWVoSy8yTHd0QUE1Qm1rUGtoVk1SZjkxYnFOTkM5WjRxSmkxanNWR3J6?=
 =?utf-8?B?TVBaN1pkck55RjB5Q01HVm1NR1FBQk5TSU50dVpKc0ZKcDVPNnJzRXgwVkV2?=
 =?utf-8?B?V1JEa1BmS1gycUNVbHFoVlU3MGlTQk9LdXd5UmZ5VXBCaFFVWE1JL2YyL21R?=
 =?utf-8?B?SmlPeWpJdTdKMVdGL3Z4SmZ3Z2NDV2N3SG05L1pqWTJMK1B3TE1Ob3cybjJk?=
 =?utf-8?B?UHZDVmFvQzhoeFZkZEZ6ZVV4L0M3Z0FVdmhCcFk2a1E4TForaFcxYVdMUjdE?=
 =?utf-8?B?ZTJHZEQ4SWlrdHZaejRRU0xQNW83VzBBdVE2UWVRR0VjaS8xZjdxY0VtcVlX?=
 =?utf-8?B?NE1vOUVvYTg4UGtSM05pNWk3WFRFU2Q0Z3ZIelpWQzdORTFTOUN1RjU3NFc3?=
 =?utf-8?B?NGpUTklyUk1qb1R1TS9xbVZFa24rbkJNQm56V0VjMmJpc2dBb2k2REExQjE0?=
 =?utf-8?B?YnU4ZVc2dGJ3dEFaWW9vaUZvQ0FaSHNMTHhibWZVR3BDQUVYVVc0Zm5PMTdQ?=
 =?utf-8?B?cmFLeE14aXIyOGZvdzFMejQvQnNTL2pNVUhxZ3k5bWsxL3Zuby9JbW5pTWJj?=
 =?utf-8?B?ZFgzb2V5b0FSY0RsUDF4NGJzcjFzdlU1aTJOVlFuVmJOMEYyOHZMaEhEUVdl?=
 =?utf-8?B?TTZCeWRGdG42NlpBdVdTZTI0TndqS1ArSGdXNDVRd1VOZUFUY2lFNm1PZWkz?=
 =?utf-8?B?UkJtTnY4Q0w4UzZHN0xsVlUybENrZDNKbTVzRG5GUUVCd3NaT2lNaU1nU3NZ?=
 =?utf-8?B?MGtHN2FoWHdsTVppbFEwcTlCUmFoNDUzbHplOTBpcGVKbDJvUmxkaHVYM1dJ?=
 =?utf-8?B?WFl1azJpTjRYbVVuNEZjUzlrM2J0TDdudm9zR21zbWY5Q2ZYUmZJOHgvZFY1?=
 =?utf-8?B?azVlc0tDUm1odkc5cFUySW9MejhSNDRkVXkvZ290enUzOVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2dnUjRnZ0pGYkZpcTVzbnV2aUlXVDcwYXJZWUxJRG1kYmZlREkrVGJURFVW?=
 =?utf-8?B?aUpEbW51d1dVa0l4cGgzNUhLdjBMZGVmQ0RPWURXbVBubEdIOXBuemdMUG9o?=
 =?utf-8?B?NjlxUUwxRXNqRkw5WFhUSENmbWdsODNiUGw2Mk5lWnRPZ25TMlo4N1BqbS9R?=
 =?utf-8?B?Mlo5ZiszVXh2QmdBa0NhM0ltMzg0MG5BL2xGR3ltWjRNSXg5UWpBczVqL2lx?=
 =?utf-8?B?STdCaGp0OXJDb0NpL2c1anQyeW1oNkdJMUJQNVpIS3VlZnRYWWVKSnVGK29F?=
 =?utf-8?B?UmkwelNRUUtRT3dUZUNYbC85Skxwelc2WnZkVk1sWGF0djNuZFRKTGpNN2tz?=
 =?utf-8?B?SFBUT2hidE1oMWF1QUN1bkpScGpGTDB1bmdLNk9FV1l2OGR1Q1V6c2FKQzJu?=
 =?utf-8?B?dmZ0a2JlSkcyMysvRjdyWjZkUEJnVXNUUmlFT2F0WHQ1NGtBS2F6REptTzR2?=
 =?utf-8?B?dWJTUmRLcTJJTG05V3V3S0pZdUIwb0YxVTk1UHBud2xiUTFJckkzcGFwb0Va?=
 =?utf-8?B?dXVmQXFKYzRBbkhVQ3gvOXlDZDk1WXIzY00xZXBlYkNVUnBoTjAzdUJ5enhX?=
 =?utf-8?B?MndOeWp6aEVWVy8rZFBDcUliK21GMDB3UXpmZEhOVXo2MEdFOUJGNDF4R3dz?=
 =?utf-8?B?MUQvbUQyc0IwenBIbUxDOGVMOXVDOGtpeGhUOWJaRzlabDRWTi9nTjZkV2M3?=
 =?utf-8?B?TUN5U2VpRW5rS0paV2k3N21CSE54ZkpXMVdtUDA5NGM5bGVJSnorVFRyaHEy?=
 =?utf-8?B?VFpXc3BVQStJVWRtblpWSkVuR3lhU3NpYjVZWEo5UUorUC9jMzJmV1JXSXZJ?=
 =?utf-8?B?RDk0aGUxTUR6Q1czc25sVStLOUZFdGI3OVNLdTMvbTFOb1BqMkhEUnUvRjdz?=
 =?utf-8?B?dnMvRmJHV1llN01nZzlnNFFUcWVVM29mcURrd0drc1RlUU9CS0txZlVPM0JY?=
 =?utf-8?B?SHYreVJJcW41NDYwejVDa0RCYzFCMVo1RzVheU9RUjd2VWIrSVRGSGk2MUNR?=
 =?utf-8?B?VGFoLzBPVTZTeEY2U0ZSNWhMLzFrV1pvdVhVMlNha0lIVG5ZS0IwNjlValdW?=
 =?utf-8?B?MHZVRzFFUko0aWdZL3F5cHZyM2hVVXZBNlc2Y3MwaEt0YjQ5TmdwTmpheXJh?=
 =?utf-8?B?SUlFb2htcHJvL3l2TFY3T21JTTVnMHhnWlBSNThTMUtyZklHVStrMlRHbWRw?=
 =?utf-8?B?YnN1VE1QZEdLODcyM0Q5RXp2TWpISUhORHdJMGFyS3g1OHJleksrdDgyZ2du?=
 =?utf-8?B?ZXFuMmpKWE1RNGwxZ2h4Q1BISnBGL0ZhcVJGRlhsak9VZndNdURRdEtqNk9Y?=
 =?utf-8?B?S2JXMExaY3ZIQnNwQ0x0eHczS0NJUFpZL0xrYXdpTnpEdGRaR000UFJsWUZq?=
 =?utf-8?B?ZVF2UWlpV0dwSjJHaHNCZ1lVeEhILzVPM0dpQng4dk5vRVJLK1VWSWhIbTJB?=
 =?utf-8?B?NXczVG9yZkpwRm9uSG9UNkV1SGdtSW0rU0VxY0pHU3daTkRoN1REdjNSamZX?=
 =?utf-8?B?UWUzM2RkUExORkVLckJORUQwMllZcmhZOWRIemphL0tZNm5PSzI3dDdzS2hr?=
 =?utf-8?B?Snh0SDNCNUlQZGNYaDVidEJWRzJ4MXF1eWs4dVM5VjVZRzZDLzJqMElJSEtr?=
 =?utf-8?B?cFF1SUN2R21iODR6YkNPcTFFVkVOVjRUaTllY0hTTEtzcm9HSjEzWWYxckY2?=
 =?utf-8?B?WFRDRyt0L0UyR3U4QSsxdFYxTVFRVm1kODVFUGphTTFtSks2OFpCR0RIQkdQ?=
 =?utf-8?B?akFYemNuVFVUNHdvTmRKLzJMaXZ5a3JlcVZqSm5QbkhkalhHSEMzaFdub1J1?=
 =?utf-8?B?b1pTaS9WY2lYQW5hbU5ZT2gwOFVTVVdqT3dDdmhUQ0xnbWdPV0I5aDlveGVy?=
 =?utf-8?B?SUo3L3NTOVgrSDNZT3FmWEp2c0RxQU02RVZZRXhXNlluWCs0ZDdrdGQySG5Z?=
 =?utf-8?B?ZVVzd0N5K2tORlFUUXZOQkE4ZXpySTZDV3YxRldVL0dkWjNDZmVHbHN5eGZx?=
 =?utf-8?B?dis3VnA2R3U2dHJJTkp0VnE5Q2tVUm1HcmJ2TDF5elZ3UlFQb0dCN2JNWTVK?=
 =?utf-8?B?aTVjMTJWM0owcXhPdndLQlgvcGUwL2FhSVpKdU8yQjB3dHkzVXdBOSs4YWFs?=
 =?utf-8?Q?O79ylyS97DzHDE3EhCyOu+9yw?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62b852f-8a12-41af-f400-08dcba797045
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 02:49:51.9119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /b1AdPtm1bfr4C1aZA7Ow1fXFD9OmVe3px649x/wIysUBcDC/M/BUihtGe+hGjrwI3c6p3n+q8hBcwhCgPtAgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6687
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


在 2024/8/10 10:52, Kasireddy, Vivek 写道:
> [Some people who received this message don't often get email from vivek.kasireddy@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Huan,
>
>> Currently, udmabuf handles folio by creating an unpin list to record
>> each folio obtained from the list and unpinning them when released. To
>> maintain this approach, many data structures have been established.
>>
>> However, maintaining this type of data structure requires a significant
>> amount of memory and traversing the list is a substantial overhead,
> Have you tried to quantify this overhead?

Sorry, no, my viewpoint is just a thought experiment.

udmabuf_folios is 24bytes, if each folio just 4KB, the additional memory 
occupied will be very high, far exceeding the size of the page pointer.

"list_head" is a linked list, and accessing it is not CPU 
cache-friendly, making prefetching difficult.

On the other hand, "page array" is a cache-friendly data structure.

>
>> which is not friendly to the CPU cache, TLB, and so on.
>>
>> Therefore, this patch removes the relationship between the folio and its
>> offset in the linear address mapping.
>>
>> As an alternative, udmabuf both maintain the folio array and page array,
>> folio array use to unpin, and the page array is used as before to handle
>> the requirements for the page.
> Using pages is a step backwards, given the trend towards embracing folios.
Agree.
> Moreover, the feedback from the former hugetlb maintainer (Mike Kravetz)
> was to not use subpages (or tail pages) of a hugetlb folio directly in udmabuf
> driver as it would cause problems, particularly when hugetlb vmemmap
> optimization (HVO) is enabled. AFAIU, if HVO is enabled by default, a tail page's
> struct page pointer may not be available (as it may very well be freed to
> save memory). Given all of this, it made sense to convert the udmabuf driver
> to only use the head pages of a folio along with the offsets of tail pages.
I haven't considered that HVO would have an impact on this.

If so, does it mean that we cannot guarantee the correct reference to 
all Pages under the folio?
I see vmap and sgt based on page, I HVO already freed all sub page's 
struct, These uses will all become unreasonable.

BTW, if page struct can't relyable, can we just save pfn array? Hmm, but 
many of they just rely on page.

>
>> So, udmabuf's folios only save the folio struct, foliocount point
>> the size of array. pages save page in folios, number offset given by
>> create list, pagecount point the size of array.
>>
>> Even if we restore the pages structure, its memory usage should be
>> smaller than the combined memory usage of offsets(8 bytes in 64bit
>> machine)
>> and udmabuf_folio structures(24 bytes in 64bit machine).
>>
>> By doing this, we can accept the overhead of the udmabuf_folio structure
>> and the performance loss of traversing the list during unpinning.
> Does your use-case involve frequent pinning/unpinning operations? Note

My only use case at the moment is to read large files (around 3GB) using 
udmabuf in direct I/O mode.

This means that if HUGETLB is not used, the udmabuf_folio structure will 
be particularly large.(((3 << 30) >> 12) * 24) 18MB

And the list when pin(add), unpin(del), may cost a bit.

> that this would be considered "shortterm" pin, which is different from the
> the way the folios are currently pinned in udmabuf driver, which is considered
Could you please describe it in detail? I didn't understand.

> "longterm" pin.
>
> However, one optimization I can think of, for memfds backed by shmem, is
> to not use unpin_list completely. This way you can probably avoid creating
> udmabuf_folio objects and having to traverse the list. But this would require
> differentiating udmabufs backed by shmem vs hugetlb folios, which is not
> great in my opinion and may not work if THP is enabled.

Considering the existence of HVO, I also feel the need to find further 
optimization methods.

Thanks.

>
> Thanks,
> Vivek
>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 167 ++++++++++++++------------------------
>>   1 file changed, 61 insertions(+), 106 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 9737f063b6b3..442ed99d8b33 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -25,17 +25,24 @@ module_param(size_limit_mb, int, 0644);
>>   MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes.
>> Default is 64.");
>>
>>   struct udmabuf {
>> +     /**
>> +      * Each page used by udmabuf in the folio. When obtaining a page
>> from a
>> +      * folio, it does not necessarily begin from the head page. This is
>> +      * determined by the offset of the memfd when udmabuf created.
>> +      */
>>        pgoff_t pagecount;
>> +     struct page **pages;
>> +
>> +     /**
>> +      * Each folio in memfd, when a udmabuf is created, it is pinned to
>> +      * ensure that the folio is not moved or reclaimed.
>> +      * folio array used to unpin all when releasing.
>> +      */
>> +     pgoff_t foliocount;
>>        struct folio **folios;
>> +
>>        struct sg_table *sg;
>>        struct miscdevice *device;
>> -     pgoff_t *offsets;
>> -     struct list_head unpin_list;
>> -};
>> -
>> -struct udmabuf_folio {
>> -     struct folio *folio;
>> -     struct list_head list;
>>   };
>>
>>   static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct
>> *vma)
>> @@ -51,9 +58,7 @@ static int mmap_udmabuf(struct dma_buf *buf, struct
>> vm_area_struct *vma)
>>
>>        for (pgoff = vma->vm_pgoff, end = vma->vm_end, addr = vma-
>>> vm_start;
>>             addr < end; pgoff++, addr += PAGE_SIZE) {
>> -             struct page *page =
>> -                     folio_page(ubuf->folios[pgoff],
>> -                                ubuf->offsets[pgoff] >> PAGE_SHIFT);
>> +             struct page *page = ubuf->pages[pgoff];
>>
>>                ret = remap_pfn_range(vma, addr, page_to_pfn(page),
>> PAGE_SIZE,
>>                                      vma->vm_page_prot);
>> @@ -67,22 +72,11 @@ static int mmap_udmabuf(struct dma_buf *buf,
>> struct vm_area_struct *vma)
>>   static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>>   {
>>        struct udmabuf *ubuf = buf->priv;
>> -     struct page **pages;
>>        void *vaddr;
>> -     pgoff_t pg;
>>
>>        dma_resv_assert_held(buf->resv);
>>
>> -     pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages),
>> GFP_KERNEL);
>> -     if (!pages)
>> -             return -ENOMEM;
>> -
>> -     for (pg = 0; pg < ubuf->pagecount; pg++)
>> -             pages[pg] = folio_page(ubuf->folios[pg],
>> -                                    ubuf->offsets[pg] >> PAGE_SHIFT);
>> -
>> -     vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
>> -     kvfree(pages);
>> +     vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
>>        if (!vaddr)
>>                return -EINVAL;
>>
>> @@ -104,30 +98,25 @@ static struct sg_table *get_sg_table(struct device
>> *dev, struct dma_buf *buf,
>>   {
>>        struct udmabuf *ubuf = buf->priv;
>>        struct sg_table *sg;
>> -     struct scatterlist *sgl;
>> -     unsigned int i = 0;
>>        int ret;
>>
>>        sg = kzalloc(sizeof(*sg), GFP_KERNEL);
>>        if (!sg)
>>                return ERR_PTR(-ENOMEM);
>>
>> -     ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
>> +     ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount,
>> +                                     0, ubuf->pagecount << PAGE_SHIFT,
>> +                                     GFP_KERNEL);
>>        if (ret < 0)
>> -             goto err_alloc;
>> -
>> -     for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
>> -             sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
>> -                          ubuf->offsets[i]);
>> +             goto err;
>>
>>        ret = dma_map_sgtable(dev, sg, direction, 0);
>>        if (ret < 0)
>> -             goto err_map;
>> +             goto err;
>>        return sg;
>>
>> -err_map:
>> +err:
>>        sg_free_table(sg);
>> -err_alloc:
>>        kfree(sg);
>>        return ERR_PTR(ret);
>>   }
>> @@ -153,34 +142,6 @@ static void unmap_udmabuf(struct
>> dma_buf_attachment *at,
>>        return put_sg_table(at->dev, sg, direction);
>>   }
>>
>> -static void unpin_all_folios(struct list_head *unpin_list)
>> -{
>> -     struct udmabuf_folio *ubuf_folio;
>> -
>> -     while (!list_empty(unpin_list)) {
>> -             ubuf_folio = list_first_entry(unpin_list,
>> -                                           struct udmabuf_folio, list);
>> -             unpin_folio(ubuf_folio->folio);
>> -
>> -             list_del(&ubuf_folio->list);
>> -             kfree(ubuf_folio);
>> -     }
>> -}
>> -
>> -static int add_to_unpin_list(struct list_head *unpin_list,
>> -                          struct folio *folio)
>> -{
>> -     struct udmabuf_folio *ubuf_folio;
>> -
>> -     ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
>> -     if (!ubuf_folio)
>> -             return -ENOMEM;
>> -
>> -     ubuf_folio->folio = folio;
>> -     list_add_tail(&ubuf_folio->list, unpin_list);
>> -     return 0;
>> -}
>> -
>>   static void release_udmabuf(struct dma_buf *buf)
>>   {
>>        struct udmabuf *ubuf = buf->priv;
>> @@ -189,9 +150,9 @@ static void release_udmabuf(struct dma_buf *buf)
>>        if (ubuf->sg)
>>                put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
>>
>> -     unpin_all_folios(&ubuf->unpin_list);
>> -     kvfree(ubuf->offsets);
>> +     unpin_folios(ubuf->folios, ubuf->foliocount);
>>        kvfree(ubuf->folios);
>> +     kvfree(ubuf->pages);
>>        kfree(ubuf);
>>   }
>>
>> @@ -289,19 +250,18 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>                           struct udmabuf_create_list *head,
>>                           struct udmabuf_create_item *list)
>>   {
>> -     pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
>> -     long nr_folios, ret = -EINVAL;
>> +     pgoff_t pgoff, pgcnt, pglimit, nr_pages;
>> +     long nr_folios = 0, ret = -EINVAL;
>>        struct file *memfd = NULL;
>>        struct folio **folios;
>>        struct udmabuf *ubuf;
>> -     u32 i, j, k, flags;
>> +     u32 i, flags;
>>        loff_t end;
>>
>>        ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
>>        if (!ubuf)
>>                return -ENOMEM;
>>
>> -     INIT_LIST_HEAD(&ubuf->unpin_list);
>>        pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>        for (i = 0; i < head->count; i++) {
>>                if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
>> @@ -322,64 +282,58 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>                ret = -ENOMEM;
>>                goto err;
>>        }
>> -     ubuf->offsets =
>> -             kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
>> GFP_KERNEL);
>> -     if (!ubuf->offsets) {
>> +     folios = ubuf->folios;
>> +
>> +     ubuf->pages = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf-
>>> pages),
>> +                                  GFP_KERNEL);
>> +     if (!ubuf->pages) {
>>                ret = -ENOMEM;
>>                goto err;
>>        }
>>
>> -     pgbuf = 0;
>> -     for (i = 0; i < head->count; i++) {
>> +     for (i = 0, nr_pages = 0; i < head->count; i++) {
>> +             u32 j, pg;
>> +
>>                memfd = fget(list[i].memfd);
>>                ret = check_memfd_seals(memfd);
>>                if (ret < 0)
>>                        goto err;
>>
>>                pgcnt = list[i].size >> PAGE_SHIFT;
>> -             folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
>> -             if (!folios) {
>> -                     ret = -ENOMEM;
>> -                     goto err;
>> -             }
>>
>>                end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
>> -             ret = memfd_pin_folios(memfd, list[i].offset, end,
>> -                                    folios, pgcnt, &pgoff);
>> +             ret = memfd_pin_folios(memfd, list[i].offset, end, folios,
>> +                                    pgcnt, &pgoff);
>>                if (ret <= 0) {
>> -                     kvfree(folios);
>> -                     if (!ret)
>> -                             ret = -EINVAL;
>> +                     ret = ret ?: -EINVAL;
>>                        goto err;
>>                }
>>
>> -             nr_folios = ret;
>> -             pgoff >>= PAGE_SHIFT;
>> -             for (j = 0, k = 0; j < pgcnt; j++) {
>> -                     ubuf->folios[pgbuf] = folios[k];
>> -                     ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
>> -
>> -                     if (j == 0 || ubuf->folios[pgbuf-1] != folios[k]) {
>> -                             ret = add_to_unpin_list(&ubuf->unpin_list,
>> -                                                     folios[k]);
>> -                             if (ret < 0) {
>> -                                     kfree(folios);
>> -                                     goto err;
>> -                             }
>> -                     }
>> -
>> -                     pgbuf++;
>> -                     if (++pgoff == folio_nr_pages(folios[k])) {
>> -                             pgoff = 0;
>> -                             if (++k == nr_folios)
>> -                                     break;
>> +             /**
>> +              * Iter the pinned folios and record them for later unpin
>> +              * when releasing.
>> +              * memfd may start from any offset, so we need check it
>> +              * carefully at first.
>> +              */
>> +             for (j = 0, pgoff >>= PAGE_SHIFT, pg = 0; j < ret;
>> +                  ++j, pgoff = 0) {
>> +                     pgoff_t k;
>> +                     struct folio *folio = folios[j];
>> +
>> +                     for (k = pgoff; k < folio_nr_pages(folio); ++k) {
>> +                             ubuf->pages[nr_pages++] = folio_page(folio,
>> k);
>> +
>> +                             if (++pg >= pgcnt)
>> +                                     goto end;
>>                        }
>>                }
>> -
>> -             kvfree(folios);
>> +end:
>> +             folios += ret;
>> +             nr_folios += ret;
>>                fput(memfd);
>>                memfd = NULL;
>>        }
>> +     ubuf->foliocount = nr_folios;
>>
>>        flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
>>        ret = export_udmabuf(ubuf, device, flags);
>> @@ -391,8 +345,9 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   err:
>>        if (memfd)
>>                fput(memfd);
>> -     unpin_all_folios(&ubuf->unpin_list);
>> -     kvfree(ubuf->offsets);
>> +     if (nr_folios)
>> +             unpin_folios(ubuf->folios, nr_folios);
>> +     kvfree(ubuf->pages);
>>        kvfree(ubuf->folios);
>>        kfree(ubuf);
>>        return ret;
>> --
>> 2.45.2
