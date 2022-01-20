Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F784953DB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 19:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC0F10EC24;
	Thu, 20 Jan 2022 18:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F294A10EC47;
 Thu, 20 Jan 2022 18:04:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWDKmU7BLMEN07xvuuJv5SFwPP4Tzz6WTkRUghqCoQuDBXxDLUn5PM2fMfggsDoKGZTsIoKWdeLgpZzJFP9vOQcTKUWfJMI63Uq1ZJBLbPcZJ4t7A4Eyi24v65KgsZJgm9qkrFHq7B6EuhHcoFOxeFlXZaahJEC8fUaDvV9qjm8HCWme7CHopyk6B1hDHv3ieEvdA0FVr8cJFxqE3ioZH+G/J81BcMRatliTf+lvDr1oYkkKphvI7TrFBDUOL9sdXl1VQ7/7Nf1eL1DFdT75PKS2LBJ8M7SO2Xkg0j4VJMS6hDoxAWQCJTXZRhjZQ+DjvbTkuAaJ+AeJHUIa3Miq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uZC9Pr1+LVUe0GWybwRb74fGl+bY8gywyyqZ3nVZIw=;
 b=irnzKw4PsshumTaKl/HNclBON3fXVWbFf/HN1GdhGRveEeuusH1+s0OmUw8OuUGoFw7vaEi3G/f1Yur5aVJsN1y9iH279MsqlrWNBsEHwf8SAaQvi634mAayt7ClmZ5XYtXn/a7PdqoafQYViNkhVf3Or9XCrbcz9shUho/1/wxgyL8es1LsexrAP2dfHnq8RCsMAxrjgxGE3/MwTZYNdn0kdR5BeyCGfm+o6BU6udlFfT6qcJ1JVXB2YhoY64NOpz5xqX5mZtZrRTVXOlozVfG+UewS380IvKyRAdkm7hLQN/gFpScry8foonjz8IJJq3O+9/79i3LngruTrD5fdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uZC9Pr1+LVUe0GWybwRb74fGl+bY8gywyyqZ3nVZIw=;
 b=sUpn6YIrP+bIMYHUY9mz8G1tSfX3QQx71yT8wgqA4AHB9vKsU2ESvPvbhovp8HD4neHlU4nLeOJhxbL17yDK087jFZuonf6zV1iVqMQ/EQgNpRcFkYmsODtUmvK87aRt63cmzOBiLvzNxxn9JiXmbiZLqNpBpnlGJ6F0PXPaIsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 18:04:06 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4909.011; Thu, 20 Jan 2022
 18:04:06 +0000
Subject: Re: [PATCH] drm/amdgpu: Fix double free in amdgpu_get_xgmi_hive
To: Miaoqian Lin <linmq006@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 John Clements <john.clements@amd.com>, Jonathan Kim <jonathan.kim@amd.com>,
 Bernard Zhao <bernard@vivo.com>, Kevin Wang <kevin1.wang@amd.com>,
 shaoyunl <shaoyun.liu@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220120101746.24847-1-linmq006@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <33f459af-7731-fb39-ec6f-059cf1a77bb4@amd.com>
