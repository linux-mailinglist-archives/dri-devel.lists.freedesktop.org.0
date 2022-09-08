Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5EC5B1478
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 08:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEB810E964;
	Thu,  8 Sep 2022 06:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5AD10E95B;
 Thu,  8 Sep 2022 06:12:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLy6NnQ1ajNlkcH4nu6tJeSRZEqBti0V4Ny2fa9jX5jfFPeJubEXbWQ28WqUVjtk9jYCl4hG5o2cJ9ljCI12OXjPzu6PGW7IqF4idE8mdX4xvx2aXwwW5IVHBYDfr0BfPPXxV4az5TofZLHDYKrzTzh8XaeWXPUaNQ47VrXJSObyCW2wkqjO/2D1rA5NWtcaO4ZQ1IPvGyFMhC2p5xIl9Zh+JVXF9pQ9BSVV/DJcktRB9xVmDYaBL8y2B4V9VK/PkCG7PdORjWPErtHPnClFhw/B6hIIxwwQBdA4K0e19TrAtPEWSV6SfMb4NIXkGFUl6/19dQgEQu+GKiwIc3gScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNVO1gf35uTZnZ1tU8MeolmD+5YNhYzQCvaKQsElu3g=;
 b=PtFcAh4WiLlqER/cAwLE1kPpXXBaBjIjrS+teKFkxVNch5r/4Emx3dBPAWnsMFh7g7QFPiVNgykm3YZf+B1T499o07Eth43w9kTt1S0BbfYJ1GIRHC6qCj0u7FF3G3mI4AeEgSFvvb2+ZENRgxTqgYbFiwqiK+nUC6vkH92kfsffWK1UVVSAVUm6DC9fAnxnhmlbtxAX72MzdQZdCwPqpaMVb0Wz+eQF+80GremRykpMdUENNE69MBRp3lbOhYIm5CipEmPhbyhSuGBcme+J1n+QIbMefPkN6jb1FPDTRocpQ0ooSdD/0Wp5HjZiiM4ggQz5LuWQBCvc079UW6ds6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNVO1gf35uTZnZ1tU8MeolmD+5YNhYzQCvaKQsElu3g=;
 b=F3lcLqfSgKKu2l4N68Nst9n8v2vmyb/v+y2h9hvcnk4+yOob6552Rdo3tYWfpP+XwMQTtJbr9HwvIX279qvnx5OEkfLk00P7owZ9cEU+KDat9KiYY+xA6apbM0XDDl436Puk5f0h9+GnszaKnA+bQ6Ju5raxhY3aIsPL6XqskzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB5858.namprd12.prod.outlook.com (2603:10b6:208:379::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Thu, 8 Sep
 2022 06:12:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.015; Thu, 8 Sep 2022
 06:12:56 +0000
Message-ID: <67c20b4d-d314-3e74-23ff-1990f6ffc124@amd.com>
Date: Thu, 8 Sep 2022 08:12:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] drm/sched: returns struct drm_gpu_scheduler ** for
 drm_sched_pick_best
