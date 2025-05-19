Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B6FABB65F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 09:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33B410E36C;
	Mon, 19 May 2025 07:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e6Myq4A3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FFF10E3EF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 07:48:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdO4fgC8YTwEjImNtsXQ4GD2Vken84wUro+QqJIsgrQ1vW02aRJfhCQomSbhHoURosz7u5dG/whiKuXpGkBvxnK26PWUQS1aaHQ9JNhWz8RLH4xEbAfnm5SzXBtYNcGt7b8WfeFPwdHc1gq5ViNgrV4Q9dEqm6zwYTVWmN2BX1M3r6y1vbXcDwXLPyHz9894F96rIrsGhoOKqBok2rhZbeGrVZ3K8gt6v0dri0c9c/S7awf2B2Z5l8npDEb/Q8b6t43VZyc241kQ17C6sY2y/HRpvdY5nUCoOPsG9ICaqjW43pHZr9eS6hSpi7UycmeRevxEdqKN9ThGYM7z2cQyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGS+I0gUrH858KODiqzPzYZ8QRhNeLOj4vM38S/2ddI=;
 b=rAuiRVsCYs35nwJ9/nfZRsZWviGeO9B6OWbXjh0joGkhtR7KBmIfGIxs5zZfoy1vubTw5l4zrz2E8QuN8fPDaeHuYS94lwA5eiwwbgCM56FLlmF7hDuzeijopKhCTLqwAM/ubDtb8RgghueObKeCUlbjXThNfU8f6OEjBk+bR5NZaHnOBXlM/5dPVMjhwEcgoF9srl+plxmBfhSqcMZRdemKnfULdfhhR3Tm+6kK+X8OLG5ZLUFx9yYzQNvrHiyfC/6rSFrqMZctciFM6SrAxaVYFDvmFsSmHP0OwONmw54AAaZtzVSbcJRKWIuzrpaHQODSaqwPlitGle0MhcEE5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGS+I0gUrH858KODiqzPzYZ8QRhNeLOj4vM38S/2ddI=;
 b=e6Myq4A3sm4RNfseBeWp1cL0we/RYR8KT1+k8RhSNd/M7BMmhlyrWG7vd4+/iEWaVJwMWH/ujE8HfDVIdSJ4Vstlr5L7cuS0V5Z4wMVMixkvolZyFrMRj0RIEOqqHDO1vUYU79Fc82RIAn6qkloox0Xu/+7UZBm+T52nqj2+kPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7207.namprd12.prod.outlook.com (2603:10b6:510:225::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 19 May
 2025 07:48:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 07:48:06 +0000
Message-ID: <a904c0f0-bad6-437d-bd09-309d4fad6731@amd.com>
Date: Mon, 19 May 2025 09:47:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: wangtao <tao.wangtao@honor.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "tjmercier@google.com" <tjmercier@google.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>,
 yipengxiang <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>,
 hanfeng 00012985 <feng.han@honor.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
 <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
 <a3f57102bc6e4588bc7659485feadbc1@honor.com>
 <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
 <e23bfe917c8744aa9162744bdd8ac458@honor.com>
 <772d694e-706a-4d98-a236-43d59094e8d6@amd.com>
 <3d098b2109824738a5d1316bd1a516c1@honor.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3d098b2109824738a5d1316bd1a516c1@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: ae208d3a-34d9-4015-b635-08dd96a97dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGcxejNpZ3RlL1piS0huaitPNHAvMlM3RFZmeEtKTThnZG9HeG1RV2JtTFRw?=
 =?utf-8?B?Z0VpbElVRmxRVDUvZy9BcmRwSGpHTytmbUxtU2tXa25aTEdjWTVkV05yTjB4?=
 =?utf-8?B?Z0xUR2FIbnVVRWtGZGY3VEQ2MFRIRXVtNjQ2dHdiZ1pXWHE3Q0dNRjFlOE5r?=
 =?utf-8?B?ZlFVdlpDNHdHTWdYS05lSURtVDVlMUNaK2JaTnpCNzRhWm1JbVQrcTRDK0R6?=
 =?utf-8?B?eGFNMTl6OFIxRlNsWGVudlV0c2JFSTBMS1pKanBGZW9PRk02TERacGpKQ2dQ?=
 =?utf-8?B?WXJldFNtMk9WRWhNWndUVzBpTDE2S0xuMXM0eWdxZVBDa0xQVjlUTm1YemFh?=
 =?utf-8?B?cmpFRkNONExnL2VPK2JwV3FmRjRmWXhQSWFqVDNIQ3oyS2xKWkJEQmdjTmZn?=
 =?utf-8?B?UURkSlVWZGNSRDRLUDltRVNOaEt6bmpLQnVmOVRyVTlkL3NEY0VCbE93UTRL?=
 =?utf-8?B?NmIwOW1jelRmVWwxTGZQZC9McENXNC9ZTzE0OHV6YjFjUy92Z3pQZDBtMHZP?=
 =?utf-8?B?YkRvR2xnaUJhQVZrQTNkRkpaaVByR3lJMnNPbktieXFNL3hGbjRqcVpScVZ2?=
 =?utf-8?B?OHZ4UEJTakdkaGs2dTMyWXZyQXZpdFpxL1VsMFkzVGs2VkNXVEIxb0ZVZUJl?=
 =?utf-8?B?c01ibWcrN0kwSWdOVi9CWnIzN2dBaDFJdGpWWHJ2Q1c4WmNlY0s0M0hqUkZQ?=
 =?utf-8?B?OGtkZTAzOHo0L3liS3kzbXRJRVF1QTFhVkxYSnZxaUFJazJUWkk1b3NMVUcv?=
 =?utf-8?B?RkpWUy83U3JqMm14RU81NkdQcEgwa3pFZ3p6aWxOZEo3NjJiMEtLZmtiRUVR?=
 =?utf-8?B?ZDNNamZuQUNCZUJpbkxUbDdMVHJMZHRnRjNnZFhuVllXclV1SDlwZE1DTTAw?=
 =?utf-8?B?dFlDeVJjMnpYN2tiUEpSOThEY1c4NkJYZDBPSzZvdG9jTWMzV2tLY21OS2Ix?=
 =?utf-8?B?dkNaMG5hbkJCMGZMYWJSUDBCYWxQdFpiTGFRMHFpdWNtOEFueG9kRmZCMVFD?=
 =?utf-8?B?djd4QUFuVlE0bE0vTFpiQ2Z3RUNHWDVOajIzQzJ6TU1YUnBDenZTWjE2R1k4?=
 =?utf-8?B?ZTVrNlFwQzJLcGE3TFNTN3hCU2tVTzhMcllsdmY5NXhKMmtuVmk2aHBZTVVZ?=
 =?utf-8?B?Z0RCSDhTOWc4RW8yU2tCQnljSnBiVGMwZWhCQm5sV1RMcHQxWWwrbUJEWVJi?=
 =?utf-8?B?bGU0b3pPc3NGV1d6dFpPL3FXSWY3U0VYdE52QXJIZlZCRVVJV2c3RXcyeU5l?=
 =?utf-8?B?NnpwbGRoNUFTMjhuZ1h3Tk8yK0grS0t6ZU4yRHkzN203Qk0yK3BwcWZrSU0v?=
 =?utf-8?B?VHkxdWd4NVd3VGZtemJGL29jQVNIaktndXRTRGpKWW5EUEJ2UUthcUJhL3Ax?=
 =?utf-8?B?d1RZWHZyczFuc2NNWTBEVXYwR1U2R2F1ZDdob1RLNGVCYlhHelZ5WWttemxE?=
 =?utf-8?B?VDhkZVArTXZTcE9lVjFONmJKZ2pRalEyR2pjRkE0REFON3NLVVYrT01UWWQ0?=
 =?utf-8?B?NWhRWTIrT2p5dHZsb0NmOGV0MzFHeUZXVnFYcEREcEVRaEp1SEdCMFBWM3NH?=
 =?utf-8?B?N0Q1VmRIRWdvYlVlR2JMYkpBeFFCNytidmZnVzRFbUhEaXlZeVBoczd2dmdh?=
 =?utf-8?B?MVhBUWsxY2ZYM2IvWXU5bXhDaWhjZ3NWSDBSUGdpVlVWYVVObXAwU21xY3JN?=
 =?utf-8?B?OWRUdW5qS1Q3TkxMMHE4cUNqcXhWZTQ0V2NQZmFFVVMrUkFVRlRVdnZEdU00?=
 =?utf-8?B?dW9UTVFTSzNWRTl2TjBoOGh5QkJMMXE4cUpFWnE4ejB4MmhENFZQOWYydjNI?=
 =?utf-8?B?N1paV09TWnA5Vy9MVVl1TWZlTG95ZXd5WVpDenNCUDZrZ0N6ZmZBR0Y1dm5q?=
 =?utf-8?B?MHROTXRUK0RFVzZjNnFVMWdaeTFFNkd5TjFHY3FiazFJbnorM0ZpMzNidGJo?=
 =?utf-8?Q?TkfcsZrUAY0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q05QdXZ2bHJFRUlkM0M2VkYyR3J6NUZldWlqOGxidndSQmM4ZzJuTXVDdCtU?=
 =?utf-8?B?WEtWdmdxdW95R0phSW12b1lpK1diSlV6TzdZQmZURGRzVURNV0E3Yk9iN0t3?=
 =?utf-8?B?V1RkTWgrMFAxMUxmUXk0L2paRU1HUEVVN2RJVE9ZazAxZDgydklObjMrWEdD?=
 =?utf-8?B?K2QwRVFxZUo1ZjZGTnhFcW14Vm5EQU9mY0c3OHZxWDNGUjZxOWZqRDVBemtw?=
 =?utf-8?B?L0lCWUtHNlNNdXZybE1SdzlOU05wSGxLeFFXVFRRcDFjUFFldVd3Yzd0NVI5?=
 =?utf-8?B?MTcvZVZBSk91TE5VN0xBcGJRQ0lPYWM0RGFuTmVNSkU5OE5tTUtBRm4wcHRu?=
 =?utf-8?B?NkZ4YXFvUUtWWkszSWdlVnNiWjkwRmFDdlJUbmk3enR1TVc3amkwaEg4WFZt?=
 =?utf-8?B?WVFJTFJ0bFV2SkdJS0NqRk4xOFpYc3dOL05FQWpZQUlUV3huTWpQUjRrcnJv?=
 =?utf-8?B?R2czN0E5SzFITXdqQWhaQ0ZIalRMSVB5b3YvVmxjVW9wbm1VUGJzMnd3Mml4?=
 =?utf-8?B?UTR6bFdZQ3RNRVZ4MFFnQWlaMEVadzNrdE1CdzR1dTR0QkRyNHpnSGo3WWFR?=
 =?utf-8?B?Tmw0UjVneWZqeGltckdQZ2xUU1k5NzIvWHIrNTBMdWJvQjE3QXJyV2lhK2VG?=
 =?utf-8?B?aFFlYXJxanNOSXRtRlltalJseHczaDA1RS8xNU1RcHBqMzRCU0FaeXVxSDQ4?=
 =?utf-8?B?aWw5NGh4SWV3V0xvY2l4N2trQk9ka0NGODVOc3pib1M4U0VaTTQ1MHorbm5m?=
 =?utf-8?B?MFpRbjVUK0RlaVlKMkpEbnBncjVPbWprclAySnhIV0E2L3dKY1hyZFZXcU55?=
 =?utf-8?B?V2paTEdkdTJNa0ZXeVAvL0RqWFpyYUVFbHY5TVFKVzdzbTdndkdDQzFRSGRt?=
 =?utf-8?B?Q0VFSmdtUHR6SUt2dzF1Y1IydlA5MUZmNnlpTTQ1NnhxV2F0bmtHYTZLdkkv?=
 =?utf-8?B?WFV4dStDVENReDZFNWlxeGtRcE9sUDAzNzNhbVFpekRSSlFrbEtxYlVYZ0Ry?=
 =?utf-8?B?OE9ucG5iTUdkcGVmNXQ5L2hnN1drZ2RwUzJFOHViSzdvUng4TkZHa05QUVBO?=
 =?utf-8?B?YlozZmRKRkZIOW02U2hUQzU3Y3ZDVHlXTkpmUUsyYzFCQ1VXNElDVzVOWGZC?=
 =?utf-8?B?LzB1MXM2WFQ2d0ZxQVhMWGNNalVxM1NxMHVwOGFKV29sdkVGOExZcW0rQ2F4?=
 =?utf-8?B?TmlqY2VLSmg1QlNCMkxLME5DYjFRS1VWaGdiSiszenRsZmEyaEFjcEM4L1U2?=
 =?utf-8?B?dFMzUno1azB5L3JmeUhPT3RKWWMwZGhuSjlXUWQ0RUQwNFJpc3NnSk1kendZ?=
 =?utf-8?B?NWk0cHY3SnJ2Z1hFSTF4ajM1Q2VhUjRQMTZ3cGt6YnNrQnFlZ1pzaTdOQkxS?=
 =?utf-8?B?b3QxZWpUSktCMHdVSTdMNVNzeEdOL21YRHlqMkVkVVRTLy96a0UvMW5PMnBw?=
 =?utf-8?B?UXNLT1pXYjF5L0NLN1ZGSWJSdUtEWlNnblE3L1VUUlFzU2srcHB2MGZxZ3pZ?=
 =?utf-8?B?UEhmLzgrYjlaSVEyUEYzemxhVW5XYkRuek1wYzZpUm03U3lMSGFCblpSaURr?=
 =?utf-8?B?cW5hOXo4Tml1WExoblpLNzFlS1pOTmhlMy9ISzgvRFZma1Q3VlBRZ2NYdUJO?=
 =?utf-8?B?K2Q4KzFWZmlFejFjS1RQdGozajUxN0lSVUdZTmlteUdXMHFOZytySDNSL0pn?=
 =?utf-8?B?YnFKWEx4Q2psL1ZpUWRuQmJmV3Bsd3pmTk1sYVhKZ09XTjlzTDR5eER1YU54?=
 =?utf-8?B?SDIyZnNDcHM2RkdMS0JBYWpqN0k5SjFGVFp5SktlQ2svQTl5ditWZ042YXlQ?=
 =?utf-8?B?d1psdGRkcVcvc2R5dVpvWDc3bnB6b3hONVBwYjV3MWlXcis2eEZKTktvWXQw?=
 =?utf-8?B?WTRObzVlTDFsR1JQNGNiSVZwcG9jeWpPSDJHQzUrL1YrcDVUTVE1Mm5mTTJN?=
 =?utf-8?B?SERXSVRycDRWNlFZd2cwdXE0bWZzR2ZESytWaGlXdzlGYk1HMHFhTjNRNlhv?=
 =?utf-8?B?VmtHUDYybDFpUHg5amU1NVU0QUVhZnNsMUsyczF2TExmblUyT3IveC9NRWk1?=
 =?utf-8?B?dEgwOXROelh5RW0vT2VhK0V5NVVCRVhJTFo2eDlwN2lMWktkdG9JVGZndzBM?=
 =?utf-8?Q?VEjY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae208d3a-34d9-4015-b635-08dd96a97dc7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 07:48:06.4020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEZmRr04ODBbeKLq/l9qhkyYefJkGTKC5BOTirh0t2AcY75e+j8Uq/1HDQmlrxJ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7207
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

On 5/19/25 06:08, wangtao wrote:
> 
> 
>> -----Original Message-----
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Friday, May 16, 2025 6:29 PM
>> To: wangtao <tao.wangtao@honor.com>; sumit.semwal@linaro.org;
>> benjamin.gaignard@collabora.com; Brian.Starkey@arm.com;
>> jstultz@google.com; tjmercier@google.com
>> Cc: linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org; linaro-
>> mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org;
>> wangbintian(BintianWang) <bintian.wang@honor.com>; yipengxiang
>> <yipengxiang@honor.com>; liulu <liulu.liu@honor.com>; hanfeng
>> <feng.han@honor.com>
>> Subject: Re: [PATCH 2/2] dmabuf/heaps: implement
>> DMA_BUF_IOCTL_RW_FILE for system_heap
>>
>> On 5/16/25 11:49, wangtao wrote:
>>>>>> Please try using udmabuf with sendfile() as confirmed to be working
>>>>>> by
>>>> T.J.
>>>>> [wangtao] Using buffer IO with dmabuf file read/write requires one
>>>> memory copy.
>>>>> Direct IO removes this copy to enable zero-copy. The sendfile system
>>>>> call reduces memory copies from two (read/write) to one. However,
>>>>> with udmabuf, sendfile still keeps at least one copy, failing zero-copy.
>>>>
>>>>
>>>> Then please work on fixing this.
>>> [wangtao] What needs fixing? Does sendfile achieve zero-copy?
>>> sendfile reduces memory copies (from 2 to 1) for network sockets, but
>>> still requires one copy and cannot achieve zero copies.
>>
>> Well why not? See sendfile() is the designated Linux uAPI for moving data
>> between two files, maybe splice() is also appropriate.
>>
>> The memory file descriptor and your destination file are both a files. So those
>> uAPIs apply.
> [wangtao] I realize our disagreement lies here:  
> You believe sendfile enables zero-copy for regular file → socket/file:

No what I mean is that it should be possible to solve this using sendfile() or splice() and not come uo with a hacky IOCTL to bypass well tested and agreed upon system calls.
  
> sendfile(dst_socket, src_disk)  
> [disk] --DMA--> [page buffer] --DMA--> [NIC]  
> sendfile(dst_disk, src_disk)  
> [disk] --DMA--> [page buffer] --DMA--> [DISK]  
> 
> But for regular file → memory file (e.g., tmpfs/shmem), a CPU copy is unavoidable:  
> sendfile(dst_memfile, src_disk)  
> [disk] --DMA--> [page buffer] --CPU copy--> [DISK]  
> Without memory-to-memory DMA, this wastes CPU/power — critical for embedded devices.  
> 
>>
>> Now what you suggest is to add a new IOCTL to do this in a very specific
>> manner just for the system DMA-buf heap. And as far as I can see that is in
>> general a complete no-go.
>>
>> I mean I understand why you do this. Instead of improving the existing
>> functionality you're just hacking something together because it is simple for
>> you.
>>
>> It might be possible to implement that generic for DMA-buf heaps if
>> udmabuf allocation overhead can't be reduced, but that is then just the
>> second step.
> [wangtao] On dmabuf:  
> - DMABUF lacks Direct I/O support, hence our proposal.  
> - memfd supports Direct I/O but doesn’t fit our use case.  
> - udmabuf via memfd works but needs systemic changes (low ROI) and has slow allocation.  
> 
> Your objections:  
> 1. Adding an IOCTL? This targets dmabuf specifically, and our fix is simple.  
>    sendfile doesn’t resolve it.
> 2. Accessing sgtable pages in the exporter? As the dmabuf creator, the exporter  
>    fully controls sgtable/page data. We can restrict access to cases with no  
>    external users.
> 
> Could you clarify which point you oppose?

Both. I might be repeating myself, but I think what you do here is a no-go and reimplements core system call functionality by a way which we certainly shouldn't allow.

T.J's testing shows that sendfile() seems to work at least in one direction. The other use case can certainly be optimized. So if you want to improve this work on that instead.

Regards,
Christian

> 
>>
>> Regards,
>> Christian.

