Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A8D397910
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 19:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1822C6EAC3;
	Tue,  1 Jun 2021 17:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796076EAC3;
 Tue,  1 Jun 2021 17:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TelZBtR5vm4tbUWMjXzULTvvn+SjD4xx7NQIhroB5TGZxexGV6OEkMCJDnAvfh3FqbivDPkSmLk8biXLQxCFvofdJeys8By7HHxaljwuf9pH8E7FnvhtzQ1d8I1t9wMmXk/q5g8YjyiMwH1ZfE59ZULcjrD/xtFyIaDwulUllXxqKNrTMixlTE0xGa1UuSR2zCUGSxZR73/nhVmwTydU2hNEmcNlS/6XYox8FoowgvUj0hOoZhG0Hujt6tqArBfGg28rSeGP+ys9vTGeghPa9XlTzi8TB/ouJCpWbzncPMdte5rzOTatWh5KU7pF8NactSkGiYIAPKzbkK3OrU5BnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tdzlFVm6ftxDVlLBA7vJEhZGMT4Y4f/l0O8zwY04zc=;
 b=OEfCi4A4M++spqmzQkykzTW9gNDnU3/gilgkvhhZXb+1Ek4McxYa+hQgG8k3n7mo6zZvn49BTENAmh+z6rE/SvAe8FtWKIBluDQDQFytqSiXT+9xl+nRHhm+pqzHQRnftQhH/rJOK/58APXLdILGcwW20xLjrDnTh6Or9P3uS+KfnSFAkzP7+OMPG0OZsL2hL8BlldsTFTZu0OyclFE7ErP4aMlls6H1H/40EP+VSQeKv3CBcZc8mmBFqQ+lzfmExHBKMDNk2CgXdAbpQLOjD4rNq1QppGnA4l+c5ieGcl7UA8O8TCtvUZa/gydmBVYPdoRLkcVuacEb1Gj8hd95NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tdzlFVm6ftxDVlLBA7vJEhZGMT4Y4f/l0O8zwY04zc=;
 b=OK4qZon1pGrUL8SO3mWv4gkc3uqNBXygar4X47VN93vkpFkgJhmGT/NCbImT494A7+NaCTNiwRwSUygNo02Wu6a3NqpGEMpLk4+PWQYSbvn/vrwUWdsNRHeSrV1ptYxuKTzoDeypgyoMBL5+23HmrJUvzhPFPUDkMCp3jdjE51o=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 17:29:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 17:29:07 +0000
Subject: Re: [PATCH 2/7] dma-buf: Rename dma_resv helpers from _rcu to
 _unlocked (v2)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-3-jason@jlekstrand.net>
 <82e16239-e8ea-8b03-6a90-c7d18a5f8a91@amd.com>
 <YK922LEKObBz05CW@phenom.ffwll.local>
 <c092d91f-bbfd-7595-7f5c-73b3de703821@amd.com>
 <CAKMK7uF-xHwLCp_5v+quqOvZxeX1nsE8RRA13iQ+AdQUOm_ufA@mail.gmail.com>
 <4c7cede0-4e33-ffc5-6308-7eccd3570e9d@amd.com>
 <YLZFj3jNPcYAWTIB@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1c4dae27-f533-477c-17d0-d47a160e69c5@amd.com>