Content-Language: en-US
To: James Zhu <James.Zhu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220907205705.934688-1-James.Zhu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220907205705.934688-1-James.Zhu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0009.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: beda96ef-4246-44b9-52f8-08da91612c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pXJIF3V1/gtwIRq8fjW/mc5dItsZ+6DJo26zz8K/vuIlAIkQE7PM4E2c8pXNjSG3QsBWBAW65etupENMwy/gBeJ+ioXayijZlLw64qya6023Ip0pl0G1Kzlu6c/z5ytOnY1EKUFI8yyVOioXIdvDR2VN374SaHaIdw/dp49C+h8oT7S1SufD9DSL7CB1GSHo5bcbEmO6v4ZI7O2walQr2N74VgRsi8B//hTTwJ6/JiTdrgbyYBbY6hV3DLBkgFAm2OrmLqOFIkh8wM7oqDLtBeYM9VPdrj9AgLAJVY5Q1wVXQlIItmAZlgrHf3ZSXZhjxmYsJOLqZsfoyRqDdVEEmLY+0qYvsQkimGyO/1YFnKahB3Gp7WhYapK78GI+MChUbu3p9uPHFhnAay2anvec4/iMpZxD14aOtJ874GBInV1wzmH9zbYBxpjosU/qr21R0FaRACvn4U8JpVrFTRt06gJ/gka+DoxZxPXtr74KSFX4YdzXg2foRTo+yy5WtmWgOQ/lmL8Dz9OSCfQoaYnBKvNaQDKgpQa5kDiEe3oyhIyPE54OJtCUEMfCxTUpqE+hiCLV1NdCrgSfewY8/yyb5kdbJOuXhNNJNkktXxaNienRmr1pRMXd5tSoTAb79b2GwtFFU7o5rX0ZVUshYDQNNsWIh+Nhr7Z6XLB/Xao1h+D2tIXSdO430M7gvxt6r3EmySVQGX3A0CV+Kmy2HpXTN+O52bd42bG4v2KYwq10o/LpgvqbnsBM4tLBVRNoelIZKGCxXbk7ejNk8hMAC6ltHWev88z34ghFR711ARlgELE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(31686004)(8676002)(66476007)(4326008)(66556008)(66946007)(450100002)(2616005)(38100700002)(6486002)(41300700001)(186003)(6666004)(6506007)(6512007)(26005)(478600001)(316002)(2906002)(36756003)(86362001)(83380400001)(5660300002)(4744005)(8936002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3FwVFhqdy8va09SUExpeFQ0MWVQQVJIU2pReTlvbDdUYlhWY2w0b0dMVlgy?=
 =?utf-8?B?Y2RmY2VSRGpNWkpjWnRCSGRlRERkdjRpOURvUmJMTmorMGJBL2ZqS2s0ekZt?=
 =?utf-8?B?RFBieERuYVp5RXFkallTdjRmSVlUR3k5aVo0TlpzY29rU2dSQnBMU1djblNP?=
 =?utf-8?B?clN2T1FVa25US3ZETXBBRW03QnVzd3R2NmlaNkRxZmt0eE1DVXViK3RuSUZ0?=
 =?utf-8?B?WlZ2cXdPcTY0emdnQkFXb1FUWStNTm5PVGVDd0tKWUNVemdxVzN3d2VGb053?=
 =?utf-8?B?NkJORjhpNGcrMUFVVjBkMTUxbU9wdmZNSTQybE56eFowSFFwR29YRzlXekJ4?=
 =?utf-8?B?K2ZFZUIrS1dzNnI5N0ZJRXBHN3dtaUplRHZhaXBsTllQQmJNQWpWMDk5RW93?=
 =?utf-8?B?UHMvUU9lQ3BlWVdUQnVKbllsREQ4b3lvalp3UkhwTGk0WlJNN2JMaWtXZ0pJ?=
 =?utf-8?B?QzNlWnpBWjhPbW9tWktLeFRpVHdyMFl3U3VTVVZWempBcnRHZWdoN1dLTkRG?=
 =?utf-8?B?dnF3eUxwYS80SUdabU43emFaUWR6UHJwNDVDdkNxRCtreUxnam1PaFpkSGJU?=
 =?utf-8?B?alF5Q2pTSFU3c1FkUjdEMzh0c004a1dTSXdrZm5tVXdPUTBKYnZ6d0dqSnlt?=
 =?utf-8?B?N21pNmsxRTFGVVZMMG56QmJIelJwQVgrdmlucWV5aDR4eFNrU1UrbVI4NG5M?=
 =?utf-8?B?czdEWHhQWG1XRFpnZFRSbEIybXRFdWREOHlZVThaM093d2JxREhPZC9NaFNR?=
 =?utf-8?B?cHBDb1NMdmdEOGpuU3Fnc0FOQXdhZ1Ryai82RE5YR0tNNEJLUWRpYkxLUDB2?=
 =?utf-8?B?YjFGdEJrTUhDdHdDMDVnc3UxaU5MeFBDRERyRDJQRkcxa1RsSmdJYlVsQUNZ?=
 =?utf-8?B?ekQ3TUt4RWJxQVpDZkZlQjd6WnBSZXc5alRVZ0JNNWh5M2R2ZUxjd2trM3hT?=
 =?utf-8?B?U0FzTmlCTDYwbjlHSVh5NHRSRDhLRldIQzBOSHFydHJ6a1NwQjZ3WlZNdm1R?=
 =?utf-8?B?L0p3a2NORkpCZTFjT3BVMDQzUlNHeUdiM1hDUkloWmh0WVhTeDBORmhFbnMy?=
 =?utf-8?B?MFZ4Si9BMER3UXB0UzlGcWh4SDdsc3FaL3VuME1VTnlNUEJQdGF2WHRJdnBw?=
 =?utf-8?B?ZHBaL0JJY0k3bzVsQmZ2RThLc251elF6alRHN25OamViQ3AzbHBhYkk1Tmh0?=
 =?utf-8?B?TkR4ZnhsWXI4TU5Jem92Sk5IYkgvODBzTFZhYjFEejVIOGJyNi9VRDdHVEpo?=
 =?utf-8?B?UmRZaHlUWG9YbnQ4RDdFa3NSVmc3Wm1nQ2lGd0NFTEhqSVFsN2c2YjBWYWdQ?=
 =?utf-8?B?bkl5TWQrL0hYZ2p6eGcwS3g0YlVrdGFqbUFhZHFjY1ZsTXB0TEpxQTVKMjFY?=
 =?utf-8?B?aCt3ZU1HckEvMmZyN0N3Mll2SmVDai9XUHEzaUVvMXQyYm1rWllQdFhNQXVV?=
 =?utf-8?B?bDc1eVlrWERJRmRPc1RxNzdKcmZFMlhtWDE4MDYwbXZzWkVwYlFpOGd4Q25l?=
 =?utf-8?B?TTdUcmw2N25sZERRNE9GMmtIZURwV0ErRUF4RFVadDZRWDdoWTZ4MWNUWllI?=
 =?utf-8?B?bDl4Q3FYYVJLZ0lnZmlVLzUrUm5yRklubVJxUlJyaXR6Wks2SXNKeGhaSElF?=
 =?utf-8?B?UDhicFNEYm9qdTJHT093TDk5NmUxcGFDT0xabmp0UFdHRC83SkxmU255cW1V?=
 =?utf-8?B?TDYzUHVQY2lwWGgxVDNkcTRSRmNkYk5TaHBxcVBXcGRiYWhvMitLbWordVRj?=
 =?utf-8?B?MmV0VXhhYVpaaDFTMGJDTk9XRnNhdmNnSFk3TkZIT3FFcStkcGpRb2hLK1Zo?=
 =?utf-8?B?RnRJU0lrNm9jdmZST3V6WjNqRGZheG5xblZSN25mV3l1blRSSVdVdnlkODJW?=
 =?utf-8?B?a01MM09FNjl1NUE1UDI1bFNyM2FYL2gycWVBejk0YnZHL2xKLzBwbEpxOThG?=
 =?utf-8?B?TmhwOFFDRStwLzVmemkyRFF0UnVTVnNLdnlkSEJlUk1BeFNtbk1jMllFNUJP?=
 =?utf-8?B?RUJNYUd2QVdvTm5vUTkzOWFNUE5RWU1taGl2N2QwcmwrQzFxN3BGbkhJTFp1?=
 =?utf-8?B?NmlqQ0lndHV0YnJOSS9Fc0xuc0NZNElLWXpWTnQvUWJlRktKeGJ5eTl1MCty?=
 =?utf-8?Q?ynaK9NhOUVjup0GKLgALwcuBC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beda96ef-4246-44b9-52f8-08da91612c30
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 06:12:56.7909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOwtB41meenCGd7/7LyxPwkeuYjt/2jxU+OwJPoPtov4hz/DQcxPTwoJ/DVNLNQ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5858
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hui? That's certainly not correct.

Christian.

Am 07.09.22 um 22:57 schrieb James Zhu:
> drm_sched_pick_best returns struct drm_gpu_scheduler ** instead of
> struct drm_gpu_scheduler *
>
> Signed-off-by: James Zhu <James.Zhu@amd.com>
> ---
>   include/drm/gpu_scheduler.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 0fca8f38bee4..011f70a43397 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -529,7 +529,7 @@ void drm_sched_fence_finished(struct drm_sched_fence *fence);
>   unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>   		                unsigned long remaining);
> -struct drm_gpu_scheduler *
> +struct drm_gpu_scheduler **
>   drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   		     unsigned int num_sched_list);
>   

