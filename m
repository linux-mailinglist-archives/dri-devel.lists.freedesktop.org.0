Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D39615F5F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 10:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5759910E127;
	Wed,  2 Nov 2022 09:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D1B10E127
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 09:16:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkyfLc3S/VzaljH7nVAtSQuZvCQh2y/hfYH8lCb3scGP2MEoiqyGTzzAXpFxxD3kkNvjPN75ZGZI9gzC3jE5dn40J/d8FzPGqBDO5XnT3eMf6W34h8QmkpyMJdKHrYHcnIT6DPQbsDok5U8PwiF7eL+MfgsLq4RR9gbLhmiWXWbaEkvmDts3vrgoFkNPJSUWdDGiMM05gXQu6vJqem5WwvjF0xI2i1JusyXkTe1lTJk3pwe8ubxFba1zS0UxvSUEE1PB3VhECd83cEpFT41PRsBcXQH2VhvXfczP/At2oZLRUu0va/UKBNPzPEYhx/IqhfIHQXJxERSN45pusuOX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBFvPXmURwrYxJkpC0LsejKrJQGCaBlUu4mF/f4nN1M=;
 b=QbcDWbKjS5KZziC7zGtgFqHhKoYYsbPWKYN8scV1H4xLonV6UZZhnlII5he8fkXqo++76XiCY7pZO1SxcXgItFoYkr3Tnx9W2MCvdAyssXiSrGwTnGO6LNxbhpHXDXuYu0H++gGx0R9ekpi+q5gKm80vaskp+sWEkNXZ3qf9O9v+onZY7tq3vcLpUbhd+rQfga+zrT7iUdtCjgyjjiF7CTadyegI+K6LO/oggArQoXBeBuFyUl10wb+/TO/NZ7w0eWD+U2mYfdbg//m7znE+mArrg0jkKdywP/JJN/2q48EKcQ9lE7OgA7DRIeYoxy/nbhp4/3HlDgHX6LpVH7XMSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBFvPXmURwrYxJkpC0LsejKrJQGCaBlUu4mF/f4nN1M=;
 b=ZKHjIY46tyO6Ly2ZhlIAANnAP6M5uUJu0nimQ2rdDsJe/74IGO7O6ctJCIyX9yg+6KX8kawRokJ7EBNiPN1Z91bNwCp8hwJ6jLpmXFBhbHzBAWz2r4wZmwvNhrKBU6YfvsxDbB5yuDUKOMn5/sjrO0/xtIMt1xhbrb+RXZ01tO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB7777.namprd12.prod.outlook.com (2603:10b6:8:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 09:16:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5791.020; Wed, 2 Nov 2022
 09:16:02 +0000
Message-ID: <68dd2e87-c4d6-99de-22bf-5059d03c22bb@amd.com>
Date: Wed, 2 Nov 2022 10:15:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/2] drm/client: Prevent NULL dereference in
 drm_client_buffer_delete()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, noralf@tronnes.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20221030154412.8320-1-dmitry.osipenko@collabora.com>
 <20221030154412.8320-3-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221030154412.8320-3-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0351.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 6178a1fa-0a82-44d3-ce54-08dabcb2dd08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4H6vTV1cY3a4lyL4OCfUp7HEauQw+yi7JnzIo0K+YKrLAHJE3HO6xeXa6G0c9V2jnKXYwtTbenjlKx6oteze6T2/zp98fbsceUQmuaU4gioligLvpfA4laHSqRGS3XC2G2UguXZCP0ETvxs+4Fmt9pa8mVxQ58Wd7LV3iZEV1rB/oOBKVpHs6DNLTgOLE74K09YaSeqhzowxxYtK9vo8uuhCXnCbMPIj8JldQLv+9RWpUYJeLP+PY1QoxTnbwyYwyXBY026LpacDTrbNqYWD5cxK+8EAyOKRoSsnCaSlvs1y2tNwEnQGL3NQGN6FWNxW1q0lx3vqmiNyeySkAA56+oI7jfbcJ7QeSlMv2fG3rM3oOGfDi9t9XSMo0EhQijut3+4NpJDwKYEDORk5A+mv1Ys7/AtFc242cVQ8UVeBiQZ8n0v/oD248AD13qdp/GlCWWy+dlHpH7KXjditw+Qld1c8EYX1BYwL4dZVQ3fKrvh8uvSZ9m8TkjBhIl2s6MM24KsKmJZeQ4uQUBy6q6gC/4Dwo5qv9s8S9Glw0zErd7bioPf5aLYlHAZIMT6e4Cm/p7IxaJfDjfbXE82CAE4wTuOHLy26ic+LhveNunPkXxd7Qe2Hrget8HGV4l4vZRzsiitt+5v8J9STD5dsg1LUzRXBeG5ZWfy9m1t25aGaDNbl15DmIzfNNl6EoIggdCoxa1M77fS5RsixibRDgbFR3aggVDGLvrid0xZTjbTb/JiFGdC/EKa3OcJOCdSnen++zg0HKYRgjx6hnrCjumzFpnPrrOxtealeSAnTCUIEhY7f+KkiTAMHtj0upJacis5A6tIQV4lsM3Q8PijxaSTIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199015)(478600001)(8676002)(66556008)(4326008)(66946007)(7416002)(2906002)(5660300002)(66476007)(316002)(8936002)(41300700001)(83380400001)(110136005)(31696002)(6666004)(6506007)(86362001)(66574015)(6512007)(186003)(2616005)(31686004)(38100700002)(6486002)(966005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2NGNUROUXdSSzhGc2xlRGZCMXhNN1Fudi83eHpTeHJuVTlhWkxnL2krQVEy?=
 =?utf-8?B?aldEdEtPeTJ3UzVTekNUOEFKbDBPclBGUjhVRi9JYlZjREdRR0ZQYWhPWm92?=
 =?utf-8?B?Y1plaUtNY05ZWnppZ0ZseUJIYmRIL1ZreDR2bGJWQVBEaGJUQXJmWi8xV24y?=
 =?utf-8?B?YmpJbFZTNjlJZTVicnlHNjRGN1RlQjZkaVdKVXQ2ZWl3WHVwWjkrZVpobG1T?=
 =?utf-8?B?bDlnREZib0JlMEZSeDdiTEFHWFk5ZmF2dkhMOEozRDNKV1NBZlV4dll0Y1M4?=
 =?utf-8?B?NGowMnRuVS9xSnBMRHhZOHpQb2g1M2RCUFdySVBzbWUzbGVPWkRVbnNjQ2dE?=
 =?utf-8?B?VDZydy9tbGRlbG42MkdCYWFFclBHNFBIdVR1SFJFZnJsR2s0VzQ1Y2s1RzQ2?=
 =?utf-8?B?SDlCRFg3RUpaZnBleEFHTTJrQTkyaEQxVDJOR2ZyV0J5L0NmbG02bjByNlFJ?=
 =?utf-8?B?elNKRWo1VDRTa2xXdlRnZUVqRmFzR1lyUzIwZ3VqWUtCUWhDbHFzTEFXa3F3?=
 =?utf-8?B?Q2Z1d2hCRjZScXVRTFdpZVlVWnhKcXNac0hzNVJWYjNNaWdTamttMHVWSGxp?=
 =?utf-8?B?d3MzTTRvZEdLTEVJRVNHWGovMnF5TTRYOU41eCtaTGJZQkNEeHhCS1dMU2NN?=
 =?utf-8?B?Q281WWlRNHBpdWl4d2JkcXBwMis1MlNaaWVURldvVCtibTNDQ3FySFBsQUcv?=
 =?utf-8?B?WEROWFBMRnBpK1hGaVJvUW92cFdQd0dJdHJ4UWVTUStCcTViekRYbThlMFE5?=
 =?utf-8?B?U1FmemY3NUlwZy9MbXV4SXcvVS9taUZickRrRVBxR0N3K3hVMm5vNlNNM2hU?=
 =?utf-8?B?UnpOaTdib0hjbzBmZzBSaFdleS9PQjZ5cTdzR3libWtkZFFhRXpZTEtDMHBT?=
 =?utf-8?B?eXBoaDdYcndsS3oxek0yQ0VsMCtQaUIvVC9DVzl3LzFhc2M2TThCRDcxQ2lZ?=
 =?utf-8?B?OHpiSzJSWVpaM3pzR3NMYSs5TFJtdEtpY1ZEeFVHSnVvT0xnaWFRN2N2THpI?=
 =?utf-8?B?UkVXM092cVY1ZXZmWWxDNjRKbEQ1MEhDRXNlcWRJdlBSVnRwUWR0NU5pa3B3?=
 =?utf-8?B?OU10R3VMNU1QQmFvRzhIcEdkTWowUzlOYWhLd0Q5UVdNWnVuOFRGU3hUUHlk?=
 =?utf-8?B?cjVabEFkK00rQ1piSEl3RENBbHJESE8vVks0czFmQllDOVJ2VGtBR2pERzBX?=
 =?utf-8?B?OFFVK3ZuU05YZU1UYlZxUW1GcWxPcFA4UGhEakQ4Tkpwa0kwQlAvN3BCNitX?=
 =?utf-8?B?TkV2SnFmZ3FkOEtLTnVpZU14MG50K09QYWVRQXYwMDFDNjJWbThWSUs2dDA5?=
 =?utf-8?B?Wm5XR3ovWWJiRk9obTBrMmN1bkVQaW9QdWFySDhVTWhYOEhnVGU3WVFOVVk2?=
 =?utf-8?B?Z3kzdEVxMWhQaEl2VTJ0MlBzQU0xZzVLc0xTWkZMVENHdTJlK3FOY25TdWh4?=
 =?utf-8?B?QkdWWXUvNjNOMXlsQmc3dUkzc1dNU2lwa2NJd2QrVlpxTE43Uy9YOVpZa25m?=
 =?utf-8?B?Z0JGVkZCemVuMVdjelVSNE1ndUdRVU8wUXBHZDJWeStEejMwMWJQbEh4elRB?=
 =?utf-8?B?VTJjcTlVRllzTFNabEo2TERqOVR2R3FZdGljRjBCa3ZVZ2QxbHZpQkJRdk51?=
 =?utf-8?B?a3RFVmh3MUo2MmpsbE5FejBHcytwSzlJQWh1Zy8rajU4NEhyMm1sa1o3Tkp6?=
 =?utf-8?B?d1hpYmgxY0xiM1NqK1pxT0dzUUw3ZE5FOWowNU9COU5WOHpGOWV0ZVRTUzZR?=
 =?utf-8?B?cXRlOURCZGI5bFUybGZ1VEk0Ykd6M1k3K094eEZud2ZLa1R3TDlZeWd4a0l0?=
 =?utf-8?B?R0E4cXpyVFNtRTBmeEVDVjRmY3pWZWFob2ZhdyszcGNyZUZxZ0R6cWZzNlha?=
 =?utf-8?B?MHJoZHk1U3ZWdkJyeXl4RVlwUVNDajFiRkdTR0tocms2Rm5IVEpFQkRuYTVu?=
 =?utf-8?B?N1JwQlFYYkw2bUNuS2g5dFpoTmRFd2sybDd3c2JNUy9lK3Z6a0VQOHoyajF1?=
 =?utf-8?B?b2VlSTB5UkVxWENRRlJYM3c1SlUrWVJSL1pyaEdsZE1vVi9RMVFwUG9ZclRL?=
 =?utf-8?B?QzFaRWhxMXg0TUl2dG9aVTFHbFJNck9vSTl1dFF5U3dkcktDRjZyZjk5Nnl6?=
 =?utf-8?B?VGRsL0JLWDRKRmpHcU11Zmt1U3pFdDlBU0xPSjlNM2xMTXBKUDYwUXl3eEs3?=
 =?utf-8?Q?5To/cfwzDJ3ePmpR/AzR3zpCfkmROlaL0MQy5/Skqvdx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6178a1fa-0a82-44d3-ce54-08dabcb2dd08
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 09:16:02.7544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kj+QM3Bs/zLEaQ94ZCFnH/Q4lRVc2QaAmAcuP9yWHa1RVkB0GQR9qsZJpkP81wkS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7777
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.10.22 um 16:44 schrieb Dmitry Osipenko:
> The drm_gem_vunmap() will crash with a NULL dereference if the passed
> object pointer is NULL. It wasn't a problem before we added the locking
> support to drm_gem_vunmap function because the mapping argument was always
> NULL together with the object. Make drm_client_buffer_delete() to check
> whether GEM is NULL before trying to unmap the GEM, it will happen on
> framebuffer creation error.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Link: https://lore.kernel.org/dri-devel/Y1kFEGxT8MVlf32V@kili/
> Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap operations")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_client.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 38e1be991caa..fd67efe37c63 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -235,10 +235,10 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>   {
>   	struct drm_device *dev = buffer->client->dev;
>   
> -	drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
> -
> -	if (buffer->gem)
> +	if (buffer->gem) {
> +		drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
>   		drm_gem_object_put(buffer->gem);
> +	}
>   
>   	if (buffer->handle)
>   		drm_mode_destroy_dumb(dev, buffer->handle, buffer->client->file);