Date: Thu, 20 Jan 2022 13:04:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220120101746.24847-1-linmq006@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::24) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 218490c2-5327-4371-0061-08d9dc3f3fae
X-MS-TrafficTypeDiagnostic: SA0PR12MB4447:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB444726504EBAFC5411AD923D925A9@SA0PR12MB4447.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OPrFL7yQQDpiW0VnHXjakhuLnD5zBczWYaI40W8lEzO/FtC4xWWW2xU++mrRyT9w3MVTf+19pvSMxiejL2JETsVDK/NiX5acfC7Z+DrK4kJ7i9EMxVZliIkiloSoiT4bfB4Yt9kjUJx1esdAoIBfFRO+Jii4Q+iGycBW0agWQOIGTS6Aq4socrcBNGzjLEC2/OMktMxgK5WLHx4CZvrBanIGcPAQOPRSMoS5IwQp0kfYJ68o2fnFfTix3MKJUlUOT+SdC+ggJq3hBhtAuXBlkVXhJZ33r4Lsa05yJhNCqJuk0RW3TYwjrULAb7vkWuuqeb3fchG7VKKSQJFggkMBGJCm+1FqeDhPA2fvFQGklr22pgKXbwkA0U/abnPso4xrD2HmTQx6M2N3jvuQlfzwyzZnQe8kIH/ON3dfLsGGozD4tGtnfYLCZkzSHyZZJmwpjg/rlvt/PsKw678lB71np5h0UYnsP56eFy/ZQV1IZzr4IMOx/67yX425movAxdAvbXv161W1JEhOM8jdgBmi+mIaU1z6mliJehYg4522RAkvuhVpmyUfypPZzGxh14yI9tGzyCDnn6d92aN732ilzD5t1ll7YLf9X84EVb/8vzwQIVyXT/emd7lql45OzC+OoiQDQ2xHHQ4vVl+15nk+Xo3AEQBLYktvP1l2GHrYFjO1iSDB4MbrqdNDZgDb1ZjtuaJiJzYjmjXRm51Q8TGwUnBssi2V52hJ7D8mqa8oNM3Ky1xPlcJHcfX091VpO0BEY8h642x5bR4VAt9prELy9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(921005)(44832011)(8676002)(6512007)(508600001)(38100700002)(31696002)(2906002)(2616005)(86362001)(66556008)(6506007)(66476007)(66946007)(6486002)(186003)(6666004)(316002)(5660300002)(83380400001)(8936002)(36756003)(26005)(31686004)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDhWbnNjb0RLTmlSRmpwbDR5RDhQRGZrd3BQWm9wcTJ0S0dKdC9lQXY4bDM0?=
 =?utf-8?B?TWh1SURsOE9BTEtxKzltc0JKdS9QdllCNWxnTTFsZTgvdko3QjFudGZ1ODlR?=
 =?utf-8?B?cnF2d2I4ZDFKeG84QjFNS2UrNDA2bUY3NFRkUDhnekZIWVlSREhTWDl3WWlx?=
 =?utf-8?B?b1RGOEZjN09Mb25WVHdRZGdseTFTZFIzRFhMN0hVRW1LWCtSOTA5bXhvcXhS?=
 =?utf-8?B?aExmUzUyL1o5QzhpaStoMWYyVkIxVGpMLzFpRlBRMURaaE5iWmJOWDhiR2lD?=
 =?utf-8?B?UWwvQ0ZGWEg0NGtVTWg5Ujg5N2dRbXQzWDc3Umc0K1NMUmQxT3VRVlNjS0xB?=
 =?utf-8?B?VklPeVR0dFJOdWlQZ1AraDhuTXBmQ3NlNFplVXZsQzB2S3J3N0JEalNhUTRN?=
 =?utf-8?B?NU9ibkVqN0t2MDIvSHA3QUp2RzlwTldSZWlMTkFjNFZDMndlWWVrL2JaZXpi?=
 =?utf-8?B?dmFUZGRvUHdkby85QXZqK1dFeTg4N1R0cG9GV2pFM2F5YlYrVnFrRkRvVHFs?=
 =?utf-8?B?YXU3Z1RlZ0VoSWdhYmRpS3FOS3d0M0cyYm1XT1RFRXo3dCtOWktKUVNzMHRi?=
 =?utf-8?B?aytFUTJSbzhkL25kNW1URXJxNHE0MENVSkoyVmN0OTZ5TG5TUjFzZWMvWFZq?=
 =?utf-8?B?allXR2RUblZQTmNMaHNNUnVodmhiUjRMSCt6KzFFUTFIbVlVOFBJSmloM1Fw?=
 =?utf-8?B?NC9JZlk2T1pLbldoclptQ1VCZTZHVEo0RGNzbThqMkg4aDYvSW1VTWduUTht?=
 =?utf-8?B?N0cwQnNWbFR1dEkvekZOYlc2WWI5NHUrUG05ekdxS1hsL3VyQ0daM3k3MUNL?=
 =?utf-8?B?YTN0OXloZGpkeGpwMHhkcXZvcnZFOVR0M0VNYzVuYnkyUW9EM2J6bHUvSDMw?=
 =?utf-8?B?dk9OV0FjVEkxbG1tUjEveTBhZklncUpUV1F0QkNDRjAyNDdzRVhLNUZpYmQ1?=
 =?utf-8?B?M0F4TzMvL0JudzV1WDdWNEwwSFFsQjhQV2dETlNBN082LzVBUkEzVG1MT0ZO?=
 =?utf-8?B?Y3JON3BkUVdvY0VqZVNnR0xzaU4xNXVUTU1DTEZ4RU01TW1zc0JDYUpKSFNn?=
 =?utf-8?B?NXNORGV1U1ppemhDek16SWsySDRXYmRDT0h2NVU0WGE2SENCQU5vVUdLWEZZ?=
 =?utf-8?B?ZU13RDRQMTQ1WDVTb1RFc1hDSmNoVWlmVzFORzNkYWF0ayt3VnZuYTVXZ0h1?=
 =?utf-8?B?dDRlS0lMTlN0bnlMWnA2S3BRMERUbjVnVjRtRWRFV0M0Nm12TlhBSGQxMGlR?=
 =?utf-8?B?S0p5cnF0SUs0TytGTFRvcGRmR3RITVlMcmhNU0U5R2FRN0NPeVBPcisyZWlP?=
 =?utf-8?B?Vk9zaVhtanBLRGZQOGppd2VJdmIwRHh6bHlhTThpTGZvSFJBaStiYTJnT1ZR?=
 =?utf-8?B?cUhlckIvelJ5MnYzWmhJUExpOWtXT2pRcUtXdm1JRUIwOElTMTZzVWVEUmlm?=
 =?utf-8?B?K3drQmF2Rnp5MTd6aGgwMU9Wc04vakY4YkpQNkE4Mk13VjVZTVBkN3FWVEgy?=
 =?utf-8?B?OHdUeFlrU0VjdkJpOTVGTFlmWEIzc1ExbTRDd2xCU3ArSDNpZ29YVzVWampD?=
 =?utf-8?B?QmR5Mklyd3dnY1lGYnE1N1V3enNVZXFBajhER3Z3TEdyUHUra2MyU2FMazlv?=
 =?utf-8?B?dXYxMWJNdC9sdnluQlRFZFRieEdVOVNJZlJ5b1h2d3ZkQW5nODBjY29xWm1W?=
 =?utf-8?B?VU9Oc0VpaUhpWng5NmF1Q29IdEg4YTdEYmtaR3JseldLc003eGZ1MjRtNzNN?=
 =?utf-8?B?SHZ3a0ZsYWhJWVhnTFFsWWhuODd4UmpINGE2QWhsdVJsYWNnZW1IWWtDNHp3?=
 =?utf-8?B?STh2dlVpbnAxNXNjak14Z1RBanhadjM4SzRWWG8zVzFZTDN3MHlabUl6UWll?=
 =?utf-8?B?dVhRR1ZWU2xVckF1SjJ4VmJKZ2lJMkVBRlVUa3BML1pSempuY1A3ZVREbDlo?=
 =?utf-8?B?OVV5V3p5U2NOTlZxMXdtdkJDd1lEbjVBR3JTR1hYU0JrYzM2U3RRQ1NtMFNO?=
 =?utf-8?B?b3MwV3lmUW0vU0ZxVXNxenM0VWJOeHRvQjdMd3VVMzBoV05jQUNPV0t0bHR5?=
 =?utf-8?B?WVQrazFycDk0SlNZM3ViSjh6SHVLL012dW1keTQ3ay9CbDdKWjdtOXROU0Zy?=
 =?utf-8?B?WHFVWTNwUjl2WFdpUkRybEZUZ0M0UkpUaU40WVFOdmFuMTlpWVppb0tTWE9v?=
 =?utf-8?Q?LOzwc4riCXznJuqggUwfWo8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218490c2-5327-4371-0061-08d9dc3f3fae
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 18:04:06.2803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CQBGZ19zagKhpisUK30adlr2rA56lM+MWPiljHWRGe0wSO127g43Aggp2WODrl36njz7JPEHrpiJZEorc3DiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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

