Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10D8AB40C0
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 19:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95F110E475;
	Mon, 12 May 2025 17:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lL67Su98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3758610E469;
 Mon, 12 May 2025 17:57:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kkxjs3hM4hjD+gOyXpv7GSmCN6eBQcGiHJrpbLCUhV47UF1uuCMl83l1FKhohcqgC0YJRUkm5k1X276R9OfdcXl+8qiNc3jfnxjokSYhFUjOVbRWVlRAiFWcgkHr0xy5es0FLy+b+F8fG5b/AavF/Y/Z4Jr7Tlk6zSqJ5pcvvwtQ952cbQhXRmTA9NFstPn4SBmVFBBOvnXIXZkmxyEsdi0gqYRJjOM0HH2vJdRUxJR0aPkV1hgmmw/DMdj3BbG2dvKNNqNdNzm1gMHX/gig96Njm7zKcTSrzhqyZgMR2a5Sjruf6ntRP6c4tBxvJi9ia0A5wGZvqGMrpRA1H6uW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UTOCpSo5vj9PaOc3EJzqNz9pDaBlBPP9YoANzuxqxA=;
 b=kqq/fNLq/nNgJHtPTjUiZbKjgl53m6ZFdoh5PVz82HweO1iexw0pCHOrFcJPwalLMGXEfV/QiQNVTAkSxw9x72bX+CTnf7Ib9/4Q7SVHtQxEICJKpgUVfZCp66HEFBvG+5ue2Gi7BLuGFiFUFk5nnzo6ooIgt9RlS3vtIraoGwQwSbshdC0QcYnQi5R6PZI538/b4eLTA+SqU+xYsdZVYImjruE6YGf2h0blb1yy7bOaPS2EjapJmoJU9Vd6siGCXIttu0KkUne0YNwv7cZqrOTFt8XWnG5ux7umFQwVYlbPDKzo6DycN1h6S4jFy8DW0KqKfa1oGestTN/si0ebaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UTOCpSo5vj9PaOc3EJzqNz9pDaBlBPP9YoANzuxqxA=;
 b=lL67Su98V/SFax3nd7K3UcVwDIFkmOswHFfBOui+iO0MOri5aN1Sv0n9ARtus7DF9bYKo9RASRZ0KERpFTy1tWCZAQ4Rn91VQ9PeCXk1xPaPjKPYQLI0VkjEYaYvonK/DVXPKkIb1hTRNmb+oh8UII0wkSue17Ig9odgS+GPiMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7107.namprd12.prod.outlook.com (2603:10b6:806:2a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Mon, 12 May
 2025 17:57:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 17:57:34 +0000
Message-ID: <bb7a5c06-2e93-4088-a5bc-9ca4f5304eab@amd.com>
Date: Mon, 12 May 2025 19:57:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 04/13] dma-fence: Move array and chain checks to flags
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-5-tvrtko.ursulin@igalia.com>
 <f75f6d26-ac93-48cb-a9e2-adffe0af1ed8@amd.com>
 <34263299-6279-44a2-a224-6a094a319ea6@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <34263299-6279-44a2-a224-6a094a319ea6@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: d3177b36-bfb1-40bf-38b0-08dd917e7940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHpmaGZqYkNhM3FpNGJ1ZDQrMDRjZzV0cjhUeVovQkhyZGVySnBsNkpycElO?=
 =?utf-8?B?UlEzZ1ljMTM1S3Z6RUlVSzdIQ3A1ZmlCSzFvMk5WWG1NdTRUUUUwTlhJdFVT?=
 =?utf-8?B?bXpJNm1YdVRIQTQ5QUxwd1ExMlFRMGx3MzNrN2U3QVFyZ012bDQ4NG9RWWFk?=
 =?utf-8?B?cXpkdTBmRXJ6S0hVWHJWT3NKK1RqMTF4RWd5RGE0ZWRGTjNqZnNFdENPV1Rt?=
 =?utf-8?B?MVQvRk9Ya0tqY3ZheFI0NFVNa1hNWXRGeU50NzlTNXZzUzZ4UUZqb2o0bzFQ?=
 =?utf-8?B?SGdhdEJKL3I3WUtWYmcxbXV3ZmY3ZzhEUG5ZM1g2aEZuMG1SQUFLNDNNeDMv?=
 =?utf-8?B?SVZyNE9qQVdpV2NzeHVxMjIxZXNYQnIrTmxKakQzdWd0VUJuNldEaDZWb2hy?=
 =?utf-8?B?aDlLTDB1Sys3UDh6aW9hL2ZKb0ppVW9UOXVucmdRbTQ4Mk5iR3JERTZHNGhG?=
 =?utf-8?B?Rmd4MWFPU05mcVhvUDBhZnZ2TnBYWjkxOEtScFJJeEFkdjJLTlZUZnRBcmJo?=
 =?utf-8?B?THhBZUhvaEpPcGI3cGRHdi84NEhadThkclpjaTlLS2l5TW9VaGpRb2NCTVJB?=
 =?utf-8?B?bHg2OEZIQm13eitXbWZHT1RZSTAxMWM4bjYzc3lDc1h2cFVJVnRvT0hYbTFX?=
 =?utf-8?B?MnB3WVJvOHJqV0xkd1FteGdGOXBnZ1hrV29ZWFVYUjZSZktRZ3ZhRngvVUVV?=
 =?utf-8?B?MGhDWnFOUHlFL3FPeDhxRFg0STJ2dDNLSzlZZEtLaSt3Qm5vQ1NRZHk5eUZJ?=
 =?utf-8?B?NHA1VEUvbVRUczRORTdhVkZDKzBRYk9kQ0JObmp5d09kZGxwbzlsSUpqd25x?=
 =?utf-8?B?Y3NMNWluRDhjMFVYNnJCWGJqbE1XUitGVVFuYldqNXZoWEkwSG16TE9mZnVy?=
 =?utf-8?B?RzBnTGd6OURNYzJTRmFwbExCVk9kZ09ZTTJ3LzdXY0tpdHJMd2dWZnNwaWI5?=
 =?utf-8?B?eVNRWlhpVEhnUzU1Q1VUUlhvZ2p1U1hHTDRmWXYyNzRWVHZEZ1ZTbE83QWsw?=
 =?utf-8?B?UGxLME4xY0d3dFl6NjNiNzQrSGtuSW16MWQ3eGJHZC9IcmRVZ0NnMFJUSkFF?=
 =?utf-8?B?R2J5ZkNHd3JsMXE3bWZ1RWJGTkdlVW43U04zSTlPM3Z5QVVtU2wzczM1UjBz?=
 =?utf-8?B?VkxsbjkxcDVMK1Axcnd0UjRKNHhZV0QyMTZOS2xxa2Z6UDZIR3ZHb2lHWWRo?=
 =?utf-8?B?OFJLNlFxVlVDTXVHVXQwcWN4ZzdHU0VySG9Bd2pTQ1RtOWErT0dOcnRxK0Yv?=
 =?utf-8?B?a0RPZllLTnVIeURobjBDRlJvWGFPZElJQ0VWQXRBMzc0K0lWL09zVHZBbk5m?=
 =?utf-8?B?UzhBdGNNcWl1YTlDdTBmUm80YmNTemg1USs1WGltWGM3VWNXVFlNMW5qUjJD?=
 =?utf-8?B?VE51b2dvK2REbzVwa0Jra3p1cFhac3ZkMWdvak54ZmVjMG1CcEpoYVdyclJV?=
 =?utf-8?B?VUhwUFkxQWE2OVFXUGZTQnkyeXRZUnlFaWRwSGhJdkg5RkZjRVgrOXV4aWtR?=
 =?utf-8?B?K0dMVEpCdWpTUVF0WS8yYm9aU3E0ZWRmckhVQkVBSnBnVEhmdGRjWEw3VWZ2?=
 =?utf-8?B?WlcvSXI3dFFrMnd2cVUrcExzZ2cwc25zMnJCZVQ0NUlJOU92T0RvSU1VNkdu?=
 =?utf-8?B?QVk5UmprcEYrQjZkZlp6ODNzY2twS0wveW9vTFduSTlZVmswSUk0bHhoNWZR?=
 =?utf-8?B?cjZqdFpyRVlnVHlSUDdGT0VBN3pxME5lQ3FBSlBSZWNRSys4SUJMVm9EcTZx?=
 =?utf-8?B?ZGJUYitrb0U4VzRsM1hQWGVrVjJNTWgrU3o5YUFaUmRCdi9iSlhQTUxYVUVp?=
 =?utf-8?B?WjQ3b09NYllNYzZ5M0F3VktDREJFcVlkSk92QmhRbG56MUxuSkZ5NXRRRnpU?=
 =?utf-8?B?aHU0akovWXB1WVFDZDNyellTVHptRGJIR3lsSUNQWFVTeU9SK0p4bjB4eG1D?=
 =?utf-8?Q?nPvRWIXiJGg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzVGNDFGVi96am5DZGIyVUxBVVNYUzFTZ2RHbm1xSEpoZ3JjRzBvc0xTb0RW?=
 =?utf-8?B?cXZzZHpwN2hxa0lvMUZCUVJObVpVNmVBQjMrY0JGZ1RDSGZ6SFFyRis1ZVdU?=
 =?utf-8?B?dE5nTjdFdjZ6YVlaZzdFOXdtUVU3ZXNZT1dsUFM1VVZlYWNHMm0rUlFnQzVl?=
 =?utf-8?B?WTJpVldoVEFLQ3pDRlFIWCs0L2pMTSt4MDhtTC9zSFMzNFFGWGlIaGtyYVZQ?=
 =?utf-8?B?VU5PemJwb0swZHZ1UkMwbmdFenNKREN2QnhTMEs5T3NxTTBxSGh0bGFwWUtI?=
 =?utf-8?B?TnhJbytkWTIrdEk5c01UMHE4cmpYOUhjRnBQU29od3h3dEFuK0k5dHFPRDNh?=
 =?utf-8?B?OWFWREhoTmRxVzlkMnkvbkFKRUE1eDc2Y3ZLaGE5ZnRsK0xwZ0ExWWlkOUhM?=
 =?utf-8?B?YVZ4d3Z2UW9pQnppdlpIMFJCOEdqenFvT1VhVXY3NEJZdjJVdS8zUWNKNi91?=
 =?utf-8?B?d3BFNjdZT25ETjBKZXhWSlczV2dCaWxubW9EdE1jZ2kzeHR3c2RkTERHQ3oy?=
 =?utf-8?B?QTFQeWk3bmZuc1dmZzA3MDNPdnlTdW9LL0lBNmI1NE1pczNUdVZQS1JZdjZJ?=
 =?utf-8?B?WXJ4Ylc0eG1CaG1aMzY3cmlnZ1I3Z3NTV3BhY1huWEcxMExGU1ZBTzZCVDhr?=
 =?utf-8?B?RjdsTzREd2JpWmxSeEdGaTYyVTZTWVpLRjlwd0d3MGtGZlR6Q0Y2U2crZWZQ?=
 =?utf-8?B?cXBiZC9WbTlDZGV6OTNmb3Q1RHlETTdyNC9IQWlsOGN0SlNJZTJMZ0kvL1BB?=
 =?utf-8?B?L09mcXRqT25XUno4ZGRsSldFUHVDNEt0elpQRlk3MW1vZUdrZEpWZmZNNlhq?=
 =?utf-8?B?ampRVGUya1dsNEpQVHYrU1d1MjVPRUVSRGVBa1NqekJramNSK21DQzlsTmRY?=
 =?utf-8?B?SnpuNTNsOWtINXRzZ242cStKQVE2L05HbVhrUmxmQXJ1QjVsTHZLKzRlNDVx?=
 =?utf-8?B?dVhVcitDR1JQMDZBNTZxckE1c2E4VTRYL0tLbEJhUzBBTjQvVU5rdlExUith?=
 =?utf-8?B?NTJjbkZKemY0RjZNMW5rSCtTWVVVUFAvcmZCNVluVVB3bUdOVGNldDZOM3BQ?=
 =?utf-8?B?MVNJbUtwS0JWNFhLNktodkgzR24rRDNqQTFBMStSMG5DZXNzRGVFUm9VTDFZ?=
 =?utf-8?B?d1N3VE1uTTNSRklsWFozMUJmSzBzd1Q5QXFzbkpyajhITEcrSDA2OWljazV4?=
 =?utf-8?B?bGtSTnkvaVdma21tSVdzSjVzTC9OdzlsNjZDUkdKb2c3WTBUSEhDYzlkVzVa?=
 =?utf-8?B?MHpoWHBRNHRyQlphTWpjYndHMU0yWEFUVkJDSVFYRzNoN2gvd1lMdUNRT0JM?=
 =?utf-8?B?MlB5NHBCbkVuU3JOMGQ0d2Z5NzBiK3VsMERMVE5scG81RGdUYjVGQXNyWE91?=
 =?utf-8?B?RkVLMHVSbmVIcG9PWFRkSE1rNFpONVV2WWxqelI3dlFzZXdIQnFhWXpxaGRi?=
 =?utf-8?B?cHJjT3RPVkFHcnRVS2hYLzQ5QlhOSStYV09GaDBkZ05oRDVOczlSSFUzak1S?=
 =?utf-8?B?RVhmZkFDMG1XZzJEeS81aXRRL21jbzc4N2diczhPZWRQMG9TWjlRNFhZZy91?=
 =?utf-8?B?c3kwMnRNN0NNQy9iNS9acmZPRlpFTkRpNW9raVpaVG1aVWcwQjR3d2RsTDJZ?=
 =?utf-8?B?bkNUcVd1NFJ1RWw1cGlDNEQyVTJIM1lMZDlFdG9Uajk1cWl0NVEyZEFsMEd2?=
 =?utf-8?B?RHArUElwTjRPY240TWcrMGlqZjhYeXBpOHVJMTV3dU1QZ3ZtQ2ZHUVFCMGo2?=
 =?utf-8?B?S3NEcTNIWjdFWElERzllRmNxUXdBcXdQOVR4NWhIOVRCVGkxL0lENVpzRkx3?=
 =?utf-8?B?dXhvVzJDMWlEL0pNUVljbnV3a0Y4ZmVMc3B6Wng5cGJQc1RZakdnMFlPdTlN?=
 =?utf-8?B?OXlqS3ZmZWN1elRuZnRvaEt1SFQ5akM0YUtWYkZVbVNnaGx1TTczcnV6N2ti?=
 =?utf-8?B?UmRlWE5xeDY3UiswRGxrZ3oyZ2ZSTGt6eE5ENGdkN3c0bDNsNHFUNHhoOGRR?=
 =?utf-8?B?SVhYVTcya1B5MU9rL1NsZTRIbjVwa0xra3NrNUVDdkl3NnlyVU1VNkdydStF?=
 =?utf-8?B?MmlsdjI2cmdkdkF2L1ExMGt1NEh5MVdaS3l2a250VWU2ek1ZR1owU3NScG9o?=
 =?utf-8?Q?hh9mKSmvUuZhBy1hezdh/zObp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3177b36-bfb1-40bf-38b0-08dd917e7940
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 17:57:34.6157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpPK9x+5nBgbTpgB4tfAfgLCGiNI3bw0NtS7RwPgKMX+K6CowVr8kKEpl9Eq8iKM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7107
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

