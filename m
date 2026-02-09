Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHPyCKfYiWlUCQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:52:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7010F1F0
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBD110E3D9;
	Mon,  9 Feb 2026 12:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C9zlat40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012057.outbound.protection.outlook.com [52.101.53.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E3710E3D8;
 Mon,  9 Feb 2026 12:52:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUyDJb+Uwy6nClza5aSTsmwrn7Ob7qX0DzsgnI0Cu+jWlmexcQaiuG5wcN5sTFZYojb/DhCErGLR32msPZuhImu/U+uVT0DdPU9mW8VCRLo5xR2+lOyQONq5xXTqPXgpOIwdSvpM4/qigBSCZUg70MKIFXCvBFyiCUNesfxPx3EFC6TWlQnbyZUm1PZOJoZk/FmWygECaXTEheL+1mInBHjRRFvYGv0fEfWr5WV5yl+hLF41ctjycwT/Webx6uFBSxVjcXcG/Y0rte2PyY89/OFJhDxf7Mxq+N4WSPpc77YZufLEu9+Dk8CD71JflbFCr/LarBpMok2PVDuIkBnh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gylIh0ThrPomTno+oK31UbEUB5IcngTLokLxEV75vY4=;
 b=yz5iYJk/mvPHgrCO97JlMwaifH8Q1HIw6zv1tZ5KEJY8uCFbMxmWJaKNon+tUNU5spVyXQ2i1CQo0TgneT/mRCt13pBQw7UIqLsHph2FJkY14zE++FX6fkLB3fPq9+D44oNilepSccFXXEwviivjLibkHzuHvDWVnR36ts8IB+mqE/frG+L0D3E9VnvmPipXvISICiPAdsikm2Pe5Xtb/MVjsCc0qmT6Gr0zhRUYWAevMEDHvR2GwG7Z6Wh9bMvErOrTjJa7uQr7HCFINJBEyzzQi0Yo4LAeBHs40Dke3Azja8vXMeS4qHaN7sadFXRL1vt7xyQNAS/C/5jJycFvag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gylIh0ThrPomTno+oK31UbEUB5IcngTLokLxEV75vY4=;
 b=C9zlat40kv687Bybnsavh6ht3BT/DHwhhlLtrcwymB6k7jzCv41BVTfyOwoM41lXighJsyT4l6s1J33kG8GMLC+uAtxN7QKglVRqZtyIOmhBytZRSjr9SA6AH+svi6HjtKxk3KXPadPa+zqlWrOAjWClxz5/MqGdxOFvvhJgcrc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 12:52:46 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 12:52:46 +0000
Message-ID: <38264429-a256-4c2f-bcfd-8a021d9603b2@amd.com>
Date: Mon, 9 Feb 2026 20:52:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm/amdkfd: Add batch userptr allocation support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Felix.Kuehling@amd.com, Philip.Yang@amd.com, Ray.Huang@amd.com,
 alexander.deucher@amd.com, dmitry.osipenko@collabora.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org
References: <20260206062557.3718801-1-honglei1.huang@amd.com>
 <da75eadd-865e-41fe-a86b-ed9d9aa45e5a@amd.com>
 <8ba8e4f2-89f2-4968-a291-e36e6fc8ab9b@amd.com>
 <f296a928-1ef6-4201-9326-eab43da79a84@amd.com>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <f296a928-1ef6-4201-9326-eab43da79a84@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU0P306CA0060.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::7) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b710d43-dd76-4a28-5e60-08de67da1f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlRqVEVzcnBIMUNDTmU4TzR6WlNqZkIzNE9Zdkk2djJ5YWU3aDZRZnJZMzB1?=
 =?utf-8?B?bnZuMG5hWVRoTmdxa3l6U0l3d3ZoaTljalBWczFrNXhwRU9RakdsOVF2aDdO?=
 =?utf-8?B?R1RSSUJGUmgrMEFWa2NQNVA3N2J3am1NVUVuNTdmVWh5MUxHYU1tM2FwOHIx?=
 =?utf-8?B?SkxlZXRWc2pnU05UdGtmRE5uNzZOdVFRWFo2WHhoU2JYM25kRXZiY1Y3LzM5?=
 =?utf-8?B?R3dEdEF1ekZGTEFQc3NNdldJME9DUXJ3c09LR2ozUi9jNGJ3RllEak41cDRZ?=
 =?utf-8?B?cXRZVFBnN2FvcTVUVkRPaUNlVkZPQmFRNHE0czF2WDBDdjE4Snd5SVVDbEdZ?=
 =?utf-8?B?cUtJdEtxVnBYREFQc2JrL3lrRVFpMUxBSk1NSFh3M0o1UVZLUjBJMjZ1TWZy?=
 =?utf-8?B?Qk9FUWJreXMyWWN6aUNJZGhlQ0hyN0kwcElpNEFlQVROU3E0YnY5MEQrZzhY?=
 =?utf-8?B?aW1rRk9ZcWo5dnFDWThVWU9CMzkrZnZDSTEvcHJWSCsvYkNXd3VwZE8yRjRI?=
 =?utf-8?B?Y2pvVmEwRnJqTHVFNGhVSkFnQ0NDT2k3a2F6RmVaVk5QOFF4UU5sZ2RaOE1k?=
 =?utf-8?B?L2VVVTVZQUd2MXJoWURUM2xqZGhxM2J0aG9xUngyUExXR3JoME5rRC9RbjlJ?=
 =?utf-8?B?cXB3VFJKL01lTE9OYjNMMXlYVlgyWWQ0MG0zN1hKZ2RhcWQwRDF0WTNaVEpE?=
 =?utf-8?B?MFVpMmRlM3V3MXNDbnZoYUZhaFE1eEpLZFg2a0ZQSFpEelM4K1Z0SUFFN0RT?=
 =?utf-8?B?ZDIvVm00UW00TXFOWFRhbjVZTEtGNnpoNDBja21kRFNraHZOb2dTWFZSNGRW?=
 =?utf-8?B?K3hhZXJ4YjhyczZPNk4wVnZyT2NiZ256aVpzaWNqU2cvZ051eGVLcWcraWJK?=
 =?utf-8?B?T2xjN0ljZUhGR01UWjYxRjBWM1M0bVFlVmJ1aHhJTS9YNGV1c3JrVnR3NWM4?=
 =?utf-8?B?enNaNGttVE9UVWRoOUl3MmFrVzlSdkNRZDBVTU5jR1BWckZFa2swTDFYa1Iy?=
 =?utf-8?B?ak5rVjZ4cXYrdGdCYWpqd0ZCejlENUw5RkpObHVrM3RZOTh3ZktwNklkOVhJ?=
 =?utf-8?B?V1FWSXF2RGlCR2JvVjRvYXVyd1U5Q2h1SGNNdUdxbm94RUY3dXg0QWhlNlds?=
 =?utf-8?B?UjdDOGVGZnZBTTFTQ2ZzZ2lUS0xYNi8xNFpTWjRuYWdsaHFvSW1Ea29RSTQr?=
 =?utf-8?B?Y1VmZW8vRmxyNHRVemNMZVhqUmZzd01tdnN2TDBwL24wQmkybStzZzYvVW1a?=
 =?utf-8?B?bWluUm5ScVF0bW1CWGs0Q3B6Skttb21sbWJqWi9ZaE8vMlptdUd0ajhYby85?=
 =?utf-8?B?MEhqZmY4aStqMWZYcGZIZk4wOWV5SkVVVUFBM3Jhcm91UVgwQnFqd0F4aFBH?=
 =?utf-8?B?cHF0M0FqRnZSc1ArWjd1OUFYcHFkRzVEa1RscS9DZTJuZ0E4Y2ZBRlM3UW9Y?=
 =?utf-8?B?eC9nQnNsdUNOM3c4MGZRUkdkZHo4cmVWM0FydnRhWElCV1Y4VVdJeXZueTlw?=
 =?utf-8?B?YXdqQXhndzlqSjNhUmNGdkdFQ29CV2dmN3JjYmlnTlY0eVhjbEdPYVpaN29n?=
 =?utf-8?B?UWFWTDBuTWQ2ZU5pTzdyWWFDWUNUelB4VnlUaWFrRUVOcy9rLzBZYlZyY2xW?=
 =?utf-8?B?L0h5MEZDSktlMzQyenpnd3NHeXR3cWZ4NDFoWHRMQUxPM1k0dW9qejRlUUZW?=
 =?utf-8?B?Zk1JNGJGNXJSTHh4RjV0V1FJdTZlelJENytQVWIzS0pON1RJWlZGNzJRaHlZ?=
 =?utf-8?B?NW1oaFJGZGRaQ25MVEI3bEFWNFE2dnlWMGxTdjJKSEd2QnlrVE53eWpTNmw4?=
 =?utf-8?B?TGU5elBabDZOWHEvbUtjQlRmWlYvMHdGbzIxWE9QNy81ajBjbE5aRW5pVFBO?=
 =?utf-8?B?RU00Y2xLeGZuS0pVeDNhQUZYbnR2MFhOZ3I1eWw0ZnRGR0hlSXVWOEVkZ0ZD?=
 =?utf-8?B?cTdsMTFZQ0t5K2grZzZNN3d5Ulp3WC9yUm1oT2MxT0RVdzlhdTBBUnNoWjl4?=
 =?utf-8?B?YTZsdEtLWFNTakpaOUJsNytFVHp6MDQwOHB6QVlnMXJ6cWpLRmp1QWNxUUN0?=
 =?utf-8?B?cEhseVZlZ2xBMmphL1l3cTMweVV6MENpOHh2SEFwMUh6RnhTSkNIR3F6K3cz?=
 =?utf-8?Q?IMK0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXhYZEQ2ODJJNkxsZnRIRlBQalpVZXMrbkN4VTZSRU0rQmVJOEltZzcrTWVV?=
 =?utf-8?B?cmVINXR5R0tXN292UFF2NGx1UVhheURncHRHRks2d0ZaSEVCRjZuNUVRNXlt?=
 =?utf-8?B?ZUIzL01jd1IzZStodkF2ZzArdG5HSFlNejI0WHVueHl0WnNKNGh1Mkt6cWxQ?=
 =?utf-8?B?bm42YUNHNjJWTC9KNFRCWjQrTm9MbmdxL3N5UHVlOHk0NEFac2owNE5XZnlj?=
 =?utf-8?B?YmsxckxkNm9UYlQzeUdDdzBRVHVSUEJiclVyVCtiRmZBTWVEWjlLb284TWpX?=
 =?utf-8?B?c25nUEJJR20wTkhGSXdpQm9FMUJzUlVXTTVBNitnU21mYldWeXBVam9FQzN1?=
 =?utf-8?B?RzFOTkhTVEZHa2x1K0NtK3BzYy9yaW11TDAyZ2lSb2JjdGxMWjVHQUhLU1pp?=
 =?utf-8?B?bVlET0tIR2orU3RUTVZkSnl2ZXNWV0FkTHZDTnBsMnRnQXgxOGRqMXk1YzdB?=
 =?utf-8?B?RWRVNmp6RzQ3dmIvMERSZFlDaXFqU21UdWtkMmY5eWxRTlhhZkpDeXVWTE5u?=
 =?utf-8?B?NWhramVJbjNZcHZDUDZJT1FzMnZGZ0FqNzB1ZHlmUS9pSjB2dGRFMW1wd29J?=
 =?utf-8?B?RTRFeDY2dUhmMXE5N1Fmb1pxbEJ0ZXFHR1BDbGpSamNWWGp4OWpiS3JOQm0w?=
 =?utf-8?B?WEtpVTAyUmN1bUR6YXFmbFhHTm9GUDJxNEZXUHdpdkE0clI5SWJvR3pzWGU3?=
 =?utf-8?B?Q0EyNXg4VHNFLzgyTytHb2xxSngyTktYa2ZtMVlPQ1loZDFrVXJSWXJFOG1u?=
 =?utf-8?B?OTR2WXhjaVlWVW90ZEhiWDVrcVB0c3kvTm9IdkhPUXN1bGJkVTdKanFrRGor?=
 =?utf-8?B?ZFpBVUxjeFd3M0M0NW1JOTJpdFB2RnJzZC9yeUNTOGZ6S1p0eFMxTzhaQWFV?=
 =?utf-8?B?MzZwVVdJRjBpZU0rS3F2alFuaCs3ZTVJSVhLRXRjcTR3Tjd0L1JxS0I4TWdq?=
 =?utf-8?B?M04xTHh6bkx5T3NKc0xPMUU3ejQ0QytyY1pzTnRCQmp4VmZYWi9iUnBBL0g4?=
 =?utf-8?B?OWVLejJsWmNuQUZWRmU2TWV5NFFiWEZ6anJHcjZ1SGNkblFEbEYvL1Rmbkhv?=
 =?utf-8?B?bGlaaEFLRVBFZitDY1M5cytVVHlVNE1LbDMzd3VoNFFHV3hoUjZRYkdjbHcr?=
 =?utf-8?B?RFJhREpQRHM5Z2xkZUNEUDYvbk02VUZiems5Vkg3WkF3Y20ySG1ER2JlRWdY?=
 =?utf-8?B?SzJGcllRQkY2VWI2VlFJUkNKNFpjZHFzZHhETUxXYkxybmJaR1NkTHNwQjk4?=
 =?utf-8?B?MmVPRWhSaWhCSEt1UWNNYy9ySEd5ZEZFaDZCaUFvWC9yVHZYTHZWMVB4TW8y?=
 =?utf-8?B?U2VrdENRM25KdHdrQnViNVlpQndHRmtwdXRuc0YwVlc1dXl4c2ZJN0Q2S1l4?=
 =?utf-8?B?Yk9aZEJpSEwxa3JBZjg3VUtySy9DL2gvY2FhYWRoM1Q3V3JiOGVYa1QrT3pI?=
 =?utf-8?B?b1hvc2ZqVVdoYU1wSEpWY1U1bHcwaW1kQ0RBN1lpZ1RQUnBDNFJRTUJ6SFVi?=
 =?utf-8?B?UlczdFh4SitxRktSNy9ITWo5T3hLc281a1JpdmtBenBtQXlkMEFMc0xJLzQ4?=
 =?utf-8?B?MDMzK2ZWMnFyd2g5WjlON2YvU3d0YldweTJ6cVY3cDlUbkhkTDVWbmlrMHZO?=
 =?utf-8?B?WmNlU0JCR05WOHVkdFlZWjFvZXQzL1FPakJzRGRoQ055b21CTlN6K0FRaXNT?=
 =?utf-8?B?bFIvcCs2ZTZkWDNJTUh3UFF4MlZPQ1VJUG14U2p5UFZ5Yy9kMXlubDdQZS91?=
 =?utf-8?B?NHJPZnFwRE5aZjdMRVlpbnZBcTRGSC94VThQN2oxTVNsN1hZeURWRk5DbzV0?=
 =?utf-8?B?MitIUkJOTDhLL1NXRVlNRmdGeXJDSTZqaEFxNTRXVFZSU09UczN4VU03SnJT?=
 =?utf-8?B?dkVyclNkNXB6NmluT2FobFJta1ZLTjBpdnNkQXhBcVRzcTNITWUwMmVqMExC?=
 =?utf-8?B?K1U2a1JOWVpRSFlQcHhyYzdsaDRCR1ppK3FRcWxORGE2QmpuMy9jMHlZVnBK?=
 =?utf-8?B?TFJWTVhScHBCOWVURGNxSTRIZGtKc3NXMFVNRmZlUSt5ZHVrVXVxRUFlMTE4?=
 =?utf-8?B?ekhPQ0N6VVpVYVpHV1RHaGx1RXlIR3RFWGFyT2xRaVZnYmc1bCs2c2lmSEMw?=
 =?utf-8?B?cXIvU2MzUWFTbHNTcEV1Y2VBalBOM2JHTG05NHNyZ042VTQ2QmZQNk1CRWlp?=
 =?utf-8?B?ZUx6VUpTN1h3TW9qV0hCNnhTV0hiWEdBeVJ2NC9PNnJON29KRi9objBKWmtn?=
 =?utf-8?B?R1ZhbE1NbDV2SE8xYldsQlIxMkZtSzF1UzNaOUpFUVp3K29oYXhvK0phdmxH?=
 =?utf-8?B?b2VOeU52bk1ObEtMNGk4WGNaNzR0cnM3dU5QdERORHZKQ0ZFMFR3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b710d43-dd76-4a28-5e60-08de67da1f55
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 12:52:46.3358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcMQOmNKNwxRbpD5TzlUoBXB3bSmIe97/Pi96+tAehChmambR5YhlYdgjMcf9gT8yA87v9gudGAPCx5ct4MphA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,collabora.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org];
	FROM_NEQ_ENVFROM(0.00)[honghuan@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: C9B7010F1F0
X-Rspamd-Action: no action


DRM GPU SVM does use hmm_range_fault(), see drm_gpusvm_get_pages()

My implementation follows the same pattern. The detailed comparison
of invalidation path was provided in the second half of my previous mail.

On 2026/2/9 18:16, Christian König wrote:
> On 2/9/26 07:14, Honglei Huang wrote:
>>
>> I've reworked the implementation in v4. The fix is actually inspired
>> by the DRM GPU SVM framework (drivers/gpu/drm/drm_gpusvm.c).
>>
>> DRM GPU SVM uses wide notifiers (recommended 512M or larger) to track
>> multiple user virtual address ranges under a single mmu_interval_notifier,
>> and these ranges can be non-contiguous which is essentially the same
>> problem that batch userptr needs to solve: one BO backed by multiple
>> non-contiguous CPU VA ranges sharing one notifier.
> 
> That still doesn't solve the sequencing problem.
> 
> As far as I can see you can't use hmm_range_fault with this approach or it would just not be very valuable.
> 
> So how should that work with your patch set?
> 
> Regards,
> Christian.
> 
>>
>> The wide notifier is created in drm_gpusvm_notifier_alloc:
>>    notifier->itree.start = ALIGN_DOWN(fault_addr, gpusvm->notifier_size);
>>    notifier->itree.last = ALIGN(fault_addr + 1, gpusvm->notifier_size) - 1;
>> The Xe driver passes
>>    xe_modparam.svm_notifier_size * SZ_1M in xe_svm_init
>> as the notifier_size, so one notifier can cover many of MB of VA space
>> containing multiple non-contiguous ranges.
>>
>> And DRM GPU SVM solves the per-range validity problem with flag-based
>> validation instead of seq-based validation in:
>>    - drm_gpusvm_pages_valid() checks
>>        flags.has_dma_mapping
>>      not notifier_seq. The comment explicitly states:
>>        "This is akin to a notifier seqno check in the HMM documentation
>>         but due to wider notifiers (i.e., notifiers which span multiple
>>         ranges) this function is required for finer grained checking"
>>    - __drm_gpusvm_unmap_pages() clears
>>        flags.has_dma_mapping = false  under notifier_lock
>>    - drm_gpusvm_get_pages() sets
>>        flags.has_dma_mapping = true  under notifier_lock
>> I adopted the same approach.
>>
>> DRM GPU SVM:
>>    drm_gpusvm_notifier_invalidate()
>>      down_write(&gpusvm->notifier_lock);
>>      mmu_interval_set_seq(mni, cur_seq);
>>      gpusvm->ops->invalidate()
>>        -> xe_svm_invalidate()
>>           drm_gpusvm_for_each_range()
>>             -> __drm_gpusvm_unmap_pages()
>>                WRITE_ONCE(flags.has_dma_mapping = false);  // clear flag
>>      up_write(&gpusvm->notifier_lock);
>>
>> KFD batch userptr:
>>    amdgpu_amdkfd_evict_userptr_batch()
>>      mutex_lock(&process_info->notifier_lock);
>>      mmu_interval_set_seq(mni, cur_seq);
>>      discard_invalid_ranges()
>>        interval_tree_iter_first/next()
>>          range_info->valid = false;          // clear flag
>>      mutex_unlock(&process_info->notifier_lock);
>>
>> Both implementations:
>>    - Acquire notifier_lock FIRST, before any flag changes
>>    - Call mmu_interval_set_seq() under the lock
>>    - Use interval tree to find affected ranges within the wide notifier
>>    - Mark per-range flag as invalid/valid under the lock
>>
>> The page fault path and final validation path also follow the same
>> pattern as DRM GPU SVM: fault outside the lock, set/check per-range
>> flag under the lock.
>>
>> Regards,
>> Honglei
>>
>>
>> On 2026/2/6 21:56, Christian König wrote:
>>> On 2/6/26 07:25, Honglei Huang wrote:
>>>> From: Honglei Huang <honghuan@amd.com>
>>>>
>>>> Hi all,
>>>>
>>>> This is v3 of the patch series to support allocating multiple non-contiguous
>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>
>>>> v3:
>>>> 1. No new ioctl: Reuses existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU
>>>>      - Adds only one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>>
>>> That is most likely not the best approach, but Felix or Philip need to comment here since I don't know such IOCTLs well either.
>>>
>>>>      - When flag is set, mmap_offset field points to range array
>>>>      - Minimal API surface change
>>>
>>> Why range of VA space for each entry?
>>>
>>>> 2. Improved MMU notifier handling:
>>>>      - Single mmu_interval_notifier covering the VA span [va_min, va_max]
>>>>      - Interval tree for efficient lookup of affected ranges during invalidation
>>>>      - Avoids per-range notifier overhead mentioned in v2 review
>>>
>>> That won't work unless you also modify hmm_range_fault() to take multiple VA addresses (or ranges) at the same time.
>>>
>>> The problem is that we must rely on hmm_range.notifier_seq to detect changes to the page tables in question, but that in turn works only if you have one hmm_range structure and not multiple.
>>>
>>> What might work is doing an XOR or CRC over all hmm_range.notifier_seq you have, but that is a bit flaky.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> 3. Better code organization: Split into 8 focused patches for easier review
>>>>
>>>> v2:
>>>>      - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>      - All ranges validated together and mapped to contiguous GPU VA
>>>>      - Single kgd_mem object with array of user_range_info structures
>>>>      - Unified eviction/restore path for all ranges in a batch
>>>>
>>>> Current Implementation Approach
>>>> ===============================
>>>>
>>>> This series implements a practical solution within existing kernel constraints:
>>>>
>>>> 1. Single MMU notifier for VA span: Register one notifier covering the
>>>>      entire range from lowest to highest address in the batch
>>>>
>>>> 2. Interval tree filtering: Use interval tree to efficiently identify
>>>>      which specific ranges are affected during invalidation callbacks,
>>>>      avoiding unnecessary processing for unrelated address changes
>>>>
>>>> 3. Unified eviction/restore: All ranges in a batch share eviction and
>>>>      restore paths, maintaining consistency with existing userptr handling
>>>>
>>>> Patch Series Overview
>>>> =====================
>>>>
>>>> Patch 1/8: Add userptr batch allocation UAPI structures
>>>>       - KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH flag
>>>>       - kfd_ioctl_userptr_range and kfd_ioctl_userptr_ranges_data structures
>>>>
>>>> Patch 2/8: Add user_range_info infrastructure to kgd_mem
>>>>       - user_range_info structure for per-range tracking
>>>>       - Fields for batch allocation in kgd_mem
>>>>
>>>> Patch 3/8: Implement interval tree for userptr ranges
>>>>       - Interval tree for efficient range lookup during invalidation
>>>>       - mark_invalid_ranges() function
>>>>
>>>> Patch 4/8: Add batch MMU notifier support
>>>>       - Single notifier for entire VA span
>>>>       - Invalidation callback using interval tree filtering
>>>>
>>>> Patch 5/8: Implement batch userptr page management
>>>>       - get_user_pages_batch() and set_user_pages_batch()
>>>>       - Per-range page array management
>>>>
>>>> Patch 6/8: Add batch allocation function and export API
>>>>       - init_user_pages_batch() main initialization
>>>>       - amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch() entry point
>>>>
>>>> Patch 7/8: Unify userptr cleanup and update paths
>>>>       - Shared eviction/restore handling for batch allocations
>>>>       - Integration with existing userptr validation flows
>>>>
>>>> Patch 8/8: Wire up batch allocation in ioctl handler
>>>>       - Input validation and range array parsing
>>>>       - Integration with existing alloc_memory_of_gpu path
>>>>
>>>> Testing
>>>> =======
>>>>
>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>> - Memory pressure scenarios and eviction/restore cycles
>>>> - OpenCL CTS and HIP catch tests in KVM guest environment
>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>> - Small LLM inference (3B-7B models)
>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>
>>>> Thank you for your review and feedback.
>>>>
>>>> Best regards,
>>>> Honglei Huang
>>>>
>>>> Honglei Huang (8):
>>>>     drm/amdkfd: Add userptr batch allocation UAPI structures
>>>>     drm/amdkfd: Add user_range_info infrastructure to kgd_mem
>>>>     drm/amdkfd: Implement interval tree for userptr ranges
>>>>     drm/amdkfd: Add batch MMU notifier support
>>>>     drm/amdkfd: Implement batch userptr page management
>>>>     drm/amdkfd: Add batch allocation function and export API
>>>>     drm/amdkfd: Unify userptr cleanup and update paths
>>>>     drm/amdkfd: Wire up batch allocation in ioctl handler
>>>>
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  23 +
>>>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 539 +++++++++++++++++-
>>>>    drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 128 ++++-
>>>>    include/uapi/linux/kfd_ioctl.h                |  31 +-
>>>>    4 files changed, 697 insertions(+), 24 deletions(-)
>>>>
>>>
>>
> 

