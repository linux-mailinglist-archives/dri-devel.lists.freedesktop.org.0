Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F265496EE5F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AE010E9C1;
	Fri,  6 Sep 2024 08:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="BPyoJj2p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11011054.outbound.protection.outlook.com [52.101.129.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF4410E9C2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpZyyYrRHn7KgpP3ZERX0Q5qHLy0A4PC8yZPlrrVANTYABMut6kkuavZWfwUyriJi+XDXsX6BwDDc3OEx+rAVkg49gidcbbIm3V4xUpZnIMYBRVdgHV5kXdTunFdbZH3rqhEmsvHS8l9Hzt8c6I0KyegevpB0snyc4twuMTAb+G3XAPh0CvRqbDjXCcdvCBonqJzrM9pNjcyqKyBndexoGAFRUo/LuHOB8qkD+fmLyX5+iyztoNiw2QuFBAdu5+JMG26vvbZY1/BJNvKfBJkrcEnGhnRAyfWbKlqdllDXGMF0w3ukt45wq/QQj0+OCv0yv2Oc4dppN6lZV/kThYQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WH9Q1LOhgnyzCH6K/JCSXfnJwz6Ncp7z/w4Nx4FpR18=;
 b=uzy5nt6s3uLcIQp9LP+1GpsVCTBa+qz1upVieBAbIJ9JopjArGk19pgAInjSzgS4TcdVQJTyNc76LYDHbX9Cr/ufGgJui9EAPDOa1klagJ+Oznbd2eKC2OdLh2W/SQq7nIKna3r/B3bMcJaE2HRqUTGvxJrrKn7El20vePQnJIB9b6Q/RdUgJaygJcTW50xg4ngwGifSt7Ps2UP080r6yXO3V8Q4cxNqKnfvO+MrtKhnm5YHnzLqvGJYxSM8D4LNd9oYstGYy+kEYsNTAeAmSG56bF2D0Zk6DtQB2AbEHiSwbG+gmo4LiGpXPzIc1GnDYoRXdEVA67XOdYYbtxK0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WH9Q1LOhgnyzCH6K/JCSXfnJwz6Ncp7z/w4Nx4FpR18=;
 b=BPyoJj2pnVH83cFy5S9IbmkHmatnK+kdKotLApfFFbfacDAPO5nEQ33P85Xl9z7qKmA7jhRWYjyOlIJt0/MB8ZFYcKWwpOPyjdh2ZHcAoBqvzQK52e+BC0wzqUTZ+lWmyMzEWZvE5h9tuazhLhAWIklQBOKsJVoQWXXSqesiNceG9RWLKoYhvc8mDZaGeWL59mQazoQB7OoVQHrxoZHQMV0yYaPW/qsqO5OBXEBIMs6lAO6v0t4zoGn3es9PQuF11bXRULOvPxlFczgZE//v/EbZ1tUhVymK09tB9/pMOPcx9EMwZPGTkVei65FXNPrqpIR+yVXv3kFGzcVyqXAW9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5012.apcprd06.prod.outlook.com (2603:1096:4:1c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 08:40:37 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 08:40:37 +0000