Date: Tue, 1 Jun 2021 19:29:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YLZFj3jNPcYAWTIB@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:7517:785b:7177:d6a6]
X-ClientProxiedBy: AM4PR0202CA0020.eurprd02.prod.outlook.com
 (2603:10a6:200:89::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7517:785b:7177:d6a6]
 (2a02:908:1252:fb60:7517:785b:7177:d6a6) by
 AM4PR0202CA0020.eurprd02.prod.outlook.com (2603:10a6:200:89::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Tue, 1 Jun 2021 17:29:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7fa9e64-8b08-47ce-ce1e-08d92522c266
X-MS-TrafficTypeDiagnostic: MN2PR12MB4144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41440AE7DEE1E105D688A488833E9@MN2PR12MB4144.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PmoYDaMU4mA2tLXUbdYu7q8M48Qob7LQPqdtxUn0+5BDaNTSLR4n21tcuF8y+QZq+OxSo2veiMSyFpPqZmjLFAYRxMQK9trjcmJHkJDcpbc64Zuu8kL8o4S/MfMt/vChkBBxylLblmB32XrFc/4aPW3n4TDg/r3JNl52/n7LRJQi+9m3e2j1dkMtdfhMEhFPq0Yna1/m/vdkj9n7DTaIyF+ESSPk3FNO/yifF1/E1oV+D9oXdtJbSIHVqCcxfyalhAUyv0gLmeXNWgvdIk+r7Gh57lWwwlgEkBuCzqTNa0/OWk5RBJEy//4J1AxHzrVOcB8r7ZeGtu0JbZa1HdafUaFiWNsyuwH4Pr+j9bYAH+ysdL0bH7gRV0eSy9AOUw+DKfYeoEeEmzI7udelBFGuBcPzn/iaZNTnGlJkfWOgcW+W9p9B7nGTTE90BEnTkeFwqS6BrbT7zSUCB2k4oZB/nS2rdl+GWgl+kQqWK51I0zBo38kJwuGbEh/XQ1HmFXW8KyNwzIDrMRfWbQd58rXH71U2ldDvd43nOebghAfyWZFBHvwdfP6aXYQbD5XqlgEmHR2RFjWNq5i0tRWckbUbKxJaTybqpAizu5aEfJH3MEHtTmVy0a7eaekJ1v0F+IJL+cyGrVlBwKyV4UTpIrWnIOLEYiKZIAkpTvIhT+CoQdZHOtVwjQmivL8P1hFbVKSl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(31696002)(558084003)(5660300002)(6486002)(66946007)(7416002)(6916009)(8936002)(316002)(2906002)(6666004)(36756003)(86362001)(66556008)(16526019)(186003)(66476007)(54906003)(31686004)(4326008)(478600001)(38100700002)(8676002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2V6WXpIMDBFalRYSkJES21UVUt1VklVazd4ejBIaWw1S2toMXAybkM1WXVs?=
 =?utf-8?B?YWQ4YVR1dUVlRG42aTJnNWFud09yL3ZFRUp0VFBCc1J3azQzYVhGbWhoak5i?=
 =?utf-8?B?bHlkOEJIbk94R1BVL2NjYXFMd0ZMbzBuaXRER3pIUGd3TmFjRXhqakYzNkNJ?=
 =?utf-8?B?YzFDTGR0NFg4cmtDNjBFUDhmRVN1SFlac0tHUE54SzIvTTRWR2Judmd3c3Ro?=
 =?utf-8?B?YUhtZmQzSnQ1Wm5sMWNOVk5Ub2wxNHE3UUJ4MTFWRVE0dUZOOWpwODdMTUdE?=
 =?utf-8?B?d3lGVCtGWTVKWVo0UEJLa0NTZlRwY2ZMQzVsQkFlNXlkM3g2djlUNE1kL2s5?=
 =?utf-8?B?MVN2S28rMnloNXg0cFRxQVhENlFIN2ovR2pxSjVSQWRiUGdEcXVBNUZHMFV2?=
 =?utf-8?B?ZGc0ME00dXpONWg2UC9PN3prcnRlSzZ0T3NuTVZZN0VsM29Bd2JnUitXOU9x?=
 =?utf-8?B?aVd0SUx4Vlo2a3BkMGlQWFRiZXhPUVhxcmplbDc5Rk1qU05USnFnKzRSY3ZB?=
 =?utf-8?B?eWlja2FYcUh2bXllTzdiQU15dkNxOU45WXFSS0EwS2JtR3UyeWRhRTB6elZW?=
 =?utf-8?B?VWNCTTIwTzVkSDMva1lPTm0yZVBmUjhaVW45MmxFWDhha1c4by81SFRDdzBr?=
 =?utf-8?B?N2ZKbzNGZG5iZVczVmMzeDFONy82dy9tSG5tTzlXTUNSMkJtRWtaMFRnQUFo?=
 =?utf-8?B?NjVFRWFoZ21ZT2ZFNXBrR0lmeGNUSElxNVJDNG9UMVJlQ253TkQ5ZHhGL2Zs?=
 =?utf-8?B?aHFic0UxY0lCK2Y2ZnRKZ2RiUXptTU9TM1l6dTd0OFNqVnZ0V1FBR2tzeFI3?=
 =?utf-8?B?SUpqQm5LN3NlZ3U0L2lHYnFWSHFvdlM2MnUvWUJJbU5ScWRiSkY2UjgxcERB?=
 =?utf-8?B?TCs2Rk95c3l3cjRwSEtWNVdCWjhINjRyazhsNEhWb0ZQTjZpRmJ2TjNwKzlN?=
 =?utf-8?B?WjJPUmJyQzlrWjk4M05GcXF5UFdmdS8yQk5hRmFnQlRKUm1wUDBXZUpkc1hE?=
 =?utf-8?B?WERZMGMxRlEwMHV6ZGt0L2tQRkdUa3daMnpjclJzNGgzaEJJcmVIQUwzOHdq?=
 =?utf-8?B?OVJKYnU2eXZ6cXJib0JkOXlGUVV5QndScGJCM0FISmd4Y2dDSDdnWTNxcElH?=
 =?utf-8?B?bGdQWjhQbDE3Rlh3cnRuOXdTQ1RvQnA1UTdQalRZZlNjM2JkcnNBUWt2ZXdn?=
 =?utf-8?B?a21IMkVhelVuSy9jamxBRkhlNzE1NkxSOTB0enoycDl4MW05Q0theCtQVGk2?=
 =?utf-8?B?Z2M1aXZYWEhvT2tIR2kxVExJU1k5b2ZBczJvYmQwMUgvSjRoNUxUam1vdzQ5?=
 =?utf-8?B?azNoYVVDV2cvYzJUOVZ0dmQ3R2VhQVhsZTBncG1HM1pML0dxVGJvdG5GU1FV?=
 =?utf-8?B?ZDNib05ObWhjR0F2Z04rZlFCZXY1T0RVeTVqSXRLc293TThkSzJyQmJFakNo?=
 =?utf-8?B?RU5ZT2o2cWxVZUQrUjdESi9rTnlhSVpZWG94NnI5cEl0b0dKNTRTOSsrK2JD?=
 =?utf-8?B?NlhrTVZMVm1yWTQ5cW91dFB1L3A5a3ZtQXFqZ1ZDSXpsL1pQNlVuMnN0UzNE?=
 =?utf-8?B?YkJNWWx6Znk5ZVM0Q0dZZ3BXZGVweDc3VW0rZTVZSFhjS3h4bUFpU0V3b0U0?=
 =?utf-8?B?K1Fja082T2pxWTNGNW40YXUrNkRUbW51TU1QTElqOXM3RjhNZGJtaUZiVTBL?=
 =?utf-8?B?a2hlbWU3SVZjaXBJNXdhNFNhNFI1dUQrRjV1ZG5RMDBCSE8xSHpXMlkveUN2?=
 =?utf-8?B?YTlOVmN3eWRuS0lmcFNrRGhSMnNrVHBvS3RiWGNkWjdrSEwvZjcrVGRaSnpV?=
 =?utf-8?B?Q3VJcU5XWjFQRGFoQVdpbEpQU2lFZHBOQlNkbnNtZnN0S09BbmlWb3ZuQzhz?=
 =?utf-8?Q?7jnqFBK7zb8sx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fa9e64-8b08-47ce-ce1e-08d92522c266
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 17:29:07.1678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJqNnAN9tS1SnLFy0OJC+IItZCH4q/pQpwg6D48F0M0ikJjS9FqwAuuy+EoXUG0x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Ack on all naming.
> -Daniel

BTW As long as Jason nor you object I will prepare patches for the 
rename of the functions.

Regards,
Christian.
