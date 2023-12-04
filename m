Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3CF802CF0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 09:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F26310E073;
	Mon,  4 Dec 2023 08:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291A810E24A;
 Mon,  4 Dec 2023 08:17:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXbOeMgfQgGaSHKWZbhM961oCyaii9EG7bLWL+yNrh2l6IVyEB8hJFuzvKZWxm/MsTDoG67FZwPTX/hBjJQ2FLK6Eid4wSC3Bb4Tpmmer4liN1NRC+D/iLuFukDt4xfduMC2NbTwg+jp0m/WoKg4F2mX4AjZaV9bAj6Y8KcUFtwDrAGHSmvOjpA+uBlzj/gYXA09zCrEYyw1HYQjj8SKZJntbep5xsM814V9zqChtPYtzhPXJMK5uCiOyqxXdar2e9IrKExlrMDBzheAkx2RqPpc/6q/vO+ElSPcFrGp3TE0FoY4exDfm3vgM/fH6jrX9+/7+aemzMOF+mSab6WGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUIzeH2XlbJ6uHQOaYfMV3yxkk3kshdGvZ+d1FNqWgo=;
 b=V3XLdarkGM85jPq5eDG9AgiTtzqtOZbOShTJ1q9juqJlsytL74R/Aqa/+Ys1ue2AVUmqPv42azOemWmXJQ1NyWyBND6IfOjddbC8AFNz0dJpLWYwB1Q5Qb6zbGv+MHyYV+XUWUib53rIpLFSFCLwcuruiWzYJHYn7YO9MSm38WVDYjdgeedmoORjZtxCq0SMmbmTWLaDQNkUGLcSmpXlxv2AuE7+qFx4Rkv0WgtkO2P7FfLHULJ0fVwnJeZ/kYmEkPL4ThEaw6IBmqNjdWCqyFscK4vwnJMBALt0fzIOPmKao0PzaU1TBNhz4CuJCE6GAIyjRQbY7Lm7KVjnLeDwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUIzeH2XlbJ6uHQOaYfMV3yxkk3kshdGvZ+d1FNqWgo=;
 b=YekJBWrT0fBazRTqF805+DZY2KoYM14/MkMHnpHJm0yKyutTPT9qfUiv6a3KYWUsuZ4yD+YSAt+VBYXGDgKg0a9QLma8zv7dfgaA9/gtnMdeRVBZT7vVYi5LLRD5uHgoATUQ/ajEzfCKzKqu5p+74BrAM2Z9IsV/wn6JN2JnpIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7130.namprd12.prod.outlook.com (2603:10b6:806:2a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 08:17:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 08:17:14 +0000
Message-ID: <b1fa2827-61fb-4594-8f80-e5083be8d5fa@amd.com>
Date: Mon, 4 Dec 2023 09:17:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon/dpm: fix a memleak in sumo_parse_power_table
Content-Language: en-US
To: Zhipeng Lu <alexious@zju.edu.cn>
References: <20231203171643.3287229-1-alexious@zju.edu.cn>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231203171643.3287229-1-alexious@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 674e21a5-6d1c-4a96-da2f-08dbf4a16c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qIfJ2ZHFVc8RC51v/R8WMtpeUzkb0N7QgqUD5g7/9zXiYEHa6V+uLMRyUsxVwCH5Tp7VwhFoyBXxh0pEDAY9xAHLZjMfdyl0wrpYW1a/7pQJcQpHlgFf5RJkqWqW0XCjap9rL61+z69YsLAHMaNPiAkHV2pTDekbYm5SMMvIRGmFu6Fdab0VDRoyNar8lF1soxTnEfJV6xlcCpDHbj+B7n/he3PHDCXB/+NfkXiHcz4LO9cJki8WB+mVHvVw1EKRq+8UuE4XsmDU7sgYqXe7N6jJdAFKiLCsXc3VPVY0rckaTRAmCLQKbbTFVPVSF2OLI5mzLUML0sbG07CaJ4wJrdQBp4Sqg7raHgKiHq6J4DPiMd7lmscJugAdQGhY3zCDsxZwD94xQYwwq+w2a8RnJG6WrMEBEoxN4lX+nAIek46Sc+MgDexIodvavTJljsjbGrtl1wEWaj0x2eW90jZsNof7S8Y3OxNkligNDE+i5sP5OHyjbJ38yPCFCJ1jbWZqFPkCXRpPuKJ4rcZ/ee5TtHTAmCYBJtrrMUzaobZyDFbQJTj4kVsViG5Zg0BKU/AyZdL72UeogOIjyaCpArxUvmCkx0YBviKfGiZ5CUVb4xjTDgJfVFivDZG5BiLGL9RXWZzVUKUiiGVrGzQdNtbtqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66556008)(66476007)(66946007)(54906003)(316002)(6916009)(478600001)(6486002)(6666004)(5660300002)(41300700001)(38100700002)(36756003)(2906002)(31696002)(86362001)(4326008)(8676002)(8936002)(31686004)(2616005)(83380400001)(26005)(6512007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekxXZ1RqNGFqbGU4bWpEbDU2NnZNM3h5YWwzeENkSXJXQitQc1laK2RZSVJj?=
 =?utf-8?B?SVplT1h4ZXM2NW9tZ1FEaGtFaXhibDBGZ1VPSUFwQmFYUzVWTDhxUDVac0c5?=
 =?utf-8?B?R1BUbTM1cXpUVDhGbnMrVWpqN3VkNDJSWkdSd1lQS1VZNnhjOVlxS294Q29Y?=
 =?utf-8?B?OUhQcUNFNWpKZGczMTVHUXJoMHMySGR3K1RqbmFETjlyUHpaYi9KZnNhblBs?=
 =?utf-8?B?d1BJZEprMEVXc1NnSGU1cys4cHhnZVFZTFRxa3l1cWM4VmlFcXRSQ25ZalJh?=
 =?utf-8?B?WXEzZVIxTjZyWHlBcW9TMDlyUFVmdmRWUmFwY3EzQ3FDeHJBb25pRmxWQWY1?=
 =?utf-8?B?UHppM3BWdy9iYXUyMFYyTTJvTjRzcmUzZFFBWkhWVXVGdGZVT2dWRE43ZmhC?=
 =?utf-8?B?eFFrZVUwZW9VaktQNWdaVmhNNWJkbTlDUWdjc3VvVHdBcWxqOTVsbEV6Wmtv?=
 =?utf-8?B?Y1JsNk1VMWplVXNoS2FSYmFJUzhJZ2ZTQ2JRR1p4OEU5QUFYZEY5MGF2K05l?=
 =?utf-8?B?YkU1NHZtSnRPcWRMVE5hQWIwMEhybkxYZ3RQM1FVTkJIbDdiQ1RVbzU4OEw1?=
 =?utf-8?B?R0pxQ0dCeDV1c0RYWGRUbk1sT25WVUl0ODR6ZVVKeFJXbG1NWm9ob0pTNVl4?=
 =?utf-8?B?cHF6T2daQTVlSURKSWZFU1JJZS9tS2RoMk9hUEhGdmtJYmVmS3FYT2VYeFRO?=
 =?utf-8?B?OW5WU3RwL1lmTzF0ck1MbFRxeGN4WXJLRDQ1c1U3TzFwT0FLYTAvVVliUEJ0?=
 =?utf-8?B?QjRWUmNsbDk2SG1pT3p5aTMxeXR0dG9laSs5ampJbk9NZzNtamRyallqNDh5?=
 =?utf-8?B?Z2t5bjlHY25HQlZrWGJqTFVRMkk5dXVMallkejVhQk5ORWU4S2I4OFhsZWsz?=
 =?utf-8?B?MWRsdUhQNWNNSjJZS0hJODlEQ0l4TE9XM0dZbXN4YXh6aURXc2Y3dWtZcy9W?=
 =?utf-8?B?NnA5VWx4RFlYY2RQTGZSdjhFakxTZ2xzeWRvTXUyUkZmOHUvTXlNQjVCckFK?=
 =?utf-8?B?djBEQ1B3NmJING5qdThRR2x2VHhKa21JYTlyMGRDbnVNWTRycmY0UUF3ZW1D?=
 =?utf-8?B?TGkwYUxablMwTTQzc0ZHcDdVcTh3cFVidXJJbVJJNEljcjJXWFBpeWUybm5R?=
 =?utf-8?B?MWxoVWtnU2JnbmpTbjMzWFB0ajVmbDhJOXhPemt3RVpYRW0wL1g0Y28ra0FJ?=
 =?utf-8?B?Tk94b2xOais1U1BOWWs3Zm84SnRpTExscDJUUGhNZmVMNUZkdGowNVhGRUdM?=
 =?utf-8?B?aU9RcHBycHFhY0ZubWVVRVllUHhobDR5aW95aVl5WTFZR0RWMlJ2NUd4M0NE?=
 =?utf-8?B?VHJFZlRWU3VORlh6OUFDSGFjeDJmcFUya0JZWTg1RkRSR0RKL0NjRmZTTjh2?=
 =?utf-8?B?V251a09mNmVqYVBqWHYyQVY4STRyNThCMS9UbHNxSFlOUmVCcHVVVjRta2pJ?=
 =?utf-8?B?K21Ga29yc015Tzg4K010ajZmQ3VmR3liWHN3UldzNDJpYWR3WWoxcjA2T0l0?=
 =?utf-8?B?R044TlZ2Q0FVZEY3dTh5MDIyVStucjlkS3dxUkRvTWY0QnJ3bUlVUlZ5TjRH?=
 =?utf-8?B?RkwvM3BzSSsyeHlxeEJ0RFJnUkJWSWp2U0x6RVVnQUVvcEgxMFA5TUJRVWk5?=
 =?utf-8?B?MXJOMkpxeHJvTlR5dzV5bFNwZkFueTFiRVlTbE04WEl0M2NJRkZWZHVJRXV6?=
 =?utf-8?B?NnROamx6UVJWTmhpbmJ0TWFZeUVGemJHTTVDNFpHWVZpeHJlQ2pEencxbXNM?=
 =?utf-8?B?RU1uTlduemZvTVV3bklwSDN4NjV2WnVNZ1hrZEVRbmpjbGk4aXlMdndhbXpw?=
 =?utf-8?B?T1RvOC9mWGJEemdJYjllTFVlYzUwWmhPakRrNVlRYUN5RlJOLzcwUTVJWDh6?=
 =?utf-8?B?Rk9oMHVwekRQck1pL1l1SVFkemlMSDhLaTRLd1Y4VFYrd0VQVXN6T2EzRVBv?=
 =?utf-8?B?Z2IvOEdMYjgxeFVrTTNGYU9BSDBjNHpZb2JKb3FFZXRSempQREZjODNRcjN4?=
 =?utf-8?B?anRCTW4rWnpkY3A4QldraG9YRmFnaUJ5UFBmMEIwdmZPZVFEWksvd3hNam9G?=
 =?utf-8?B?Sm4rYzFNQ05PNHFMdEtCL0FUMjNSZmhTVWI5dU96cEIvV1ZMMGtkVHJydHl0?=
 =?utf-8?Q?D8N4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674e21a5-6d1c-4a96-da2f-08dbf4a16c04
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 08:17:14.4971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJEJYWj9CK0nSrLexIkLuzjBWFqWl9q4S1KDzAycqCpO4Wy1Fjvk7twm11HX7VLG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7130
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.12.23 um 18:16 schrieb Zhipeng Lu:
> The rdev->pm.dpm.ps allocated by kcalloc should be freed in every
> following error-handling path. However, in the error-handling of
> rdev->pm.power_state[i].clock_info the rdev->pm.dpm.ps is not freed,
> resulting in a memleak in this function.
>
> Fixes: 80ea2c129c76 ("drm/radeon/kms: add dpm support for sumo asics (v2)")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
>   drivers/gpu/drm/radeon/sumo_dpm.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/radeon/sumo_dpm.c b/drivers/gpu/drm/radeon/sumo_dpm.c
> index f74f381af05f..bde640053708 100644
> --- a/drivers/gpu/drm/radeon/sumo_dpm.c
> +++ b/drivers/gpu/drm/radeon/sumo_dpm.c
> @@ -1494,6 +1494,7 @@ static int sumo_parse_power_table(struct radeon_device *rdev)
>   		non_clock_info = (struct _ATOM_PPLIB_NONCLOCK_INFO *)
>   			&non_clock_info_array->nonClockInfo[non_clock_array_index];
>   		if (!rdev->pm.power_state[i].clock_info)
> +			kfree(rdev->pm.dpm.ps);
>   			return -EINVAL;

That change is obviously not correct since you now always return -EINVAL.

You need to at least add {} here.

Regards,
Christian.

>   		ps = kzalloc(sizeof(struct sumo_ps), GFP_KERNEL);
>   		if (ps == NULL) {