Message-ID: <90c35051-0528-4dd4-b97b-6ac937b729ab@vivo.com>
Date: Fri, 6 Sep 2024 16:40:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] udmabuf: reuse folio array when pin folios
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240903083818.3071759-1-link@vivo.com>
 <20240903083818.3071759-8-link@vivo.com>
 <IA0PR11MB7185D2C5AE98C2EBD72B72C3F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB7185D2C5AE98C2EBD72B72C3F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:3:18::31) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SG2PR06MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6dca3f-0b79-4cf4-1bcd-08dcce4f948d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmZGckxpbjZIMUlrT2pGbW1VRzFiRGU2MDAzMWJnRHhyNHNMS2FoU1F4NW9p?=
 =?utf-8?B?dEE0aTUxaE5LdTVFU0dDYVRleS9PQTc1Yno4ZFBvL2IwbVpmYjZVc01lYWxW?=
 =?utf-8?B?MWo3OVRVaG5nS3pCNmU4MngyVXpmR3BNY05hSHFNL20zSEhRZkRLVTlzNTdD?=
 =?utf-8?B?amVkSEs1SVh0L2hhUXNXM01PQ2xEaEkrVXV0TDlwWTdlQWs4UFBtc1RPSnFm?=
 =?utf-8?B?N1ZvcEt5ckxSbWFoRkk4b3M3VytKZXJ4Q2s5Rm0zNm1Cc3hiWG1kOE0yOHJz?=
 =?utf-8?B?ZDZvSTdzT29mNzkrWGZtZVlkUjl6bDdJTDZGQ0dNZ2I5V3F0R08xdFdJK1Zt?=
 =?utf-8?B?M281dEFjTG5IUkxVMUc1bzlPYWpZWEJTSmhoUFVMNkdXbHZnR0tUTWh2MWNB?=
 =?utf-8?B?K0ZYak5WUEdEZTNSSEo2Q0N4OTNpOHVHbDhsMmtYeURKS0x4eEhiTkExbG9p?=
 =?utf-8?B?NUV3dlluS1hKbHVuZ2tHQ1N5UHA0cWQ2cDRJMWdDeFZ3TlQzS1IxQVdQTU5q?=
 =?utf-8?B?MFo0a2t3YjBtYk5Wb1YvOFdLZEZtMjhjeitqdkJFQlMyRlg4K2p0UlBVWmdZ?=
 =?utf-8?B?TU05WHdFdit5TjErMUxTYkRDZW1oNFpzQnVxT0VUQjg3UHRHK01CTWR2NEJn?=
 =?utf-8?B?bG5GWG5IWWViRllYdm9pZ2VQN0VqeWtKaC9hSWFVU2FDeWZrSzN0TUpPQ3Rx?=
 =?utf-8?B?c0M1SkVsNFJhOU5jV3I5NFJWQ3VsR0c1b3RkbVZvMlJmNHlMbjFnZGpQWHZz?=
 =?utf-8?B?YmozWUtvekRlU09SUnoyUFErSE84ajdCc0tMMWYzOVJWcGNUcTVCUmYrVHhZ?=
 =?utf-8?B?OEYwSE5TeXhzZzhkYWEzdVhvdFdydWFaeGNtczJSb0dCWUYyVm84cm5SSkRU?=
 =?utf-8?B?QTBKWjI0MW42S3NaNGVsVE1nUlR0bUxvMjBVcDRTYnZhQVM1eHFqbGdEYUdB?=
 =?utf-8?B?b1hNWUtkL2c5dU84bEpjRnZqVk0rbE5uOTJNN05YcWd3ckl2cXZVMGRvY2s3?=
 =?utf-8?B?OElKQTNQd1dGSjNNRHFVVWJHUHkyMkpzU01SM0p4aEpybU5sRlUzNXphRUFT?=
 =?utf-8?B?MGpZcXhTbDkvU2NhVVF2V3paRFREOGc1QWhDUld0UDc2dUFLMDcyN2RTd1VP?=
 =?utf-8?B?V1dBdEdxQXpoWURNVVZ4LzkyaFdGWVhFMEo2NkFhSjlmM0dTeHZUTUE0ajM2?=
 =?utf-8?B?K29KRzZiS1NCR3lCM3MvanNUUDFUQms4dFk4Q01hdWZlTWJZYlZTTGtkSE1U?=
 =?utf-8?B?bmpiVk00dVNUSHk2bE1QYWE1Y05WcEppSnJGZ2o5cEhzblp4aTVGOFNzUTFI?=
 =?utf-8?B?TXZKWkdVUm1kVlhUN2lkZG84cDI3dnpiT3FFKzRvb2JLdHRQSTN5YkREbUts?=
 =?utf-8?B?a0lhMXh1Nm5hZ2d1K091Sk55ZC9KZ2VNcytRRkUvK0t3S0FxSzQ0SGU0ODlr?=
 =?utf-8?B?eG4wRjdJYXU5TTVZY05CYU1HdXBoVHM1Wk9YdVdlMDZLN2NxYm8rOTRZMHdy?=
 =?utf-8?B?V0NqaVlMRXVFY2ladUU5eFpzc2ZKVXhiU3ZqRWd0dHFaZkFhaFVtektrYXhY?=
 =?utf-8?B?TzBFOFBBK2Z4S0JYa0pobUtZNFhOM3hxeVJUSkZKdkFZUWx0NDF6RUpraEc2?=
 =?utf-8?B?UHU4YUVWc08rTm5RSFNqVm9HbUJ1Y3ZqVElqUFdncFV4ekVHZlpyWG5Vb3Qx?=
 =?utf-8?B?Vzk1bCtxcmRkeEZwOVBlQmRWdENGcmlHYmJ3UU9rQnlvU21nbHZHZXpvU1Yy?=
 =?utf-8?B?MVJLV0FrUXY5VVJPOTM4VlRDS3V4ak5qdGZ0RzhBdTY1ek1NSW42MlZibEsx?=
 =?utf-8?B?VmR2dzN2Njl5U3QwWkJsOUZFaFBCQnl3L0dnbEZLODR2MUEvN2VIcWkvSWdr?=
 =?utf-8?B?RGRpZldaMnpraHdVS2tIK2tIaFRTeCt0amRlSmV0YXJNTVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2tmM0x1Z1NmVnFFSVdFRlJhd2MxWnlJVVdYRzZjY1Z1NjUxempWODlFcGta?=
 =?utf-8?B?cWRRVk80MDNWd2MxK1llVkM3TTBIMk95OEdGQzFTRVVzcFA4RDM5SUIxeGFk?=
 =?utf-8?B?eG5lYXZ5WVFzQk9pVG90aER2MlYwZUZtOVFIQkxVblVIUlFVZktoRXJyWVZ4?=
 =?utf-8?B?bzcrMitMTjc1Y0RiNDlURnE3dW5Sb0xLSlVMTXI3bk1uUjJoZTc1Z1NSd2J3?=
 =?utf-8?B?Y0VQa2cxZkxLN2hHa0NVKzU1ZmduenliWHl0aHRGUlI2QVpNQ3ErYkdRd3lT?=
 =?utf-8?B?Z0lqWUJyRkg3NEU2M1FLZExrV1J4MndWTG9Nd1B0M3g3enMveGw2K1JvQzRU?=
 =?utf-8?B?VkFMUXlBa0RuSFpVYUJLWTRzNjM2MmtiSW5hSk9TSTZHT3djMjhLbnptVVBN?=
 =?utf-8?B?Qk9XSEdtMTlRMkc5YmczSVl5d2Q1b1RMZVQyLzR2dDF4dVU3ZzBCcjNUV1Qx?=
 =?utf-8?B?NThGeFVjaVZtT1RpZ3g3Q0g2dUNHQ1gxSVRTNUo4QXpwaHVwTE5FWExJeHRw?=
 =?utf-8?B?SnBEYytGNnJob1pNQmxJTUU5bk5KZ1luOVZSRWxoQ2xqZGFmWlB2TExlQWZI?=
 =?utf-8?B?cEljeFgzZnQvRHBvQ3F6dXN0a0o2YmVuSC9qQjRCZ3MwS2lJYWdUUXlBdWlQ?=
 =?utf-8?B?T2lVa1NHaHFjbjRkQzRwdkNnaTE4RmdOa3BRUmJGVU5vSXQra1VxTTMwVXpt?=
 =?utf-8?B?SEJUV2hqL1NLenJtR3NGMHVHbEVxZ3kxUWtFaW05T0RRV2Eybk1iVXZTTENX?=
 =?utf-8?B?YXpuS2N3eVhaaDdJV3BrQW9uVmRCMm9oTjV6dVp3VGQ2RUgwWU9TK21Gd2Rh?=
 =?utf-8?B?MXRoQ0dVMG84OXN0cHlXN29VZlY2RmxKNjMrVERqNStjYXVyV0lmdFdXMEQ3?=
 =?utf-8?B?K3MwM1RRd2NDZ0tZNThoMVN3NHhnVGMxZ2RtUUhlWTBCcVduUjdxS09zVkZh?=
 =?utf-8?B?eW1LVng5VmNRaHk4VE1zNEZCSGg5TXJMMGVsQVl0YTM3Tzg1MmhpWDRXSDQz?=
 =?utf-8?B?d3FxYnZWSTB1MDF0WXJYcU41eG1IMTY0V0kzZi9FQ3hsNEVzcjI1Umo2UXZh?=
 =?utf-8?B?RFMwUEhVS3A2SjBBQWdYdmlqN0c1RG9nZmRubGRkelpmMloxcFROVHVTb3pB?=
 =?utf-8?B?bmsyYXgyYklya0dwRmd2WThuUlZjcnlNcW1GUjVkUUdUVW5mak8rRitZcDdK?=
 =?utf-8?B?Q2RlWDFOK2hlR21kOTd4WXhmbjV0OXNKc3ZxYUF1bXBpVVUwS2VYU1lCYnRk?=
 =?utf-8?B?bXgwVS9UaGcyN0NiQ1JYNkkvNXZpb0c4NHRRT3laWGEyTTYrS2xaWHlpdW1E?=
 =?utf-8?B?bG8wR0NST1hRdjZNWitoVjdYUHBkZ3F1NGowSSs2Vi9GdW5vV0hUN2J0Z2hw?=
 =?utf-8?B?b1ZGZGpWOC8zeWQ5RmtZeWo4RExhNTRFQlVCd1ozUHdaV25PakFtQjVOeHpJ?=
 =?utf-8?B?d1lubFlBVFN6ekZBOUtjUENRTTlxOERSaDRMdWhYaUFVakpXUWVwZGJWV3dN?=
 =?utf-8?B?QmZOZUFuRXlGcTA2Nm9pb2VMVXVncnlZdTQvRTlCUjM0NnFiL3VtQlBRV0hp?=
 =?utf-8?B?YjA1STBjVG8ydDUwbmdpT1RHTFpCM1Z3T1RqS1hQYW85dVRqR2VPdC9nT1VW?=
 =?utf-8?B?S0VoUmJlK1M1RlFQMDRyRDQydlJvKzZlY1ZSTlEvajZNcnplRmlTK1B4Zk44?=
 =?utf-8?B?WXRmdFdCeGRPM1crTFJzRk1SRjU2b0UrZG52Z1BSRWg5NTZrWGEweUVFdS9E?=
 =?utf-8?B?VkhScUNxMVYyMndwREtDWExDb2dpQ29Ocnk4dzluRjJBd2hRc1ptOTh6Uk13?=
 =?utf-8?B?c2p4bUM5dFZpejZVbUxiMlJ5aWFWWFcySmQ0SjFhNkIxRE84eThma0trTUNn?=
 =?utf-8?B?TXJ1Tko2anIwczVmQkZFSnhYcSttcUdrTEgvZERJVDMyV0tHVVUvcmNBU0NQ?=
 =?utf-8?B?a0VPMGFrVmFvSjZxcmdlZDFQdERFV1NybkEwQktBRWJsZWlBdjFoZjlLenNo?=
 =?utf-8?B?TXdsN0RtYVhrNis3QnRBbXl5SHJnekRxTjI2MGlCdisrNUI2UWl4cXB4TGND?=
 =?utf-8?B?RGJyN2I2SUF4MzllVk9oVDBYZEtyUEdaUjIwa3FpNkEvK2I5d09CNjZpRzdk?=
 =?utf-8?Q?juY192FSIBLSW4QAxTvQvSZf0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6dca3f-0b79-4cf4-1bcd-08dcce4f948d
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 08:40:37.1323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMFLMszeI1J+50a9tKcJHBNFqW1kgX5LJxFru2Yv+roRYhpOfQFvJgMcctzKBAfknsWXnbNFWYKmBMt2thoO4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5012
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