Am 2022-01-20 um 5:17 a.m. schrieb Miaoqian Lin:
> Callback function amdgpu_xgmi_hive_release() in kobject_put()
> calls kfree(hive), So we don't need call kfree(hive) again.
>
> Fixes: 7b833d680481 ("drm/amd/amdgpu: fix potential memleak")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

The patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

This kobject_init_and_add error handling semantics is very unintuitive,
and we keep stumbling over it. I wonder is there is a better way to
handle this. Basically, this is what it looks like, when done correctly:

    foo = kzalloc(sizeof(*foo), GFP_KERNEL);
    if (!foo)
    	return -ENOMEM;
    r = kobject_init_and_add(&foo->kobj, &foo_type, &parent, "foo_name");
    if (r) {
    	/* OK, initialization failed, but I still need to
    	 * clean up manually as if the call had succeeded.
    	 */
    	kobject_put(&foo->kobj);
    	/* Don't kfree foo, because that's already done by
    	 * a callback setup by the call that failed above.
    	 */
    	return r;
    }

Given that unintuitive behaviour, I'd argue that kobject_init_and_add
fails as an abstraction. Code would be clearer, more intuitive and safer
by calling kobject_init and kobject_add separately itself.
kobject_init_and_add saves you typing exactly one line of code, and it's
just not worth it:

    foo = kzalloc(sizeof(*foo), GFP_KERNEL);
    if (!foo)
    	return -ENOMEM;
    kobject_init(&foo->kobj, &foo_type); /* never fails */
    r = kobject_add(&foo->kobj, &parent, "foo_name");
    if (r) {
    	/* since kobj_init succeeded, it's obvious that kobj_put
    	 * is the right thing to do to handle all the cleanup.
    	 */
    	kobject_put(&foo->kobj);
    	return r;
    }

Regards,
  Felix

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index e8b8f28c2f72..35d4b966ef2c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -393,7 +393,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>  	if (ret) {
>  		dev_err(adev->dev, "XGMI: failed initializing kobject for xgmi hive\n");
>  		kobject_put(&hive->kobj);
> -		kfree(hive);
>  		hive = NULL;
>  		goto pro_end;
>  	}
