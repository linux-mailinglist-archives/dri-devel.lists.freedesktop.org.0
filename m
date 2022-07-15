Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7857608E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C5118A129;
	Fri, 15 Jul 2022 11:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB6D18A133
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:33:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDVrZhp87trEDEBW/1PiMMOkRRshWpikUHT4x+++9QsXQ4NoCfUIH1z1tSksRJh3sjvnwPxPrZClenGsWZihfTsTryNXEGZreusv9pLa0HB51ILuNju/kE2CCISgDk2j0J37Tx3yKBbxooBnBCR6gmzCKtPUPi3lr9x7lxfwJ8xDK+mqRjj4IlUJEq3Km/Psb4D27R/hyKoNkoXlqNgZNoORMGkXNiopPBkVwvaWZvOymiJmfu6vzF3kxCxDdgm4INOwxZxRUqIgWOBBu+yeCk58CxXsapoeP/hYdnpk9UIIw/NflQ06zImLv7N0psR5pE6I+zd3bIUV6HAjkVdvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlpmZqFsmB/x/0xW2Y96bK2bY+PG1x9E9Iu1Oy5DQxw=;
 b=XaA9eHH6kdb7kGB0aK1lBLMHb1CfYLny0BgqM5zUjdcUm8q6flPA94ltsbp11MRaFn56/Xnosjc/J/IldTZ50maCRaiZ11KPYzkZbkGnYoianTciKH02/+W/oQQyC9MXKAIUnSRmfuwvZe4BbZW05JxTKnX73BpkOYOIIK+NbfClbjSetVQYVI+kiM7Mcl6PxaAscrmg8kcGaipy36ggZurStQYk+phtVrdn5zJCGQE+3G87OH5GX+a+B/vj4AN2NI5D1eynZ7wEYVrgFpA5gAclZ+JeYm9xsTrBGqRtkt2lvwXcGtWAJbgFQGuxGDa2yZ8fTvUcEc+Lf3FC2naEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlpmZqFsmB/x/0xW2Y96bK2bY+PG1x9E9Iu1Oy5DQxw=;
 b=m3X+pbEuOJMyQvL93wGytpAQu3twk5UuFKUeQU/uLcRgzQI1CnDDln6Jx6/bV2zEyZG0ASGIpHIqi7XfaolqYN9piialBSUIg7VvNkghCXxKLUs+P4CtG/xzvIIynOsyIV/K4bUGecLFdqfnIlOv5sBZtRFV6SNrZrV2smN9sp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4004.namprd12.prod.outlook.com (2603:10b6:a03:1a8::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 15 Jul
 2022 11:33:49 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Fri, 15 Jul 2022
 11:33:49 +0000
Message-ID: <8089571c-4536-c2fa-2bac-9958d30c8919@amd.com>
Date: Fri, 15 Jul 2022 13:33:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org
References: <20220715111533.467012-1-christian.koenig@amd.com>
 <fce378f2-50be-ac02-97b1-767e310f28a2@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <fce378f2-50be-ac02-97b1-767e310f28a2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85125bbb-5ee1-454a-e8e0-08da6655e2b0
X-MS-TrafficTypeDiagnostic: BY5PR12MB4004:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ghpfz7IQvFp6AZgtx6iplNBJr5AWMVIG72hLVPoSGBvs7zvR/pWqPle2V6/O8BAsby0yobvbmr+YA44l1WXuc7HpbT+D2Q4O/pClFR2OoDNcef3nQqsxfRMF+2z0inuUUchNOCkt0dlZ8VykDMsdqSq24qTnhls7SneS1XIgxiV7pdkYTjWFggwy1KxZayR3F8Qr5hytWsIFQl2Gyr1nIn1lfNH9QAt77XX/r4nAp/vfTFJlr+JPyDtN88Wk9e49sWqhjNOlrxM31rI6pypeTla5vs7Wr7C/mq8QYYA6h5bSGa9wTR71lFy7Y0VeKx5UmGYq/1EgjkVS6CqJWBQeSVkFNaMMt3WDN461s5dn5RrY/pDahluMz3/DrXqT7oFnwMYK6OFi5/49UkWl40uorqXjiPE206/EnX4muG0RBq3HwaJ1q4h5a99RtoWVJ0UsUXtgi/QDYfFCBapREMcDn5pv4O/qBQrzJfJNqN5E2PAYQFQLgLLMUooHFiKFFNHhTaXyhNATGt4HZB2te7kPo8Otnu4zvSQ502CLxGsQbqeEdpeR3Uek1b/rkOGJq1v3IICA6bZjZRS7bnmbN9uAKmbujlO5yDrpfYAYj22/mykacj9uGz1Z89KsxcmYrs40IK/KCMs/avAXLISl1Fyxj2esUn51FReeVAebXVtsGTPn/N+XEzKrYnIOPGSmtYAKxK5rd/SweGxHdY2JQ/7wVhu7QZAYbhmSiRWydqyxzxjjppP/8SA6+qp0ywz7++99BkcVSUBsv9K9jjs4myk60gDtZabLjsDq+kwOck8LhZw/fq63L+RPLw8+0Zrafk4tdYE/BGUZfA0o+37Ijo4JYn52O+ekkHIfMK7bWFNxjbU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(66476007)(5660300002)(66946007)(86362001)(8936002)(8676002)(6512007)(38100700002)(186003)(316002)(66556008)(6666004)(6506007)(110136005)(53546011)(31696002)(2616005)(2906002)(66574015)(478600001)(6486002)(41300700001)(36756003)(4744005)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2RldzFibFRJcFFHR3BWUzhwWDVPWnNJV01DWFYxMjFuZ3FWMkQ0ekFDaW9U?=
 =?utf-8?B?ZVZDSndBOTUzeE5YWjMzZUlHdmdPUkR5b0l5WFJXTUhUUGs0MFdwSGNrRkFR?=
 =?utf-8?B?d0dEdVJ6OEhsWlgxYnBNUGFtUS9maUdwb3pjTitrMmhLaTVuYWtSQkVZM1di?=
 =?utf-8?B?ckhBOWE2d0Z0dGdhSzNlbVAvMHZsVlhjdzZKQkxwdHJYUkV6cmdhNGpneUJt?=
 =?utf-8?B?VE9aSGdQZFBjOGRDcks2dnVEaDNPYytBc3hZWVFCWjFjTzRCWjR1cFRQNGVw?=
 =?utf-8?B?dDkxWVdTeHpXVVVVWkd4dUVpSW9VWUoxb0Q1ZUU5QzI5WWxPYlI5Y2gyTEtP?=
 =?utf-8?B?MEt3dzB4OGdCSzlaZzRDYlBFNENadlc1R2k3SUlUOHJDYkV4cFVqR0JxamF0?=
 =?utf-8?B?Yk1hWGlyeWt3bHliNkRiWllsVVJISmFDNzdLV1YrUWg4cXZBdiswbThjenU1?=
 =?utf-8?B?TXlCUnV0Z2x4VXBiVjRCL1V2ZXZhT3dKbmk5QmZDT0VoV1RTQzFvUTRxUzA5?=
 =?utf-8?B?RDlBTG1IbU9YSTViVFFxSkJ2ZERtbjRWTXhGbUM1N0hiS210ZTh3TEpwU0lv?=
 =?utf-8?B?UHZZbitRR1ptdDdIL2luNTFYWVBoejJ5MHVPekxsaGZRU1d0b2hCMkl3MU5O?=
 =?utf-8?B?Z0tNKzhsaWpSd1RGVVMvZWFkYWVCemF0SmppUmpSazdyM3BZQ1N5MTQzNnM1?=
 =?utf-8?B?VmFDMi9ZQnNQbm9lZHRRaURiRWp6RGVxNGx5SHB6M2swN0lNV2xsemYxMkQv?=
 =?utf-8?B?eVBOZ3lSU1JvYTJhMHJIUEc0bi84NmJ0TGZycmQreVJteGFYcWcvZTJUVHR2?=
 =?utf-8?B?QStBWk44TWlXZ2p4dmxEaHQxbmRORDM4dzh4Y0k1N3dTZDFRTHdtb0NqTkVD?=
 =?utf-8?B?UUJ3M0lFdXFzV0VPSUxCdVNQd3ViSjUwYXpHNEVRN0YrVDVqcFFvUm1PbHF0?=
 =?utf-8?B?eE51ZW1SVHNKckxIY3V3bFpCQ2hWSjB5Sm5IeUlNVHBVdWh2dzlJL2tIVGhu?=
 =?utf-8?B?MlQzVVcwVEx5aTR6VzF6M2MweXYzeDE4SEhZcjBhQkE3cTQ2QUwxOTZOTHBG?=
 =?utf-8?B?YmZFbjJHU3FzL0d6Q2lqVi92alhPSlkxb1k0dXFtbXp2aWxLUmFTS0s2SWY3?=
 =?utf-8?B?T2NaWlVNSmFRVEJwTmZXRkw0S2grVC9WMDQvMkVsbVhDdnllQ2JiSVBJU2F3?=
 =?utf-8?B?bkJhcHhzcVZOZWhSbnB1OGZkWWI2YTFzK3Y2Q3hYdFpxdkc0SE9sN1REYm1D?=
 =?utf-8?B?S0hxeVdmdjIrYlpPcThVZDJlL2VONk5wbDhURE5HU3Fxdkp5eUM3Skh4ZlhM?=
 =?utf-8?B?VFcydHlwWDllZUE1YXJpbG1LYlY2YmV4Q1k5ak0xVk5Camw2QmdjbjZ2eEdr?=
 =?utf-8?B?cG1INGpJamZQVENRdmo3NmErSFdzb0xFM0prVWQ2WVZDazJHRk96bnFyQUdD?=
 =?utf-8?B?azgwMGVOeUplUnJNNDh5WWtqRitiWHFoUFJaMWp0UFNkNnlwSlZzQUx2R3V2?=
 =?utf-8?B?OEV4SEhWeXZKNUJxRzNKWC9UdzJWSTBQOGtybnU4S0VwN3dKRFVYNnhkZlhU?=
 =?utf-8?B?QkhvNDNnUUpycmVhTFg2NzZCQ09RMVhobElqem9iVlZ4ZU5Xa291OTJlZUdi?=
 =?utf-8?B?aGZ1dVhiYUFtY3prY3h6djJXbk4rOXhOM2hseHEyRVdyWFBmbGRkekpwdEF5?=
 =?utf-8?B?Y1ZQKzBZV3QxWGNZcWVDK3AwVUwyVTZjM3ZFdmx4ZDVWN1BkZ3RmZXRSb0FH?=
 =?utf-8?B?QXEzY3BTV2U0NnFBamVlaE9EU3VyTVh6Q2ZlaFZsdnJ3bFZyVVRrREI4aU41?=
 =?utf-8?B?ZkNhM01nNXZKY3RxZkNyUHp4OFdjRXVJaFlVYTBlNmNPMHd5ZkFjY1laZzU1?=
 =?utf-8?B?RmVXZUU2YzB4cE01WVlaaGFodFFpV05hWEtQNG1XOUlRQ0VYcU1XUXBGM05a?=
 =?utf-8?B?R0kzalV0SnBoSEhSRi9Fbzk2S1IxQlN1ZnNlUDhyV1NUOXc0dEdXY1NiZnI0?=
 =?utf-8?B?eXlzOXNoMFlUcHc0dDJKaHFyemlOcVRUQ1hTd1VVdUQyYWRXVXFtcGlxc3ZX?=
 =?utf-8?B?Z3hYMkdweks5ZTUyWnVlMk91MjlwQStuNC9zempQSlRaTXdaV0pvUkVVQW5l?=
 =?utf-8?B?VDJ2dVBoc2FTR0RETmwzL0ZqemlVMDdiakdnZjkrTVR2MjVQbGxycFVWeXdM?=
 =?utf-8?Q?4i9Hviu9P2Hi4/fmU8UpgYsOiOkeq7zpTy2uPmyTDCWA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85125bbb-5ee1-454a-e8e0-08da6655e2b0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 11:33:48.9094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zrHazIBbe2gmEpKAXvifzVRrCINfHyInm0B+ktp6QPaGEkLoRD7svdMxZb8xiAO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4004
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

Am 15.07.22 um 13:31 schrieb Dmitry Osipenko:
> On 7/15/22 14:15, Christian König wrote:
>> I've stumbled over this while reviewing patches for DMA-buf and it looks
>> like we completely messed the locking up here.
>>
>> In general most TTM function should only be called while holding the
>> appropriate BO resv lock. Without this we could break the internal
>> buffer object state here.
> Could you please clarify which part of the TTM state is affected?

The ttm_bo_vmap() function calls ttm_mem_io_reserve() with bo->resource 
as parameter.

Since bo->resource is protected by the lock we must make sure that we 
are holding the lock while doing this.

Regards,
Christian.