在 2024/9/6 16:23, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH v5 7/7] udmabuf: reuse folio array when pin folios
>>
>> When invoke memfd_pin_folios, we need offer an array to save each folio
>> which we pinned.
>>
>> The currently way is dynamic alloc an array, get folios, save into
>> udmabuf and then free.
>>
>> If the size is tiny, alloc from slab, is ok due to slab can cache it.
>> Or, just PCP order can cover, also ok.
>>
>> But if size is huge, need fallback into vmalloc, then, not well, due to
>> each page will iter alloc, and map into vmalloc area. Too heavy.
>>
>> Now that we need to iter each udmabuf item, then pin it's range folios,
>> we can reuse the maximum size range's folios array.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 34 ++++++++++++++++++++--------------
>>   1 file changed, 20 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index d449c1fd67a5..d70e45c33442 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -343,28 +343,21 @@ static int export_udmabuf(struct udmabuf *ubuf,
>>   }
>>
>>   static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
>> -			      loff_t start, loff_t size)
>> +			      loff_t start, loff_t size, struct folio **folios)
>>   {
>>   	pgoff_t pgoff, pgcnt;
>>   	pgoff_t upgcnt = ubuf->pagecount;
>>   	pgoff_t nr_pinned = ubuf->nr_pinned;
>>   	u32 cur_folio, cur_pgcnt;
>> -	struct folio **folios = NULL;
>>   	long nr_folios;
>>   	loff_t end;
>>   	int ret = 0;
>>
>>   	pgcnt = size >> PAGE_SHIFT;
>> -	folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
>> -	if (!folios)
>> -		return -ENOMEM;
>> -
>>   	end = start + (pgcnt << PAGE_SHIFT) - 1;
>>   	nr_folios = memfd_pin_folios(memfd, start, end, folios, pgcnt,
>> &pgoff);
>> -	if (nr_folios <= 0) {
>> -		ret = nr_folios ? nr_folios : -EINVAL;
>> -		goto err;
>> -	}
>> +	if (nr_folios <= 0)
>> +		return nr_folios ? nr_folios : -EINVAL;
>>
>>   	cur_pgcnt = 0;
>>   	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
>> @@ -389,10 +382,8 @@ static int udmabuf_pin_folios(struct udmabuf
>> *ubuf, struct file *memfd,
>>   		pgoff = 0;
>>   	}
>>   end:
>> -err:
>>   	ubuf->pagecount = upgcnt;
>>   	ubuf->nr_pinned = nr_pinned;
>> -	kvfree(folios);
>>   	return ret;
> The variable ret is now unused in this function. Remove it and just
> return 0 at the end.

Oh, nice catch.

Thanks.

>
>>   }
>>
>> @@ -403,6 +394,8 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	pgoff_t pgcnt = 0, pglimit;
>>   	long ret = -EINVAL;
>>   	struct udmabuf *ubuf;
>> +	struct folio **folios = NULL;
>> +	unsigned long max_nr_folios = 0;
>>   	u32 i, flags;
>>
>>   	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
>> @@ -411,14 +404,19 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>
>>   	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>   	for (i = 0; i < head->count; i++) {
>> +		pgoff_t subpgcnt;
>> +
>>   		if (!PAGE_ALIGNED(list[i].offset))
>>   			goto err_noinit;
>>   		if (!PAGE_ALIGNED(list[i].size))
>>   			goto err_noinit;
>>
>> -		pgcnt += list[i].size >> PAGE_SHIFT;
>> +		subpgcnt = list[i].size >> PAGE_SHIFT;
>> +		pgcnt += subpgcnt;
>>   		if (pgcnt > pglimit)
>>   			goto err_noinit;
>> +
>> +		max_nr_folios = max_t(unsigned long, subpgcnt,
>> max_nr_folios);
>>   	}
>>
>>   	if (!pgcnt)
>> @@ -428,6 +426,12 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	if (ret)
>>   		goto err;
>>
>> +	folios = kvmalloc_array(max_nr_folios, sizeof(*folios), GFP_KERNEL);
>> +	if (!folios) {
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>> +
>>   	for (i = 0; i < head->count; i++) {
>>   		struct file *memfd = fget(list[i].memfd);
>>
>> @@ -436,7 +440,7 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   			goto err;
>>
>>   		ret = udmabuf_pin_folios(ubuf, memfd, list[i].offset,
>> -					 list[i].size);
>> +					 list[i].size, folios);
>>   		fput(memfd);
>>   		if (ret)
>>   			goto err;
>> @@ -447,12 +451,14 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	if (ret < 0)
>>   		goto err;
>>
>> +	kvfree(folios);
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>
>>   	return ret;
>>
>>   err:
>>   	deinit_udmabuf(ubuf);
>>   err_noinit:
>>   	kfree(ubuf);
>> +	kvfree(folios);
>>   	return ret;
>>   }
>>
>> --
>> 2.45.2