On 5/12/25 11:14, Tvrtko Ursulin wrote:
> 
> On 12/05/2025 09:19, Christian König wrote:
>> On 5/9/25 17:33, Tvrtko Ursulin wrote:
>>> With the goal of reducing the need for drivers to touch fence->ops, we
>>> add explicit flags for struct dma_fence_array and struct dma_fence_chain
>>> and make the respective helpers (dma_fence_is_array() and
>>> dma_fence_is_chain()) use them.
>>>
>>> This also allows us to remove the exported symbols for the respective
>>> operation tables.
>>
>> That looks like overkill to me. We don't de-reference the ops for the check, instead just the values are compared.
>>
>> Since the array and chain are always build in that should be completely unproblematic for driver unload.
> 
> You are right this is not strictly needed. Idea was just to reduce any access to ops as much as we can and this fell under that scope.
> 
> Another benefit one could perhaps argue is two fewer EXPORT_SYMBOLs, which is perhaps a little bit cleaner design (less exporting of implementation details to the outside), but it is not a super strong argument.


I would rather say that using the symbols improves things. Background is that otherwise every driver could accidentally or because of malicious intend set this flag.

The symbol is not so easily changeable.

Regards,
Christian. 

> 
> If we will not be going for this one then I would be taking 1/13 via drm-intel-gt-next.
> 
> Regards,
> 
> Tvrtko
> 
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> ---
>>>   drivers/dma-buf/dma-fence-array.c | 2 +-
>>>   drivers/dma-buf/dma-fence-chain.c | 2 +-
>>>   include/linux/dma-fence.h         | 9 ++++-----
>>>   3 files changed, 6 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
>>> index 6657d4b30af9..daf444f5d228 100644
>>> --- a/drivers/dma-buf/dma-fence-array.c
>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>> @@ -167,7 +167,6 @@ const struct dma_fence_ops dma_fence_array_ops = {
>>>       .release = dma_fence_array_release,
>>>       .set_deadline = dma_fence_array_set_deadline,
>>>   };
>>> -EXPORT_SYMBOL(dma_fence_array_ops);
>>>     /**
>>>    * dma_fence_array_alloc - Allocate a custom fence array
>>> @@ -207,6 +206,7 @@ void dma_fence_array_init(struct dma_fence_array *array,
>>>       spin_lock_init(&array->lock);
>>>       dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
>>>                  context, seqno);
>>> +    __set_bit(DMA_FENCE_FLAG_ARRAY_BIT, &array->base.flags);
>>>       init_irq_work(&array->work, irq_dma_fence_array_work);
>>>         atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
>>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>>> index a8a90acf4f34..f4abe41fb092 100644
>>> --- a/drivers/dma-buf/dma-fence-chain.c
>>> +++ b/drivers/dma-buf/dma-fence-chain.c
>>> @@ -225,7 +225,6 @@ const struct dma_fence_ops dma_fence_chain_ops = {
>>>       .release = dma_fence_chain_release,
>>>       .set_deadline = dma_fence_chain_set_deadline,
>>>   };
>>> -EXPORT_SYMBOL(dma_fence_chain_ops);
>>>     /**
>>>    * dma_fence_chain_init - initialize a fence chain
>>> @@ -263,6 +262,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>>>         dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
>>>                context, seqno);
>>> +    __set_bit(DMA_FENCE_FLAG_CHAIN_BIT, &chain->base.flags);
>>>         /*
>>>        * Chaining dma_fence_chain container together is only allowed through
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index ac6535716dbe..5bafd0a5f1f1 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -98,6 +98,8 @@ struct dma_fence {
>>>     enum dma_fence_flag_bits {
>>>       DMA_FENCE_FLAG_SEQNO64_BIT,
>>> +    DMA_FENCE_FLAG_ARRAY_BIT,
>>> +    DMA_FENCE_FLAG_CHAIN_BIT,
>>>       DMA_FENCE_FLAG_SIGNALED_BIT,
>>>       DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>>       DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>>> @@ -632,9 +634,6 @@ struct dma_fence *dma_fence_get_stub(void);
>>>   struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp);
>>>   u64 dma_fence_context_alloc(unsigned num);
>>>   -extern const struct dma_fence_ops dma_fence_array_ops;
>>> -extern const struct dma_fence_ops dma_fence_chain_ops;
>>> -
>>>   /**
>>>    * dma_fence_is_array - check if a fence is from the array subclass
>>>    * @fence: the fence to test
>>> @@ -643,7 +642,7 @@ extern const struct dma_fence_ops dma_fence_chain_ops;
>>>    */
>>>   static inline bool dma_fence_is_array(struct dma_fence *fence)
>>>   {
>>> -    return fence->ops == &dma_fence_array_ops;
>>> +    return test_bit(DMA_FENCE_FLAG_ARRAY_BIT, &fence->flags);
>>>   }
>>>     /**
>>> @@ -654,7 +653,7 @@ static inline bool dma_fence_is_array(struct dma_fence *fence)
>>>    */
>>>   static inline bool dma_fence_is_chain(struct dma_fence *fence)
>>>   {
>>> -    return fence->ops == &dma_fence_chain_ops;
>>> +    return test_bit(DMA_FENCE_FLAG_CHAIN_BIT, &fence->flags);
>>>   }
>>>     /**
>>
> 

