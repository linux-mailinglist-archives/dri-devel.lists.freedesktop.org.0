Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C028A1995C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 20:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8144510E1A0;
	Wed, 22 Jan 2025 19:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M4oYtIf8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656C510E74D;
 Wed, 22 Jan 2025 19:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ke85UYJhts6OdEcAqyjnU+2EH1U3BvGDLmBJmXTu5mqXDfuToB2l339BmDsxXNPgPQeuRvyE7zQ5VW0pgeTU5JzHmrPxedHfa+K6qIA5eScxI88C/O0vltHGyMJjs7ALSgrTCTQ5UKOQ+Bz3kNppaT5UOoo9Y5gwt2KMzXFL1b90RzHrVHrP9hMp1c3x2CC0UlJB8quya59M1A4ymzs1yW7Ii/a8lT95iLAmSBs1+ppDtyGpVP3adfqCe8aHpTqfapK7rac/vgbEmOaTA8HVKigk9Esm4zbNay0ReC1LXujPu5HIdxxvmK+xabZxBe4asTnmVm9mplG7vLXRX/fs7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbra9PCssMVeAsLZaNgsVz4gUiiwOdDwQlAbCdxwf04=;
 b=CEOLlxzfY9avKiG1ji5MCpRamvn1wMniVogrqNZJKZxve3NBwFsiHSvvaRTvu6VFWnVA0z3zScs3wU+hD5VLBuMPROPZdAln5Ue+3BpnqeDyjNmWRFLMrzZmZc8B1tFy7+nTiPqWuuQW4uf6l9nLA4a/sycRYPKkLp75jivozboaj8Dp/DA9Z/B4tWdXolHjUZpUuWKDd74FRQbnWFJ+zG8jMAxaFlasrRs3t9FSoIC/b9lrJL0lmhHJ7G5Z+9RjiwBPMAgu1GeyJbwtM6qzdb200oDRM8GDvTucECYf4aRX6BCcu/S2Jieini++L1ivQhlFUULsY51ttiDE9QXARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbra9PCssMVeAsLZaNgsVz4gUiiwOdDwQlAbCdxwf04=;
 b=M4oYtIf8ELPbZea223mfda7ZgZWsw/u3C/jmlbF5usDRYpWmDimtixokMhPg7a8jbC7/bLi2jLulYSVIYj38yMVj9wkOfVrgyj4JZTu5Ce/OakICWLRU+I1Q+Bq7YprGF+7h4J0SGkifnngNZKWxesULJmB0gJqc11qSZDk4Uso=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA3PR12MB8047.namprd12.prod.outlook.com (2603:10b6:806:31b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 19:48:09 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 19:48:09 +0000
Message-ID: <d4920377-eb29-447c-97c7-be14f3484e57@amd.com>
Date: Wed, 22 Jan 2025 14:48:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 13/45] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
To: Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-14-alex.hung@amd.com>
 <AJXss1OmMMC2tqJmFXzUC-YCESFw4ncGj-sEh-B1LuuDnPL-0hOQ3kSSM5DtkYvFv8bHRpMxguAInlYiw8AdkstU_jZVp0ly_EGq0P_m37M=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <AJXss1OmMMC2tqJmFXzUC-YCESFw4ncGj-sEh-B1LuuDnPL-0hOQ3kSSM5DtkYvFv8bHRpMxguAInlYiw8AdkstU_jZVp0ly_EGq0P_m37M=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0209.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::9) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA3PR12MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a923a5-ad39-462c-07a4-08dd3b1db2c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzVFcFAxOTZvNTh6dVNVK3FkQlF2UkNRb2Y1NTFUSmh2Q09SUDUrb09PQnhk?=
 =?utf-8?B?cEQwNnV3WFNYY0QvRHhaa2tNeUFuQVIxLzZiOFMvcmVkZ1ZCb2grcXllc0lp?=
 =?utf-8?B?NG5Zc2c2YjdEYVpsTDdNQkhpb0ZGQW1QaEI0SC9JMFJtTWR2eFRvL2ltRHI3?=
 =?utf-8?B?YWY5anZEQVh3QXRCLzhZaTJncFpWajdCM0JwbkFHTXBmcFkrWXV1eE1oRVdR?=
 =?utf-8?B?b3NJMUtuSnQyZ2wyeTBveEdhSXVaZTZQbHdENFZoUjQ3TTFNOGpFZm5yU1lM?=
 =?utf-8?B?ZzRNbE1QblA4M3o0bis5Yyt0cXFlQTdEeDhXbzl1aitrN1hvUmtmUTAyN3ZO?=
 =?utf-8?B?S0dkOFpKbjNmN3pWU2tkN05Hc20yQ0RsK2twYUFtLzJkSkhiL29vcEVEa0Jo?=
 =?utf-8?B?UVh2TDZDb3pmd0xBQTNwM2w2bSt4ekZSa3Rkb2k5N0FxZ1hlQlVnckFYT1Fj?=
 =?utf-8?B?MGEzOEgvWm1XY1cyUCtnYUsxMWNib2lQdGRLdTZWMFZieW1pbENPT1gyZ2du?=
 =?utf-8?B?Z1MvTTBtNWpHUnZST2l6MTBYUVpMRUxhUE1ETDNiL0lNOWxsMFE0THFlWnY2?=
 =?utf-8?B?WEo2b3FFa0pXZzZWc3dmRTFLM0tQRUJuSi9QUlhBNGRhNFZZSGpwZThuYXk5?=
 =?utf-8?B?MFpPUFh5cUh3WFlxSzc3OG9UOWNLandEZEd6M0JBb0szZ0d1eGJ6RDV2Q2I2?=
 =?utf-8?B?Y3duNGhFUG14REsvR1B3Um5JV1phNGFTK1BBSTh5bXhjdVIwRUVNb29yV0V4?=
 =?utf-8?B?Zkt4bDJIMzR1RW9vb1F6a05tN1BndVMyczlnRDNwQjY1ZS90eUZDRXlOT2t5?=
 =?utf-8?B?VFBzdVRnMGhRa3ZNOXF3MGNod24zMjlhbCtGeVlRQUFaQUttUTgrSGtCS1NL?=
 =?utf-8?B?dUszVmF0d2lqZHA5akJpK2NaVnUyeDQ0aXRyeEN6LzFmUmRPL1ppUE5uUEM1?=
 =?utf-8?B?N1EvZUMwM09NWFp4dFZsQjZvdmVWMlUvRXo5SmkxVXdYUEh3YjI0Q2lGV3lp?=
 =?utf-8?B?T1NaZU9rMnJqMXZDNkFLLzdNQkQ5SEY2Z2RrREdMek1mc1pUbE9zbXNRM1pT?=
 =?utf-8?B?SVJxc0tUR3pGSVpiVkhUTWQ1ajNWRENqc3FjZCs4aFJMUXUwWjZMNHNuTHds?=
 =?utf-8?B?dU1pNlNQTUl2K0tmaC8rWWZNSnBGMnRRRFlsS1dxU0dGY3hBMU1VOXE2aTIv?=
 =?utf-8?B?Q2xWZ1NEd3JlYzFDMjJLd1pTeTVrMmJ5elRVN09zNm13alhZdnRzSTEycVBG?=
 =?utf-8?B?VDJ1Y2xVS1FuKzRpRlNpRXVnbGgwYU81ZStjSGpveUk3bDl6MnRRQ28rQ0x2?=
 =?utf-8?B?a1lBTGJ3d2RNYS9zcTZrRkM3TFJpaUpoUFlDUEJueVNhWEFPSlkrWk4wWjRT?=
 =?utf-8?B?eEtNaTNsazBreDhKVjdpRk1yQzgyeGJWK3Yydi9uRzBPYXcvYUZHRGVtNVYy?=
 =?utf-8?B?SzNOaUYzQ28yM21Zb20xNUMzMk1HbkVUNUpWaU1xbVJuNGFrUkI5UzY0aFcx?=
 =?utf-8?B?RUN2L0V6VVEzR3YxRTZueVc2QVBxck4wNkFBWkNGRGFyUEVvVUZ1QjQ2Ris4?=
 =?utf-8?B?WlI1amRVaWNSSnBzMlBRRkNXOTd1Mmg3THk1QllPTXJaYWQxamRHMkx5a014?=
 =?utf-8?B?eTZwaXZBUDlBOWNkdWh2YTNGeGNtUmN6Zm1ZZGVLZ0YwMVU3R05LWU1RN1pL?=
 =?utf-8?B?WEJnWExRN1VCajEvcVlQc2haLzVXZ2JoTlh6QTBTWGE1djViTVJOMTBYSmk1?=
 =?utf-8?B?cnZPN3N3UWlybWE3WVNNUXMxSzdCL3NKelFTUVVKcHVZTTFscnRvdkp6V2Y4?=
 =?utf-8?B?M0ozVXVpR0V4ODRublQ2UHFNQTVJWCs3SWFyZko3a1VuSWEyZVVBSUlPM0dX?=
 =?utf-8?Q?P0vJ0qD9fnO5t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vmk2a1E3NzhkeVN2azJxQ2pOVlp1UExYQnVlNWc5eHJwYzFTcTE0dU5ORjVs?=
 =?utf-8?B?UEttcm5OSEVoVXJXeVBKY21iR3VGT1A0eEVaTEluUlVhdjRDdjNUTEpET2V5?=
 =?utf-8?B?MCtoYWdDWGpnR04vNjAvQURxNEpTV0VxT2tjRGRaeTJLQU5Ba2RwQmVvaDFU?=
 =?utf-8?B?elhZNXFoeEFDVWZ1bnUyUXcvY2NjS1AyRUlwRmFLUU4wdTVnRG9zai9kWGRM?=
 =?utf-8?B?RGs1eWxTNmszMUJCbXpWUDhxVW5IZHVpODNYbXhUd3NtSXU3WFNGVU9ycTVG?=
 =?utf-8?B?QVA0L0ZZMG9ob0RwMHF3TUFOLzJJSUFvQ1FWekNpeFUrd3ZEMlVMSWpxZjJq?=
 =?utf-8?B?bk1OLzJCaFMxZkRUdC96UDdURFc5dXFpNE1jaWxPR29VNFZWU1JFTHVuZitw?=
 =?utf-8?B?ZmNQczRYZlhYczg0bXBHRFZJNVpVZjJsSVhveFAxSW9RbE5YTWVETFNaWTk2?=
 =?utf-8?B?bFE0b1IwR3NOeGd1UGhrS2VlTTgxY3NoM1E0TFNzcDllK0YwcTlaQkJjazZ5?=
 =?utf-8?B?UE4xN0xkZ1hJRTBRaHF1TW5laUZsQkNvMmJoVnhSTkRtZk4zZCtBRWRQZUVp?=
 =?utf-8?B?bHVEMUJOdDVNdXFCTHJFUXo2U2gwTVZ3R2ljOVNQaU1CVXJWMndFMXZYeHli?=
 =?utf-8?B?dHRESFU2VE91eTVwUWtuYmlmMXgrZ1NlRHB5eDhRVXNSY2ZxNU9QZEsxamZR?=
 =?utf-8?B?dS91NzZyRzhhUTdVb2s2dlpOUTJuTkxxaE5JSVl2Y25CUWQrSlErVFdzaHIw?=
 =?utf-8?B?RW53MVhGVS9uMFlmbVFqb05UamozY3k2c1RIZXdxMW5TOUR1aGpPc2Q2M09X?=
 =?utf-8?B?bVlxZFpYNHpwb2xZeTdLcnZheWM4L2VvMCt3ellFQm9rYkVtUGVQYi9NbWtV?=
 =?utf-8?B?ZjdjblZiQm1VUVZaK2o3alpkTXcwT1l1dFdrb3MrNVVBZTRVUDJ4WEJ5aTVp?=
 =?utf-8?B?aHlMRmxoR0pZdmJTOEVnMzczRUNjVnFrUTBpRFVZRmtVVzRzVnQxV20zRHlR?=
 =?utf-8?B?eENHbFl0aHhGbFA4eUM4b1M4NC9DN0JFdnB1dm1FTS9sekFBdXpyclJXeXR4?=
 =?utf-8?B?SnVQTVIrczZteXJnSllIWmZISGYvSjA4TDVYQUFQbnQ2ZFBkZDhqMzgwZFFC?=
 =?utf-8?B?UmcwWmZtMXdoaE5vUzJVRmt0WTRKY2xaYnZhTG9mRzRZMC9MZzA5OWE2Qk5Z?=
 =?utf-8?B?aDQrUUZTWUNHNzFOTGdHZzczNW9aL2c3blREMFR4OVJXS0xhczdFYi82QUFN?=
 =?utf-8?B?MVhUOW5UZ3RSb1Q0eSt1MkJ5SnFjMmFEb00vMzJ1WTUrQU9VNitBd3N3QlRn?=
 =?utf-8?B?WTArRjB6cUsrVnIzbjZncHR6eEUzVXR5Vzk0R1BFWDBPSkFEZVlZVkVWN0Zm?=
 =?utf-8?B?N3J1VjVRYkxkTGh4ZlJ0MWtvNzMrOWlsSkM1S1VLWnJuUWZ2eS9YN0x1dk1R?=
 =?utf-8?B?MVJwdlVWbHhnT2VGMysxWkhpMUVFV09HdkN1MFhpUEIyUmhDMmcyMi9DSEcr?=
 =?utf-8?B?Q1NYN3Z2cWlnbTJ2VmtNNHh6ZE5hTCtzUTB5STFScERtUndHbXhyVVptZzJX?=
 =?utf-8?B?a3dnZ3NXalVENGpQWmlZT2NKWTFaQUZYMWs4Tit1cTlsWWZsWlQwTTRYWEpE?=
 =?utf-8?B?MjB3dzBFT0ZQQlVtanZCZDlTWGVSaitsNDd2Qnp2S0Uzbm4wbytkczExTktr?=
 =?utf-8?B?amJ3T216MGd6RHdVb1NuZitYRGR5TTFoaE9UVWVCckpBd3pvL0JORXBKMDk1?=
 =?utf-8?B?cHFWelpxNDBzYng4dVBDSUNBYVFGcFIvNzFWa0RhS3J2SGo4R3dSZ1dSa3lk?=
 =?utf-8?B?aVhxZ2dDZVpwUTI5WW9ZNUdHeVJyemdNYTlvdUd3L3JGdUdHbVVHam5tWEFE?=
 =?utf-8?B?TTFvZXl2eFR4eGpJaGI5d0xndDBuTzlPOXZKa01vZzF1MEEvRkdnVkxwb0ZH?=
 =?utf-8?B?VzdNZEhyS3ZmeVYyOXQ5anhrdk5INzE5S09JOVhPVitEWjV2akhIZG80Q3NJ?=
 =?utf-8?B?Ry9XYkRJNkplcjN6dkZwdXhnTWhya1lkUW5CMEFUMmJvOHJFcHh5dDkweGcv?=
 =?utf-8?B?R08wcWpMU0kyWG1udk8rTUdZcUtEaVNoY09NcHBsa1Q0S3Z4QU5sNFRSRXNa?=
 =?utf-8?Q?DbDtGzDlGjwEo+S4dWvKj/GY0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a923a5-ad39-462c-07a4-08dd3b1db2c8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 19:48:09.8191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQ04Fe9jz/JxgqWWtt7qZc2PAMF22AwugSOnyXrjRooYfm0T+eQk2aqwShosprxWWSaIuzndwu8d0MBa3ayYfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8047
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



On 2025-01-13 13:23, Simon Ser wrote:
>> v4:
>>  - Don't block setting of COLOR_RANGE and COLOR_ENCODING
>>    when client cap is set
> 
> Can you remind me why these should not be blocked?
> 

I initially blocked setting these when the client cap was set
but that caused some IGT tests to blow up and then laziness
won out.

I had another stab at it and it looks pretty simple to fix
IGT. Will prep an update that blocks setting these when the
cap is set.

Harry

> We should also add doc comments in the color_range and color_encoding fields,
> to document that drivers should ignore these fields when the cap is set.

