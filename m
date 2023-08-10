Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BE57770E4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B3510E4BF;
	Thu, 10 Aug 2023 07:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6BA10E4BF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 07:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpzm1qEDqJILJTrY0eHFJ2F4v7aGPBzIZkV32dU1P7hcDX35x1DqJTbkRPywDxDI7rgxAdS56KSinsJH1LU6oBHxvmGZY3FaLuv7OZDJ406OOva8/B/xlDoU8fd9/+zNJ70JDewuwAn5rxQSOJ9tbw5gDi16sMPoqeR+go5Lv6J/b62F+YSXx9bdlMRreA2nDbo67MGz/0CNnOK++gxb6a7cHm6JRn+Gb3pqksWKk3njL53R1sB+bTr3tP8Vf96hrycUZVn0ruN/aFuFFRgm9OXbxfmxUAThKtAObPVHB7BGQH5x5JBt3bNanS4ZyUvbT7Mc1rvWU+AnoQ+wbOcZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HDykQZIAm9O/d7+JDZmRKqCtSD8Z2d/TPB+dNzmHpQ=;
 b=XtsJuW9d2XGhR55EtREdzbjml7jUAfz/cQNmHO+M43jl3nnzSXQn0FpzrLDnj3LmOPrFUuCgB0eBWV1atArN9rtYMAXBEoexzDr6YOzuq/QHvnoO3C1flGqiIeI4Aco+Zj5WE74yjly5wu46ISBCnPYBgWjkDSkvj+YB8VbaEQDmE61Ud7Xjc+Y7PCaSTCg7KIyaU35cdKVQMxpzPLLIsu+pHovXxU5H9HiBdhWnQyQwOfxE+xdFSVMpx6MUKnd9gqOqxtYNRIoQC+oH8CDxamPJp+RidfTiUo8HpBSG6M3iygXjOuYSZjpUI8rs6ojN1rz0pPAkK1lPwxJbHP0aSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HDykQZIAm9O/d7+JDZmRKqCtSD8Z2d/TPB+dNzmHpQ=;
 b=OYo2OJDTFlM2bwpt9RlFJYmdm0RJHrj9KfODR6ksMBSrIUPYwI/WhClNce3DAncpTte8thYFE8yDnWcT0ulY+Y/rl95LJJmgn5n8NgKXBNlnPcb1XFdU2SNvB47LMjnUsuawtmT4oKZ0goIrU7efV3M0GcOyBh+F6GLMjmg0rFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6763.namprd12.prod.outlook.com (2603:10b6:510:1ad::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Thu, 10 Aug
 2023 07:03:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.028; Thu, 10 Aug 2023
 07:03:20 +0000
Message-ID: <37a235d0-3da1-85c3-766d-29fd31d8a797@amd.com>
Date: Thu, 10 Aug 2023 09:03:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next] drm/test: drm_exec: fix memory leak on
 object prepare
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, arthurgrillo@riseup.net
References: <20230809225034.8803-1-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230809225034.8803-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d5ee40-489e-4a41-b0e7-08db996fe155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vmt0BhIq2xRKiBwwSGAscuHLmLiSqYC9fOND58XaJZ//52yI2X+c5R26bpZcHv35JOE6pWVLXMXKZP+osjfQLmRqe6pC1uQAmdmXu+RzAOF+VqveKp4TgCAixbZVxAF3Y7JKc2uEcB2nMF9kZDoWkIZneL9Q8ECse06OdXC13od5bH+EyydpVQnHeXcbYSUfGL+2TJCIFiDK987sv/gDOJ8/mR5nq1F62a1n1R1j+sdbPNS8ECdG+uTAQYzVsXzBtC/46RiJYPg3Z2XabZ0cXmgGSVXXNfK6ylP4JRpHxCN0Znd8TlA3RJCNEqrp8RDg2kiMdpbpGyNGArxlimBx4uzaPm2u8TGAWmtThOznkcafUUjqTUw6PUefe3pvdtthk3NKQFxk8Ipbd8eWyww9xluMceHjLNpY0nNe9ZqNYfwFbuyqCDFM5W9Zlqku1DnHOAYylM0eBNFJOEFoK+u7MitZU2A/JB4aJ2P+dq8ZEblBJHbKJFlh3AzxYzkBPgeGWHywOr6jNCG/yE/wt+Uz8nrLGgv1OWx4ctBSAacB7CM0Rki6VDO8rrLlzLelwjdRgLwZ3+I13nvIikNtFUR4kMCeDLshSFfgV8yxvCSiiLFrC+kYrZPJO2LGxFKCvsH3jxomVb0gLuRhAk3tCItwGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(186006)(1800799006)(451199021)(41300700001)(6486002)(6512007)(6506007)(2616005)(38100700002)(83380400001)(6666004)(316002)(2906002)(31696002)(478600001)(86362001)(66946007)(66476007)(4326008)(66556008)(36756003)(31686004)(8936002)(8676002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkFCb3RXQ3hJZXduTnJJR1NHT3IyUkJ3MXJNbm5WZzY1bnhCL0VqaTlscExF?=
 =?utf-8?B?LzZzZVRNM1BJRWJGSS9qdk5rVEdhYXVSK0tyclVBVUlKOS9BVUV0VTNSTFZs?=
 =?utf-8?B?ZkpmbDlBNU5OT0JqWkVTa3ZRaUVxT3JSTm4vM01ZemM4K1dvMmFLaU1OOG15?=
 =?utf-8?B?RmdhMHd5UVZDZVRUQjc0aUhiZS9KOGFrOHh4T3lBdEdjQjFXU1ZUby83cndi?=
 =?utf-8?B?NFFXQ3R1VGZiL25HUXZqcXBSS0UyVEs1bTFyaVp4SEowamVSQkcyblJiRkZz?=
 =?utf-8?B?S2tqOTVlWFBMTlZ4ck1ESUNLaExKaERqV0dEY2lhNi9RQmJwSk5lMzQxSzdj?=
 =?utf-8?B?ZEdyRERkbFZsMnJoaTJ1amdvTFFpQlZ0REhmeDlMeXBXdE9LTys1enJuN3ls?=
 =?utf-8?B?RzBVc2VMbTg5OGpDTzc4ampDR2xyRDNsWHRhNWJmQlFld081Um5PKzB0dytI?=
 =?utf-8?B?TVdqdHh4eWpqdlVQekhmYldjZlhmZ0RMRjQ3VVltalR1TGpWSWtlY20wbGxr?=
 =?utf-8?B?ODN5cVp2YWpFdE9XUHNpM3pHdTF1TXFsOUllbUYyRUJ3d04zK1RBZHdiNjdy?=
 =?utf-8?B?U3lVTHZFdmZjUnI2OXpJU0t2NUNnUzVVak5RbU8ycE90RWhkazNRSUI5MUJM?=
 =?utf-8?B?MUk1ak44VVdQTmdSSmZwNWUvWHd4ZTMvSVNHLzdNMGhmWTg5d3NRRlJNR092?=
 =?utf-8?B?ZEJxWVhUS2ZOZ0lnMXB1aDlWTkZ1V25ZSVlNMU1naE5XOWFqSVltOWpNby9F?=
 =?utf-8?B?WEVtRTV3RVhZOWhCOFcySHMrSGxFS05neG5SWUx5blFrVFU1QVVPL21FVTRE?=
 =?utf-8?B?ZkNyRTROSW9yREZZWDl4OTRIOFk1UlFlcHV2VU8zdHp4QklPc1hBeFlNVlQy?=
 =?utf-8?B?SitwZGFTaXhCTXBvSkc4THhoUThhMmQxblZNK3o1eG5SeEpTWitUeThMUWYr?=
 =?utf-8?B?aG9UMzBienNwNU1KZU1tNHVQVXNaOHFmTGJPMTQ0aWE3dm55d1R6VzVxNUhV?=
 =?utf-8?B?RmJrazY5UEhKU3o2c3hnRlo5MEVUQ1NDMmxMZjI2TE14cFN6RHJxR1EydGtw?=
 =?utf-8?B?T3BYVDI4SW5kUDU5Ty9YZjRKQVZxMTlWRzFkU09DazNhZkdTUFMzbGRTclNh?=
 =?utf-8?B?WkMzTlFUYnlrOFk2YWdSSnR1cWlMWStuUWIxMWlqVnozeHd5alYxNHdJeWZq?=
 =?utf-8?B?K3UzdnBOK2Jwb0IxemVVcitJaXFtaSs1MFB5VmVJWUQzVm5HNVdYTzJUVHY0?=
 =?utf-8?B?ZmZFUkl2WVdjSHlXWWV0Rk9vNDZIdHhzQTlKTnVEWTYyM1lHV1IvdzRmdFFp?=
 =?utf-8?B?QU8yUzFFVU4xdXFUWkM4MjV5R2t0eXpHZGtVUEJNdW9mSHkwK3VRQjRvNnFF?=
 =?utf-8?B?Y3dDTE1rSTZETStnOHBTQ3Z6cFhJUkEvclcrMVBZMFpjRHliODJnaTdTRXJB?=
 =?utf-8?B?UjN4eGlBSytwZ3JsNllBT0srWmNVQks3TExFOXJYV0czSDlia0UrSkMrN1c4?=
 =?utf-8?B?TUxtN1ZDUWxBQWUxQTd2SnZnSHlRWklhSlpxWWxNTTVodFlub2VSa0dCdHVm?=
 =?utf-8?B?TncxWXJOZFBmSzVmaWx1V3JJZVBGejEzekJVU1NsVUhpcUVJTXhhTi9mbDFM?=
 =?utf-8?B?TExZMHNHdmhoOHd4dVpVUGdBSml5WkZOUUxYbFRreXp6aHJZSFZBek5VM3d5?=
 =?utf-8?B?bDk1N0VqVjV4ckdrWmxqWVZqV0xBbVk3VjFGbnhJZ1NwYVZPYU9WZlpiZ3hR?=
 =?utf-8?B?MlpGRWJ6cGorR0JDcE1mZGtjRHo0eEdURXFZNHhSNU10eTU2dzg3b3BoYXk4?=
 =?utf-8?B?cXBpaHBNN3lBZG9Wd2pua0hQbk9QSmZ0am5JckxxdS9lS0ZzNGJZTmxHeFFR?=
 =?utf-8?B?YUdNR2lmbENyNEN2WG1uTzFqOHFvRUFjZkM0Y08zWHl4R0NYUmxHOFYzZ3NL?=
 =?utf-8?B?SnVCQU1nRzBjZ255RUhmRFFHeVp3VnY4WXJHSnFmblA4cDhZVVltWEx0djJK?=
 =?utf-8?B?OXFab3BRZmM3bzNLVTVmMkFaa0FXTkVnckJWMmVQZi90MFNrdHhJM0kwK0o5?=
 =?utf-8?B?RjlyWXpRb3N4TWV4SU9tbW91R3A1V3ZlQXM2dnVsUDQzdUVWWWxiOUNWa3BU?=
 =?utf-8?B?bXJNRUxRUStFdUxpYkc5NTA4cE9VODUrbTNRbFFWM3ROVTJLZUR0b3BrS2FF?=
 =?utf-8?Q?w6iir4wx01K+Z3n8ejKjmBviVUINprC7zxOD8s+qwur1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d5ee40-489e-4a41-b0e7-08db996fe155
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:03:20.7015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgpSnkdxBy00RF97itzob8GcWic4exRDAyTWsK7HxTWTRbAE1qOGbo851YfCz67p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6763
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

