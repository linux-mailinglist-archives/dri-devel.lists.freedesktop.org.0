Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BCSJ/RUjGnblAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:07:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519D612328F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9884710E365;
	Wed, 11 Feb 2026 10:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GLrXiD44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC3810E364;
 Wed, 11 Feb 2026 10:07:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVQ5id2N68m/g1s9gRl1TX1MoOLWwpuGNOzDjCgrgYF82J3mw587jHMYQ20a2H1GzC27bYzAuBtRN3tvecVVvJK3i1yAGiFbd11U+yYfKOEBEHhf6FvhdGrVwKgd3zWeIbLsGJqTWcE4CZW1rVBDJpWiWc6LvLunLH2wEy0WEyrMpa+imMmKbunX6eQGB7QtE7k7t2eMyayi/ftn5f7XbPYqdTF7EgPwz+rFXCyo9Vt6tzQlOvfoOyZ7o/3JqOcR6i9RzpCj7nTpDQ6hjozgE80RLgllCST5GsRo+zs5nJ+Nlc030MhnAxdItIqquFcv5hfL7/WEGkWjIL3SCd/YXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s083mQNosz8JAZcftM85egoIBwVZJafkrAo5qqodL8U=;
 b=YY/41fCneU5yR/4ywm0G5Mw3OGJo4dCjxIsT6Ruf+pbjsvQUWyPDwTKRjF7fXNOyZKhI3qsZV1mivQjouiNudL6sxShVIe10I85GrD8BgtTaEVYzg5T3/pa/CSnImIt8Tb7wbAMKSv+xaQa5lfye8zdWhMmRchWiBwTH2+lJU/Hz2/5DTa61HgxZCL46SKd78PQFQeZT5b9fyXk2nfQtzVdx26p3N/mr0sNezVUIxYqOgpZlxXlncadHINNhEd+Y35E2G1BkpQ5GDGGtUyDaKQt0d7J2SmOkyE71qXKNDeSYGEH8+G1qFGkundiOgbcY5B99UqWpPFOy9LVP6uUDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s083mQNosz8JAZcftM85egoIBwVZJafkrAo5qqodL8U=;
 b=GLrXiD44plbg1Dob2RoGUokhQ2cLJAT6HZUwTEuvg23kVmij4BU0SC5wChYFb5c67ASP62lm0g8Iy5UGNoLT/sywVk1+393p+t0ruAl72IEJPG/8x/9rcK3s6cq1PD6e2ceS8WNKE9A6MzTsbn3co+3U/D36sOcBriaK7PZiOwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6874.namprd12.prod.outlook.com (2603:10b6:303:20b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 10:07:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 10:07:41 +0000
Message-ID: <7a1fa826-cddc-4f8d-ae45-afe6ddecd6e0@amd.com>
Date: Wed, 11 Feb 2026 11:07:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: add module param to disable immediate
 vblank off
To: Michele Palazzi <sysdadmin@m1k.cloud>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com, Rodrigo.Siqueira@igalia.com, alex.hung@amd.com,
 aurabindo.pillai@amd.com
References: <20260211074529.131290-1-sysdadmin@m1k.cloud>
 <2026021146-mockup-pushup-5f47@gregkh>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2026021146-mockup-pushup-5f47@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e165d6b-8915-49f9-239c-08de69556485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFVZK0czaDJVZVZ3VmZ4NU9ET0REbjN1WFBndE5oT293NWhlNk9Ja0lxU0hy?=
 =?utf-8?B?TStvdmZqVXBKcEYzbHVVZ3VPQjVEWmlWL0VLeDVUR3ZoTWhKQk1jMnhZUk5j?=
 =?utf-8?B?N2pnWTlGaDRRRndpTXpZT0JOQ1hISnAwU0dHRXNGRHYrUzhrc2R5TmRUcUhy?=
 =?utf-8?B?OEVNYm9ocEZ6WnNZU3VGVUJiYkFrSkQ3SDBVSkhDazhGWEJjOFJaN0g3RGpr?=
 =?utf-8?B?VFZ3QkNaVlZkaW9KWHlYYU9Ua291RS9VdHdFNGU1NW9odTNxeVZCWnk4QTRj?=
 =?utf-8?B?alJmQXF0Rk9IVzlyMDBQME9kWER0RSt1YWszRFQra2JvSHVuTzd2cWNLWktr?=
 =?utf-8?B?Tk14RWplNjE0VVNTaTRRbTBNNkpqeDFBelBIYkxtQUx1NnIzNTBmQU5XVkxS?=
 =?utf-8?B?SExQb2c1bTVuYmJjNllTc2FwRElDRk90YUt3Q3paWUJCVEJTbFlWYk90eHF6?=
 =?utf-8?B?eFB0bFVlR2tnWVlURno0TDNIVHVOWGxWM3lUUldhZERsZ3RZM3dvL1dkSk16?=
 =?utf-8?B?Vm1xa0RMcTdNWXpLMzlKRVpOMjlKZFJwVU55aXRRbGUvT3lkTVdySFhEY241?=
 =?utf-8?B?MWtFUlZmYng4MXgzNE1rdkFmZXlXQlJCWkU5WUUwWnNOLzRXUlBRTTRzNlR0?=
 =?utf-8?B?M1hMQnRWZlhQdDNoYTYvOUNLUHMrSVgvMGpnc2JYNlRZVDBPNnNUeFFKYXlu?=
 =?utf-8?B?eExaaTJwR2h3aHBEb21SN3k5V2pubk8yeldLWFphV0VxT2NuQ3lFQ1M2UEM5?=
 =?utf-8?B?aFF1aE5FdlozZkltUW54VUNnV3JNZmdZT2lxYlp1cHdmekxuZ2JsaEhTSXdQ?=
 =?utf-8?B?QVhvdEQ1YnROTitienFtLzVxd3VaemhRa0tSMzNhV1V2cUx2dGdOSTkzTVpV?=
 =?utf-8?B?Tmh3dFlPMFNvVEVrUnNtdEpzd3h4MURLQXlhVlAybzJqQitnVGlCeGYwL0lU?=
 =?utf-8?B?YnZGTTBJYlpwODJJSXk0MVFiTkFKc3B4SkY4cHQvd0U4eEFpQ3JWUjRPZS94?=
 =?utf-8?B?K1p6WFZCMU0yVHNFZGFJd3d1OTA3Sy9qUzdpZWF0QnR2SVkzWWFraGN5TTJC?=
 =?utf-8?B?U0UvamlaSkhtR21ldW03WVpQS2RPU3ZBd1QrSjVJazVsdGpNb0ZSSjVReFZS?=
 =?utf-8?B?eW5QS2pjRE4wY1VlRVRGcjMvZVZJbHVoUFEwclVKRmNFTm5HVWxCOGRRRHVO?=
 =?utf-8?B?bG11VlowQnEvY0tlbGdPa3plczJmSzlEaERKN3BnWDE0cHRBallUeW5VTWNZ?=
 =?utf-8?B?d3FYTHhSSFNXcXRlMzlQSzVaQ3Vub2d4OU1NTWsxME9rWGVicERBcHl2Y0g4?=
 =?utf-8?B?SzF6S21oYTJ0SEpnR1ZMMnJud3ovQ0ZCcU10bnZvK0hQbTQrVXJvVit0Y2x0?=
 =?utf-8?B?RXRnQm5aVFVGU1RodUkzdFdMdU5JdjVtUU9lcGdjZVRmODVmQkliTFgybjBx?=
 =?utf-8?B?M2V0cWc0NGN2Z05oTjh4LzE1Q2VGL1lGcXlZcWF5Rjc4SGVQaHMwam9ad2Qz?=
 =?utf-8?B?TjhYSUdOaldmWUh3a3BNcnhCdElwV3BxeTZneXZsZmVRTGpZU29yNGxmZ05Q?=
 =?utf-8?B?SENIdzlMOHVpUERTSUZSREFma0RYVHRTSmNZWTJJUk96M3RRbnJCNWY4Nytm?=
 =?utf-8?B?UEpuK1p6U2h3Q2tCRnNzd2RSWFlOek1veHZYSXViNDlGR0NRMTRiNVZRbFBB?=
 =?utf-8?B?Tk9XOVQ2Y0JCOGlURmlEdGZwc25idVBNQTZIS1B0TG54YUZ0Y3Mvc210ei93?=
 =?utf-8?B?eURISWpQazlrQmZOeDdVQmQ3dlIrNVRGRUVvQ1Z0bDlnOUpoUWNRSytaZ2s1?=
 =?utf-8?B?SmgwbFJpNWdOL1JTQTZQOGJ5aWptQjhabDFSMkpIRkFvNndNeXBnNW9RMUpQ?=
 =?utf-8?B?Z2FTY0EvemlFdTczVjRSTkhmNFI4RmQxaUJiNTFRR3YvTkkvcjFpZzVjRW9J?=
 =?utf-8?B?NmlpTkxlYWt6WDI0VVFpa1FIS1NqOGREUnJJaUFzRjhIZlNwVit1ZGJHRGli?=
 =?utf-8?B?ZXVaTzJqL0pxdWUwMitKU1FRcG1RRG1ZL0EweG4ybzRKUGM5VFRud1RXdmYv?=
 =?utf-8?B?bDF0WUxxZ201dDRpdG9JVWNkaThpL1RHUXVOQ2U2VmU3VzF2ZXVSSkNxVzMr?=
 =?utf-8?Q?euGw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzRxeDJTODQ5REVsaGJWb01YRzNwK2g5T3FXVnhCR0pIaGJCcW1OWXdrekxH?=
 =?utf-8?B?cXAzYkxISzZCTDNYNmRVVnk5NFdnTlZDZlVSc3RsRDJxWjhFZjFLS1BLQ3Jz?=
 =?utf-8?B?dVZSMC9jemUweDNtVTBFbjJhY0kzTEI2cC9aM21qdGZhU1FJVUo5TzB3NERT?=
 =?utf-8?B?WmpBTC90NzllSUF4Q3pKVThvM1g1K3FlM3ZDclZ6UUkzYkhIamh4WnZrS2U2?=
 =?utf-8?B?NUJpM3h0RXQ2WU1TSkFKWVJrUnFkczJqNDZJSnVtdmZBUG8wZkZBOFdHTTJn?=
 =?utf-8?B?Zm9PbFQ1RC9IZE9TVXRRcTI1Wi9SeFRGSTh2dTVJWjNVaGhla1VEamluSUFX?=
 =?utf-8?B?bXR3T25NZjNldEs4OExvSFFUc0NnSG9ub2tpeUxSQW01NStoekkyWWw3SkRz?=
 =?utf-8?B?MHBzMVBvS3lVb1FVdFN1MnFVUXlXMGJtTTF5cERDRFZDV09vZHpPMnhvZ2FR?=
 =?utf-8?B?a2JtNXl0S0lOMjdmaWpQaHY2cXRjdnlKZCtld05vMnRHK283UmtWRkoxZUI5?=
 =?utf-8?B?V2IwNkdjYWRwT0lvTkEya2JvaG5oVWhWZFJ4Y3oyZlczMHRxNW05MFNvdWti?=
 =?utf-8?B?MDhheFZKS08rZkkvdGMrdXVjUnNuWHpldy9vT294SUdRQjE0RTFHd01TWno4?=
 =?utf-8?B?aDNROFJFRDJJalI0ekdqSnllRzFzRDIwMGNCUUhKS3VqKzlPVFBmNkN3bTZZ?=
 =?utf-8?B?alZHOUNvNGlOdTZEUkFlNm1KTjF4V3hWZzlYR2ljZUFBTkNBYkdjSUNudWFz?=
 =?utf-8?B?L3lyQ0EzL3NLazhZQ0dvTjJvVjZkZDRJMGx4VUZxclVIemxOZGMybkx2THJR?=
 =?utf-8?B?REk5OXZTVTFLZmoyQlcwc0pSU25mYi9qRUxBSzY1cVYxcUNlNFJaK0RVNld4?=
 =?utf-8?B?Yk4yelBwQkdGSHZ5dlhLM0t1aFJVbmtPdWxrSWJ3WmYvZ3Y1dVhsRGErbzBz?=
 =?utf-8?B?SG12ZHV0YXdPNWtZVmhtWktoNXdML3VrSG15TlhCTlBURGdSQ2I4a3pESVJN?=
 =?utf-8?B?RHdweU4vUGtTZVJMc21OZlBqeDRRK2RORDZ3OUd2Ukc3ajVncys3UDRKUlhv?=
 =?utf-8?B?VlVSWWwwd2Qwa1ZiOTBGNTdWdHhzK2ZJRC8zdTNrSDluS1VxSk9BTmMyMnFh?=
 =?utf-8?B?amtzNzAyVVMyT1M3SjdHS0lkODhTeUQyTGdiQnpBS3BBYmtMM2lnaVlKc20z?=
 =?utf-8?B?d091a1Y1ZWh6M05SS0dPUU52bjB5MlhhNENrdU9JYmRsQjhvNlZRTURHT2NN?=
 =?utf-8?B?YkpIT1BiZEhiR1NreEthOUlqWHBoS29FMzQyenNnUTkvbnVaSW9oSWlqTnJW?=
 =?utf-8?B?QmxwN2ttQzFZbS9hQjNWb1lPcEw3M2Z6Z09DL1gwUU5NU3RJSGxrMTJrNkFj?=
 =?utf-8?B?Nk1pOURCRTlJRi9scWhXQzgzL1ViK2s4TnYrZHlHUTk5NjN6TDJxeHFIVUtM?=
 =?utf-8?B?MDdRR0dFTmk4NDhQemwyMjAwbzJ2Y2lyOUdVWFhtcmlWWjYvRitxazhSQVhn?=
 =?utf-8?B?ZDQ3MGV4Qk9XeHBNUS9QSUQ5VGhtSkJ0bjFpbVJWNVBCNGswV3M2bnZDMjdO?=
 =?utf-8?B?K2NXZ0xZOXdPOHdHWHhuam9lRklYcEthQzh0RlpQdVlFWXZxNFBtQTZTdXlz?=
 =?utf-8?B?bTFXR3l1dC9GZlNaMlhFT2tRaHpDNDducm85VVczZTRVRmVoL3cybTNoeXlP?=
 =?utf-8?B?YzRTTkZYbFZxZmxPMWtSWkFjTkJYTE9KQ2FscWJoRnhnWVFtYjZhY1JralpG?=
 =?utf-8?B?UmpGVzBiQ09yYkFyUVB0UDFLclpQaERQR29zU3RTS3dxZVBqOHgyamx5QjBr?=
 =?utf-8?B?M0ZTcml2Um9lVUYyR3F0cERDTlJRMjYwL3NaK1llNzIyU2Y0Z2hDekRRWmNH?=
 =?utf-8?B?aU5CSGM3WGhBMGlqZXo4MmJJRVExcHhRYnQweG1QdFZxZ084NHpVbjM1RnNk?=
 =?utf-8?B?OGFQc2wyZXl5cm9uU3pGVmtsTDUvY3hWcXljUHRrdEJ5eS9OWE5LeGI5VTND?=
 =?utf-8?B?RVlDTmIyRmRlMXRhazJrYjJ1RlJFNGNWblhkQUFaS2VWWmIzeDlVVUZFcTJ2?=
 =?utf-8?B?UU8vaVZVRVhhdGtyV09IV2hpeFBLK3J5VGpoekhBaXQ2YXBWVkgvRTJidkRT?=
 =?utf-8?B?RWlKcEhzdTVBZVUvYi9tMGxUYVExelRlNDRhVlpJV0xqOTljbGZ2VTdsdGpP?=
 =?utf-8?B?T3BVeHRwbGFwTEpYVk9LVUcybzgweW5Sd2hEaC9WOFBySkZkclYyZitwc1gz?=
 =?utf-8?B?cm1NK2F4L1JOS0ZzSXdmdHZHZTgzVEszejJXcE1MeE53bDJkMG84RlNkRzVs?=
 =?utf-8?Q?+nFdROLu6zQ6b1pJwa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e165d6b-8915-49f9-239c-08de69556485
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:07:41.6180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpA4TsX9EuUP94xqaLZeldi3c6q1P7pgRp1ubb2OqDg/JGGRaluzKtWKwNHihNr+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6874
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 519D612328F
X-Rspamd-Action: no action

Dropping stable, putting Grep on BCC.

On 2/11/26 10:19, Greg KH wrote:
> On Wed, Feb 11, 2026 at 08:45:29AM +0100, Michele Palazzi wrote:
>> Add amdgpu.no_vblank_immediate parameter to optionally disable the
>> immediate vblank disable path on DCN35+ non-PSR CRTCs. When set to 1,
>> a 2-frame offdelay is used instead, matching the behavior used for
>> older hardware and DGPUs.
> 
> Please no more module parameters, this is not the 1990's with only one
> one device in the system.  Please fix this the proper way.

I just wanted to write the same.

We can of course implement something in DAL/DC, but clearly not behind a module parameter.

Or is there any other negative consequence except for that the display blanking is delayed by ~40ms?

Regards,
Christian.

> Also, this isn't the correct way to submit patches to stable.
> 
> thanks,
> 
> greg k-h

