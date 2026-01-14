Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59843D1E20C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 11:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B6210E3BB;
	Wed, 14 Jan 2026 10:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TrJZHbs/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012022.outbound.protection.outlook.com
 [40.93.195.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE8A10E3BB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 10:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSI5IesaY3Ov78LjNu3TeGcpMsPAdfKMZr6PYeoCylmVJvp0y6XWzYZIxfOHdNThNXm9Ufj8GYNUOHWgrct5QbhMsBY0bK/4rwh33ACCa9IvQcma96Tt8vnxMAeflWnzmYiWHv5ETdJgN7+9uVoggY/mT3hU2EbFNhW1qRxa/OdFlzs9C0Wb8/4okfsvlNjWtfrdfreKoO8aq7aHyR9AKK9Ue9j9mhDgLy8fSZS9BTWf9oSWkWIrYwbuqqQHzT8XI0Gvl+Y9BoUmDm7jCSQWJ6nQfJ/3D5beelxIFMzh+bG9VzXYJKPzWs2xvkw/wXx1BrxxrqXhjnYVGRTQlpMAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWgeEe27BeP8IYGIaboyUBO1koeHQeV1ZieLWC+t2ko=;
 b=ZkWgUD379lmrYZt5+7qBU+Rm7eHfnDPbcl2QmeBiQmnPPJXUTfidFiy8R8tgXP8xuPUo0GzD+AbdWzr0dRqze/xosd58oFR7mhHJ3vfvo1o7hkWUcrnIp58MXLMXmbBUnZtTBjrhoEuETxJqFTJuExrhY32OH3KDOo9rY94s3bUojIY7cXCcEq3yKFk1EUXxtG3J3fML7wltPsN+lv0+IyUKdGRkluZ3TyPBN/RvD8SVkYINUilsftRfiBI+/ZJPsUdI5KRGs8iUN1iUZJgBfhcsygyFd5jUD9RlfPIbK58XDvYLNC5ILmyS7ksCM253eNopsd8vWDV64bf3mZheWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWgeEe27BeP8IYGIaboyUBO1koeHQeV1ZieLWC+t2ko=;
 b=TrJZHbs/T9oKbw++ne5HOmKTBWVgvqYq66/+XTZ0sAK7w13JW39DoPM6tw3w4MhTavoUGkkPnZrH1bdGwgadHDMjAgLunwoadRCMx9yh69JdE1kGxpGWRxDzs/KL37lGZjrxB+i1FX6+ABRPZA4UcpnWOks5NNpFXo9/hwf33xg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB999096.namprd12.prod.outlook.com (2603:10b6:408:353::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 10:38:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 10:38:33 +0000
Message-ID: <7a0fcf24-09de-4f6e-8a0b-7b631b1315bb@amd.com>
Date: Wed, 14 Jan 2026 11:38:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dma-buf: system_heap: account for system heap
 allocation in memcg
To: Eric Chanudet <echanude@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
 <20260113-dmabuf-heap-system-memcg-v2-2-e85722cc2f24@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260113-dmabuf-heap-system-memcg-v2-2-e85722cc2f24@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB999096:EE_
X-MS-Office365-Filtering-Correlation-Id: 4309b31f-0664-4d22-0836-08de535910bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a25IZVVqZThnSlRMUElwKzBPYW12V3d3c1FEbEt0UVRSR2dBNEtHcmpNL0Mw?=
 =?utf-8?B?Mkt1QlpaQTV0WFdPTDBGV3BGTXFiSkpaOWViYUxsNUVaMGFRQU1VaGlTVTEv?=
 =?utf-8?B?Y0p1T0RuWkZZZE1IZzlkTlNjakliMmhRK2llL2RFa01qVmI0eTFEaWMrNENz?=
 =?utf-8?B?bVhsZVZrcnRnVEpFRkt1SUE5V2dtR0ZOU3FMTFIrZ1pqYkE1RUJURkFZLytu?=
 =?utf-8?B?V3BLMGJqSzE2cjNFYjBvMmFtNmY5cG9HNjRPR1ZvTUVwbmlWaFZjSTdxa2U1?=
 =?utf-8?B?R2JVNXlsMU54REhyaGNxTkF4Z2NDeVE4c2JWWkVKQW9TekNKaW0wRUhRdWhi?=
 =?utf-8?B?RmQ3SXc4eXNuTHFnSll1RWNrSng4OWpldjdJdnp4dE9BRFdUQk5aYnhFc09a?=
 =?utf-8?B?R3UwKzh2a0ZTQ3ovR3ZTdU5nUTNJRUY5cUR4VnU3WEJ6aFRNSWNpaFh3ejQ0?=
 =?utf-8?B?TXdlNjRsOWVnNFh4cXNLSjl4VjBZaEdjQ2l1c08va1lxZkJIcXY1OTlaUkc1?=
 =?utf-8?B?cVRNd0FueU1RQjhRZWlnM3pna3dyd0dZOTJvcDl3NnNGZHlIelljWEtRSlN2?=
 =?utf-8?B?M2R5eXY5ZklmdHZudXJCV3lPSU1DQXBRM1MyaDNNS0xQRHdZQVdQQ2x4UGdp?=
 =?utf-8?B?ME9uZEdGeVE1MjRucFFlVkozNXpNQStwMnh6NnQ2RjAxZy9aclVNR1JjYlhB?=
 =?utf-8?B?NWdsMjFFNlNidTdHNHg1Z1RoTHdMRzYvcnRqLzVuaHkzOVk3YzlGRjZvUGJK?=
 =?utf-8?B?NHJnTGRUSjZvZzlDcUVUS2ZJbEpWUjNHWUlPTlRDRFVXcXRETEtySFIzUm0r?=
 =?utf-8?B?S1p2ZXhKb2NVSks0eE8rRnlQNzdWSU9QSEluNWRrTG1aWFdHRlpuYkJlOGVQ?=
 =?utf-8?B?TVU2QlRqRmdyQ3ArL0xxdEVuQjJyT1hqSWRtZkc0aCtiaUVGdVFQYlluUVRk?=
 =?utf-8?B?UllUU2lpZzFOSmt1Umw2S0gvRjR2UWQyaEpiRVg2eXpkSEkzaHlhU3JON01q?=
 =?utf-8?B?VmdkbEpnbG9tam5DZCtodE81QzIxc3NnMmtjYlF2VzdiM3BVY2ZncDRvTUd5?=
 =?utf-8?B?Y1U1cEU5VTZHYkZTTXJ1cmQ4VjY5eHI4ek9EK1l3QTUwNWg1ZTJ3YlROUDdG?=
 =?utf-8?B?QW4raFBZMmdacDk4K1RqM1RZMzZ0YktqOTk2VisrRnhXVzJERXczYTRvbEZu?=
 =?utf-8?B?VkJmVHdlVXhEekQ0eENsTG9pUm5CZTVjcVMzRiszd2FHZUxUSkdjM0F1bURO?=
 =?utf-8?B?dW5RaFJCdFVHRjc2ZHFyanNkY2M5SjVLbUp4S3k0bUlWZ2M1cFBmVVA0a1hw?=
 =?utf-8?B?MVRrdGR0bmhFQmI0c3hmbnlnWjIrL1A5eHdwbzVlekp5VlljNUF0TGJ3WnI2?=
 =?utf-8?B?Y3VuWGZNSVJjOFduWW1vZmRjV242c1A1RUd2dUF4SjYrN3RTU1NkS3RvelRW?=
 =?utf-8?B?R2V2Zy9PWVRrSmlZYXpiV0JkTVpiaVVjaDMwK0dnNXJKcFhINUJ4N1hTVTBs?=
 =?utf-8?B?TXVHVHh3cWRRYUFkSXJKUmVPcDVmbXB5TmgxNFpEaHYwaW9NemgyRENzK2wy?=
 =?utf-8?B?NG1oTzBSam9PdWlEcW0zUE5nbWVYbmp0eGtLaWQzWGVUNmMxVHc4OFRscklm?=
 =?utf-8?B?TUxPMDh2TmtSSjcvcFZEUm11VkQxSzBnS2RNbFNzcGFvZFJVN250WTFZbG5T?=
 =?utf-8?B?U09hM1hCQks3VkZETVdYUGhsVFRqbWhoMHJEK3FtYk5UdVZ4VkNsVXVlaFR2?=
 =?utf-8?B?U3luUnJrNm5RL21zNXFtUlQxZW9GZyt2UldUTzdlamN5bXA2RUV0bi9rcEVJ?=
 =?utf-8?B?b2hQb2ZYaHY1NytOOUwxT0ljUlJXczA3VisvdGRrQW5JaUlqTDR1Z0thazV2?=
 =?utf-8?B?aFJNNk4ycncvTnpDOUt6Y3pZRnNvZzFjb0xXbnp4OExlams0ajE3Nys2U2JH?=
 =?utf-8?B?MDQ1eFFSQkFrUkNUR2RIV0ZZd0ZvWEw2NHNSUzA5RC92OWRDVGVkYTFvQzRJ?=
 =?utf-8?B?aG1SSWVITWFXeFpFcDQ4YW8zZ2s4L08rZVR6UnhjUy9NQ1NzTStaQlY1d0s0?=
 =?utf-8?B?My9lK3psNXhRVkQ4YTFWbThXWU9ERkxmdjFPY1BybXE4MHY5VTU3cHlvUjNR?=
 =?utf-8?Q?N+pw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ampnRHdXWU05b1hSVWxTMW1nZUhuOXE0Mm4zNzNSNUdNNVFKMUpEYVEwalZS?=
 =?utf-8?B?UUw2ekNlWnFyZkZwTUZLVUNBanlzYmw5M2ZySzI4b3lRQitHZU81SGtSSUxk?=
 =?utf-8?B?THFCZVZQaXlYbWFmeStOaVp2bkQ0TGQzaWxhZ1J5UGhwSWQ4c285L2RWWGla?=
 =?utf-8?B?QmZnOFZheHhHdGZ4UzBaaXJvaWRDUFVVT3NVQjgrY3p2L0ZqTklnSEFVdFBH?=
 =?utf-8?B?K1ZFWEx2Q2EwcTBzVS9JKytUeWltUFlwbm81ZXpESE4yK2Zydmt2ckxYNHU3?=
 =?utf-8?B?N2JCMmdYa09HTnN4cDU3UUMvbi90MkNYQWtxQ2NjbGRleWg1SmxDUzVXVSsz?=
 =?utf-8?B?cHFrSFFEa2dBZmZJUURXR0tsVUlkYjZ0OERCUk4raXVES29rS0YrSFdFYzlU?=
 =?utf-8?B?V21KNGxCYVArU284OWMwUzdsaEFZVnpiU0tPTkFBWEZERFFFTHBjTEIzYktO?=
 =?utf-8?B?M0Z4Vjhpb2ZiWGViejhhbDgwRlFtdnFqVjR5NEUxcFJwdGxkNkE1Q1FYV2Q1?=
 =?utf-8?B?RWJOSHB3RTlXN1ZOdXFkYk9pUUdkbHptT2tyQVdrWGtteUdLNEJlRUQ2RVZu?=
 =?utf-8?B?N01SMW5ZT0J3NU1vMmtPMFZOeXo2TllYdEY4K1JpQjVFQmFFajJlUHJIYm81?=
 =?utf-8?B?R0ZYRTF5YkNFakNaVi9GaHpVc1FiL0FZVzdlN2tqL2xUUXNKUnBuUVRUc1B3?=
 =?utf-8?B?alFMMGd4bDkzdFV4LzJ0L0x3Z0xqQmRPVUU2d1BLYTBoOVVPeldwNXExekRr?=
 =?utf-8?B?elNpcGhDVjZVTXB5bnM3YlJTeWFLV2hia3EydER1aklqN2RvS2FPb1d6QVR4?=
 =?utf-8?B?cGZyMFBvQzZHcWF4QmpxTGYwemVpT1U3b0JlR0ozY2Q0bGZBQmVvdDczSnBQ?=
 =?utf-8?B?ZG4xQVY3U1lJVnpISVBlQ2dkekxPUG9tN1NlcGhJVi92T3VndGNjcEExM1F6?=
 =?utf-8?B?SXQ1bzNTeFVJaGZIa3dTdUNtSE5oZ25uenFBQS9PdmlURU9UNDdMWkNmSGNM?=
 =?utf-8?B?MHpSU1ZuQTlCb2NnbjFqbERtQVJtd2FwSklyVXFHeTFjRGNuRTZIQkI5dTZC?=
 =?utf-8?B?aUpHR3ZqTHRubWZGY01SdjluMFRjTlRWTUFPVitHYzdob0Z2bnNYcnp6dUZ1?=
 =?utf-8?B?b25lSHQwQ1NZQ0JHRjgyQkxHUTVWdi9nUUNlcytoUFl2Q1dlc3NCMklHUDRJ?=
 =?utf-8?B?dnNVczdiU01wMVQzSmd5QUYwK29nTEhZcHNhNm8vRzZySXRDak5oeFgwSlg4?=
 =?utf-8?B?bEhhMjIxcDZPcXkrVXBNTTZpUk1vaVlFNElpckpOcTI5dXNhQm13TFVxOGpB?=
 =?utf-8?B?OHRUNS9rL2V2ZGw0M2JITmdtQUdvclpFNko5UWVRM0lIMC85Q29GWHBRSyto?=
 =?utf-8?B?aTIzMU0rc2JwSzlQTDhpSXlpMnAzTUxSMS9YSW1NZW4zNDNtOFhhbTR3eDlR?=
 =?utf-8?B?TzMzOFJCM0QrUGdYdlM4QUw4UGFCOGV0VXhCRWVMNFRiTFVvQTNZNERVNlQ0?=
 =?utf-8?B?T2JOVWt1cHY2bFZKS3EvZUYxUGEzY3k5VEV0NVhVa01wcnBGYWdXQU8rTDJu?=
 =?utf-8?B?VTZJY3ZRSjNGV1k4d016bGlPblk5aGQ5TUs0alE2QlZqdzJIcGFHeGZ1cjVK?=
 =?utf-8?B?SlJyKzNHTTNSaElmQStZSzBXeU9VN3h3blZOYmdHMXAzNWFONXdrT3hWWXp0?=
 =?utf-8?B?cWJKQ3lYclBBaExaSjlzeUNVOEptQXYrbElnTS9uVFFGWVFGM21xK1kzRUFi?=
 =?utf-8?B?QVVOUUdoNXZESnEvazAxT1FWV1RUVFRTV2FxTmJ1bEgzTllWeFN0cTg5emZN?=
 =?utf-8?B?NWN5WGFlRTJGaTBUWkJIbFdiNnVPK2N4c21VRHZNS3NpRFMxVFBUTVZLaVN3?=
 =?utf-8?B?VThNV0dBekZjY1J1SmMrd1U1cmJSU001U1loT3QzYzlaaEQ3aVJMK0lpNEVQ?=
 =?utf-8?B?VDBxemVPNzh1R3c1WEpON25lUWtaNW52U0FPaGlFN3h0TndxeFRWTi9hcjlG?=
 =?utf-8?B?WWtqWG5BTkZpYUlQZi9UUnozSjFOc2FvSE9HOHpTSHNnYjY4WjIyWnkrTFhn?=
 =?utf-8?B?bzMvTUxDb1RjalZtdkVuc2tIcU13bEtJS2N1OGFpUFQ1dk9yT1NoaTNrMjBX?=
 =?utf-8?B?SmVPem5vRm1qRTExaWhCOXlrUVNaUVFrdHVqL3Rkem93SGZHcWpCaGdZK3FB?=
 =?utf-8?B?WWRoMGNabnd5VUNtLzZUUzQ3WGVON1hORXVOSTl6dVc4d0RQWHV3TG5PMjRW?=
 =?utf-8?B?bVU1cm1ZSkpKVjlxLzNkV29IS2RpRTQyNlZ2WE5vdS81NWFWbWpSUjVOTndk?=
 =?utf-8?B?TWl5NzBjY3VaSDNyZlJMdlM0UkhJZ0tSTXNweDN5aEZ3WXFRazcyZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4309b31f-0664-4d22-0836-08de535910bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:38:33.2589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlEbDmhZJXS8sVorsoCpPzP27dd3+U+s9a6jBexyHcCR0LhtyW4dVNGNVOnpcNsD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999096
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

On 1/13/26 22:32, Eric Chanudet wrote:
> The system dma-buf heap lets userspace allocate buffers from the page
> allocator. However, these allocations are not accounted for in memcg,
> allowing processes to escape limits that may be configured.
> 
> Pass __GFP_ACCOUNT for system heap allocations, based on the
> dma_heap.mem_accounting parameter, to use memcg and account for them.
> 
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 4c782fe33fd497a74eb5065797259576f9b651b6..139b50df64ed4c4a6fdd69f25fe48324fbe2c481 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -52,6 +52,8 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
>  static const unsigned int orders[] = {8, 4, 0};
>  #define NUM_ORDERS ARRAY_SIZE(orders)
>  
> +extern bool mem_accounting;

Please define that in some header. Apart from that looks good technically.

But after the discussion it sounds more and more like we don't want to account device driver allocated memory in memcg at all.

Regards,
Christian.


> +
>  static int dup_sg_table(struct sg_table *from, struct sg_table *to)
>  {
>  	struct scatterlist *sg, *new_sg;
> @@ -320,14 +322,17 @@ static struct page *alloc_largest_available(unsigned long size,
>  {
>  	struct page *page;
>  	int i;
> +	gfp_t flags;
>  
>  	for (i = 0; i < NUM_ORDERS; i++) {
>  		if (size <  (PAGE_SIZE << orders[i]))
>  			continue;
>  		if (max_order < orders[i])
>  			continue;
> -
> -		page = alloc_pages(order_flags[i], orders[i]);
> +		flags = order_flags[i];
> +		if (mem_accounting)
> +			flags |= __GFP_ACCOUNT;
> +		page = alloc_pages(flags, orders[i]);
>  		if (!page)
>  			continue;
>  		return page;
> 