Am 10.08.23 um 00:50 schrieb Danilo Krummrich:
> drm_exec_prepare_obj() and drm_exec_prepare_array() both reserve
> dma-fence slots and hence a dma_resv_list without ever freeing it.
>
> Make sure to call drm_gem_private_object_fini() for each GEM object
> passed to drm_exec_prepare_obj()/drm_exec_prepare_array() throughout the
> test to fix this up.
>
> While at it, remove some trailing empty lines.
>
> Fixes: 9710631cc8f3 ("drm: add drm_exec selftests v4")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed and pushed to drm-misc-next.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/tests/drm_exec_test.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
> index f79c9f0359aa..9ccf0dd9ca89 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -125,8 +125,6 @@ static void test_duplicates(struct kunit *test)
>   	drm_exec_fini(&exec);
>   }
>   
> -
> -
>   static void test_prepare(struct kunit *test)
>   {
>   	struct drm_exec_priv *priv = test->priv;
> @@ -145,6 +143,8 @@ static void test_prepare(struct kunit *test)
>   			break;
>   	}
>   	drm_exec_fini(&exec);
> +
> +	drm_gem_private_object_fini(&gobj);
>   }
>   
>   static void test_prepare_array(struct kunit *test)
> @@ -165,6 +165,9 @@ static void test_prepare_array(struct kunit *test)
>   					     1);
>   	KUNIT_EXPECT_EQ(test, ret, 0);
>   	drm_exec_fini(&exec);
> +
> +	drm_gem_private_object_fini(&gobj1);
> +	drm_gem_private_object_fini(&gobj2);
>   }
>   
>   static struct kunit_case drm_exec_tests[] = {
>
> base-commit: e05f3938c5a7896d09736e3381675a57ffee7a0a

