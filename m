Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A0A4E9EE6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 20:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E63410E72E;
	Mon, 28 Mar 2022 18:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED9010E6FF;
 Mon, 28 Mar 2022 18:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGRPAyUBfNKxtkbsiWPJ7dGoXy0grLEDZgmVQXMFa3+5JB0vCTgUtJ2nQbRIy24vVMIslidOGtmhqAWmLstVCNdui+5tku/+NZSlqOPxyPZpQqWT6q4BrzjMHx7Ir4HvtIvtHkKRFgy/twADHrIakRWDRXCrq9rm8q6qyW9OZHLPEpHjuWEZBNCDDz/QAuKoehab2LO6uXmO46GuSK4Yt+YtDL/LWwIny8CCVesgzO8lLJN4ozmzhRUd66G7ab8ts44vMqHk4ACZwG8DnZx2qq7QWnD3AsKqCyb1o/BilJnF59dsuqL8RxTlU2sL4F9nLfi4+YjCCrdYUng1ZNvOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PblMILgSxjPFXPY7G3hebHEDhY80ZWvQmAvlOvv5Hgk=;
 b=gVwHXZqGeoC+TKtr1pUCxPNpR75BRWUJ9IwXPe5QiWmmCZ11Ao/t1Dp657PD4gaPrhPAngymfIXL7xjkNUnmrdwqx3D8pFlWU+5gVe4GtPzydQBd0YhgTvTotd5jBHBvNAYa+qLs9ipWF+zccJ1mCc8fzqKDbb0AtZNaHnoh+YqFGLJMbGst23b/U9HaR+eJW2ax3jxLpbEUGEWT+2kB2Ho2Stfy+T0blZe+RSeLmrLUz0hs0CGKI6L4OG8qoJWWxuFa0UnASgu6zPwDBiBwtQBBmWhJFk8oAB/Hzym7tyQLjk6ApjXgI04DtmgNwbhXWTlkuosiJz7kB7d7n6z5ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PblMILgSxjPFXPY7G3hebHEDhY80ZWvQmAvlOvv5Hgk=;
 b=J/R4+oCLaKdFDV+R4dCQjFwCcC2KVQrAJ33lUqFAQzoXs/H3xJJ0BMvezdvYbedvvbUMWfUfYM/5uZMqP/RcmlWBfrABIPXMH1/e5JLw2+26PO41VN6k2dJmCa9peGpFBeFx/3xqpc6nTNeJ99FJiJaXWpRC91yKFN8YUzGsb28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL0PR12MB2577.namprd12.prod.outlook.com (2603:10b6:207:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Mon, 28 Mar
 2022 18:21:54 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%4]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 18:21:54 +0000
Message-ID: <072d9e5f-b144-e411-c696-14f226f1b3f0@amd.com>
Date: Mon, 28 Mar 2022 14:21:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH] drm/amd/display: dont ignore alpha property
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Simon Ser <contact@emersion.fr>
References: <20220325204450.kq7kjb7ez63p5srm@mail.igalia.com>
 <Bq9Aj2IM-iCzmSHMJzvYjL_qmyPoAjbrRh8JNExHmqJW5kxFbtOSjC4WFoeB2R_lUKQszrEuHsFKNHAtXvhdUwp_8ejTnKqKRmVPiiS8Cqs=@emersion.fr>
 <20220328165450.lix5hybt3egtpowr@mail.igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220328165450.lix5hybt3egtpowr@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0119.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee9abad9-2e56-4886-70b3-08da10e7d5c5
X-MS-TrafficTypeDiagnostic: BL0PR12MB2577:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB2577210A16E8FE7661DD9E138C1D9@BL0PR12MB2577.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDKc9+9jZ0yWQ/8e1osIcR6KTMAPrVvMSE0Irp92x8Aar6+cMgfTKRy86g7XWuIQn5zpmsD7VjqUTfPg4/KdMY2lXcxD8+gUseJuxl+4NStgV+U+/1tQhU0JWZlfh3tmgtZnrrW9+TjA/fL5YuLKm34bHQp3UxhdZnkSgJsFr1zMWZ5dF7gljzWdi6YcwJVvA8T+qBALPAn6PM1Ei6Ozed+Gi5eYJG66A3FKjI0NsTKVegnEJyIRAJuLd1qOmgNR1eo8Bpm0ov/LNPdhG3jSyEtdK9Ubs4ZBoUmhUlIts4PP2qkQlibEnyZ2oJmbnW5vLZQR4zGbHwKEkDylCnXXzOaNKshvz0d/Idlq7s8FRPhEqInkSfC+wd0q9CefXO4/w67wSDcWjumq47clRuW1YXM5Rf8R0Loxfqq52b25glQCbr+gvQy0c95Baw9aYuyhzM++Yo9XXhVehrqPylOoyA9OPDd0WR3EGRheHT6fuUrBIK+nOiYzk256+XqMGIb0nzOasapZBHJbNaaS1T6yJjmQQda1DThiHz6jzWXOs83p866wSZRUvPU8PRlippLrOY3WPsKetIo2kQXPLrFileeEv+LJFB0+A2aHvp8/2md0rg9qHNHK1h5EqSLYv0W13qtxDw++kzNMIOgLjDt0z71Lh87JEjCjrJPaSN1Vcf6c3fSaFGrD/EGQhwm6vC+Zt9Ff/lqiN+EJ4Ob7jYRwtlzLFsa9cTHDA2l8vY0jTs7ZbX0hNL/jRouEGumgzmm6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(6666004)(4744005)(83380400001)(2616005)(26005)(44832011)(2906002)(53546011)(6486002)(36756003)(966005)(31686004)(508600001)(8936002)(66946007)(66556008)(8676002)(31696002)(38100700002)(316002)(86362001)(6512007)(4326008)(66476007)(5660300002)(54906003)(110136005)(6506007)(192303002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWpiMUsrSW5PWDlyY0ZRK2hlUzVYN0dKUWJVUVBMaVFKMDVoZnNoWkVSQUg4?=
 =?utf-8?B?cm5DdTJuSHluOHVVaFUreCttcGtiQzE2Vy9BZU1aK2Y4cmZDUTJkWVN5QXMw?=
 =?utf-8?B?VHpnYTh1STlha0tld01lL2dsMENQVG9wOElZSUpTL2c4T2V5R3hlWmFOODJK?=
 =?utf-8?B?aVkrbUZrRncraUpXRC8wemd0RGk1cXVkTnRNSmNSMHVpNElkQ0l5Y1B5SUVa?=
 =?utf-8?B?Z2ZjekxnUXRxUGNYOTJlc1htQU9ia2FSL2UzTjVhTDhNd2pzOUU1eTdLVFI0?=
 =?utf-8?B?Q3FWUTFpWXpNb0FGSEU2eUdwc3lLTk90dHJtN3ZpTzJqZTRqekJPR2VtYnRi?=
 =?utf-8?B?SHpQQk9QcGE2Z2NhSkExeFFZbEx4Ym1USEQzWUFjYWd3am1obXVDMUpOczF1?=
 =?utf-8?B?L2grQ0pweitrbnR4QnB6UkdKSzN3bzV6VktsdVc5VlB5cDdTN0R3SFNOeFoy?=
 =?utf-8?B?M1lRby9Pa1lIMjZkM05SODFmZm92eGFhWHBCVm9KYWExdGhZZlBTaEZzUVdX?=
 =?utf-8?B?UDllSXl5eGhTR2tOQjJXdjM5NGJLL0F0S2NyQ2dMRmpZNWpOSWI4ZTdoUDBB?=
 =?utf-8?B?WWg3a09ZK2N5SlMza2tabEdOMHlkdHozUTJWT3JIZE1CKzRVUVBEY3VoaU5E?=
 =?utf-8?B?TGx2a0VZRVhSR3JJTkpab1JZaDBaaWNHSzJqRnlzOEY0Kzdzb0Z3ZDZncmR5?=
 =?utf-8?B?VUZIWWgrakc4QUkxRzJ3R2ZzOE90VHVSRVI1NUNZcHBLak5iSUJvemEweDdO?=
 =?utf-8?B?N2M1ekVKYWc4WERGU1BLcDFkelFVMDNDYmozYVdDTVBCMm0zNkMrRVQrNEFw?=
 =?utf-8?B?dkMzS21rWFJQRGVMSEZFdDNiclR4dWl6NjRaNjY0QzVib21tOTZ4ampEVVU1?=
 =?utf-8?B?NHdnWVFBV1dyTzE5aVFKWVJBcXZacUEzWlp0d1RWRkt4MWt0OVVWZXl2cmRM?=
 =?utf-8?B?dDRnVWl5UzhkZUtWVWpscVRJZzlwaFVYbXptdWhweGsxUUZlekw4L2NkUGJE?=
 =?utf-8?B?bm9JVlNiNDZIdUxERTEvTUhHekRjdTllMmlpeis0MjJDWTBZcWlhTGtPb1dE?=
 =?utf-8?B?TEVLWkE3NGRnQW1iUkFGaXd4d3dZT01UcjYrazRoVWtaNDNXSlErSm5zT3h1?=
 =?utf-8?B?Smd6T1pXS0VhbEtINUVlRFM2TW9ZY3BEMHE4R3lQSC9YeHpWaHpIOWJ1Yytx?=
 =?utf-8?B?UDFlV1BCQTdtRTdBaVFxSkZPd3p5b05qR2lsUU9BWUtpajhHWldsZHkxZC9G?=
 =?utf-8?B?bWYwQ0lmdDF2VGtrdUFEN0VQamV6dWJpYU9kellBbDNVWlNWK3krMUdvajB6?=
 =?utf-8?B?S3lXdDRhdVl3WkIzaFA0Y08vSUtGdWcrcWExdnRMbU81MGlnaXdHUmYxRVlU?=
 =?utf-8?B?Nm11V1FXR2MzMnNqZE9qZGlBemc1SkhiS3JVV3ZiOEJzRW1TbVVSS25uNjJs?=
 =?utf-8?B?aWI3V3I4V2VHVXArQ2h5UXZjbEhac1R0bkViMVJWeXF3MnBKNlhIL0RtVDd3?=
 =?utf-8?B?R1VQc0t2OXhHMzBqSHI1TkxSOURMTXhHZ3Viazd6SHVaM09CcjNpYm9BS3Fa?=
 =?utf-8?B?c2VaTENZRExJdDM1ZDJmWVpnL25nTGdGWitacFZaUklURk53ejE4U3NiQXJa?=
 =?utf-8?B?d1NUU09jNU5XeVZyK2d1QXpVeFdGTEpWY0MzazAwRzJPOFlid2MxTGg0dUZK?=
 =?utf-8?B?RFRlSmpEb29Scm5jREQ1UkFoM3FYRXd1dUI1MzZqOFgweGVqZ0I0WVVicmpw?=
 =?utf-8?B?dGNpN2hzWldQTjdXSDBrdlExK1dYL2htVFVzcjg2eGN1bVZ5U0l3RjNzMitX?=
 =?utf-8?B?eEM3c3h5cXRjbXk4c01TNjdPYkRHbVpDRDNoT1BGbXZMcmpzNFBxeVJtdGtm?=
 =?utf-8?B?NXdjTXNVTXJRWlNyU3hSTytSTkhWVzU5Rm13Ukk2dDloR0l1d215alZMWjZs?=
 =?utf-8?B?L0t4YlZsSFR3dnczZW1wREM0NitvMWhrb2o4WmM0VnNOYlMrS2hHKytHeUpv?=
 =?utf-8?B?WnZUMW4ybm9EU2U4bzhlRWl1emNwbVoyTEJKRGJTcjR6QVpxZTVFa295WndM?=
 =?utf-8?B?RXE2TDI2Z3Q3TGhTL2tpVmljZjc4RENMdHVndFNNVTNxb1FzMmFxMFVXMmZ6?=
 =?utf-8?B?MS9VU2xIUEwzQzdSTFhmcUpNZ0tFTkl2VVMyREJVZkNQRG9XYVhNZWd3TEkw?=
 =?utf-8?B?SjNRaHhDbGdaaEtKd3ExR0d5NFRMQVlIcksvdndvMmQyNWNSUnREdzBRWWxB?=
 =?utf-8?B?Wm9aaTRYY3pLaHM3d0swUnFGNk1XK2E1UEhjbTl3K2kwWTEyR1Vsc2xwQ2gw?=
 =?utf-8?B?Ujd5dnN3empNdmFpajdoZlNEVDJtRGFXM0FsYXRuTXBEdFpIT0F6Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9abad9-2e56-4886-70b3-08da10e7d5c5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 18:21:53.9290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mD7z4/pB7fwZV5XKzBUF/rriPV3SFz/fee+uMzgEIEYg8lnk5jdi5pJ/BUC3zpL75qOMONc8X1pzLrrD/Fzkqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2577
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
Cc: Zhan Liu <Zhan.Liu@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Agustin Gutierrez <agustin.gutierrez@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-03-28 12:54, Melissa Wen wrote:
> On 03/28, Simon Ser wrote:
>> Thanks a lot for you patch! I've noticed as well that amdgpu ignores
>> the plane alpha property [1]. I'll try to find time to test it.
> Hi Simon,
> 
> So you've faced this kind of issue many times :/
> Let me know the results from your side, so we can use it to find the
> correct approach to solve this issue.

Thanks, Melissa, for looking into this. It does indeed look like we
should support that in amdgpu.

>>
>> [1]: https://gitlab.freedesktop.org/drm/amd/-/issues/1734
> Yeah, it looks like the same problem.
> 

Ooh, tentative looks neat. I'll have to give it a try.

Harry

> I also think the IGT test case (alpha-7efc) is not the best one because
> results can be affected by rounding issues. Maybe the test should be
> reworked, but first this alpha property issue should be clarified.
> 
> Thanks for the inputs!
> 
> Melissa

