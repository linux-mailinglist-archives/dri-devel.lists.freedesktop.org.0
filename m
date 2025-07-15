Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABD4B05A4C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 14:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAC9892AA;
	Tue, 15 Jul 2025 12:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OeVU3a2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4B7892AA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJZgmcBP0Q6mrbLBFm09v7nN8o1mvDNnAepj/xj8WGSyYtmjKEw/ReWfmwfj6ylHIas9g2jt8t2/gFiZz/FYSfOWq0TU11i5/Zx5q2sxT+QvvVd7+sKWRLffULCiYjf1DwxK9vkABUp1UAXRhK7y2Rn7FYcVg5B+RiJWmjzkO3btzFqYKc/cjabGB+WGs65e68plwJXBsvvUPSuYnGbKbJh+rnviYjyF060snj35qvwnbRXmwRJgWFcdWZ8trXPP9mNy5Xi/lYke01Ap/8kNSfBIKcLsSCST1m2bsOva+d7/rUCck6KwcGRwVljci2KDTOEavij+Pg8WI3UWlMjQwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeTsvzdzLvTp0PrxKLfFvzbhHGLmMYGlxfR+pMN0Al8=;
 b=giivVV7r0IlpaVfhmB7Ig+IZGQLLZnC5Zyji5yrvoDMTWlL1UOjRehsdmkXC0XNi2jQDf0sBaMDpZVApQ/lNKJEAISwfFNhkEaymwVN+aW71xb862j7MYjFL9U2IdqZZANxST5b813hZBC3ePoUs1POeXabj2URH2A9ZQnWglU4yyatKQKVHwNzXVVfWEKCvVqZ31naf5c0qrWIwt0KZ4MwD8gW9lLNhBWsUfzT6U8DQ+Ve9nPmBWFxnh2ue1a3pejJCUxxcvhAlucuhXFPEjIpg6bTSaWMnhUyybEnx5/2WHa8oJ8mZMab/RBEyNqR3MLPWUd1xu1eJvlPQorDWKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeTsvzdzLvTp0PrxKLfFvzbhHGLmMYGlxfR+pMN0Al8=;
 b=OeVU3a2g7XFOWO7Opobvim2V81ZURKhsrHrnYpKERDtnp78reJs4oj3QF24E6P7wR01DDGvwFo53VJ9jN6FC57HcKlESsR5q96eocWnJqUHPLupt9PSfg5iSNjC6dEs83SXcgyr20wn43CLULKWjMM3ubHS7MJisaczTpwT/qks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6669.namprd12.prod.outlook.com (2603:10b6:806:26f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 12:32:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 12:32:47 +0000
Message-ID: <db50d1eb-02ed-465a-b98d-a24caa7829c7@amd.com>
Date: Tue, 15 Jul 2025 14:32:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
To: phasta@kernel.org, "cao, lin" <lin.cao@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>
References: <20250714062349.588235-1-lincao12@amd.com>
 <87d61f5b7809828a55caf779b10a90be802fe83a.camel@mailbox.org>
 <a8e473bd-6ea8-41e0-b5b2-10c420e5a935@amd.com>
 <70d9c6a43846c3a3c266d4a7a431c1c4b3fcd05f.camel@mailbox.org>
 <164c69fe-9ab1-4e04-8103-b25e4804e74d@amd.com>
 <PH0PR12MB549781447809324DF9A7E0D6F557A@PH0PR12MB5497.namprd12.prod.outlook.com>
 <8dc0a31c06d33f45bbcb32d8805579015db91b21.camel@mailbox.org>
 <PH0PR12MB54974724ECC2262A6F00AE18F557A@PH0PR12MB5497.namprd12.prod.outlook.com>
 <44bdc3fd5628a7db07c64331007509aa39a13df4.camel@mailbox.org>
 <ba4770ce-f70b-4825-aba4-34e13c9b910f@amd.com>
 <564b80a454c5d537071c4e63622982f2d6be5639.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <564b80a454c5d537071c4e63622982f2d6be5639.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a3dabe-ffd0-45e9-3b5a-08ddc39bb44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHBwbENXN2puRVhMRWlUWFBrSUxTeUltdUNjVnFGMVV0QjdJaXZzaWZZZFhY?=
 =?utf-8?B?Q0dqUWpzNGc2MXZVLzVDWFJDVE8vOXh4WEh6czVLMFp2SkprR0grZTN1VFYv?=
 =?utf-8?B?UnRKd2JPdGtkanJFTnRUQTdvYWMyYW1FRXN2M2pGOENSVUpJMzU1TDN0OVBj?=
 =?utf-8?B?OVBvSHBPemdjbHBDNy9VZWJnWVlweHJHRU8rUjhWYlFSWEpERUV2RThteWJB?=
 =?utf-8?B?bzU1dURlRkVIYVVzSGZHdGpubEgyRmNxWm40R29xZk9Eejh0WGhyVmJOc1Zj?=
 =?utf-8?B?cnE1M0RQWDI2WTFsTW1XWXh3S3YrWjhKUDhSYVFmcnhLQ2gvdFptYUU1em9Y?=
 =?utf-8?B?TStyZW9NbmIxNVlINnZPM0lYUHlVSzZBakFVQXgrTk9yZ1loU2sxdUpmNXVJ?=
 =?utf-8?B?aUloczVFQng0L0RiVDBveGNVTzh2aHN2SUVBUFdYb1BsaWYrRnFOYWJ2QWhE?=
 =?utf-8?B?S3R2NmpHaFpiSDVCQ2JVd2MxcVpFWUNNTzFHK1FYNjREejNOR3A3Q29DYnh5?=
 =?utf-8?B?V0NOT1VaMFRLczcyWnBKNGZTU3dhajZ3WFczM3c1R3A0Rjkvbnh3VVpEcXBm?=
 =?utf-8?B?VVN5TUVqVSt2VUpIeU9obC94UU1FSS82OVdtNTBDWndIa0ZFZWJrTFpUVS83?=
 =?utf-8?B?QWhJc1pjL1M0cmIxOEJ0eU53WW4wdWloVTBHMEp0VUZYOXM3L04zdlNZOHRp?=
 =?utf-8?B?SDhLRm5Sc3FvOXV0WHBLV1BLVXVBdDZRR08vWFhjaHZNNzBaZ1BtS1BFa0pq?=
 =?utf-8?B?VjZzRzNFZGN1UXVLK0p1eklXMjErc1lWcHpjYTJQNU1wOFFCMXIwNGl6VGtn?=
 =?utf-8?B?U1NDcTVOc2Nucm55SVJkckV0SjBRZytqL04wOHVRUjUxU3RmcWRPbXh2cm8y?=
 =?utf-8?B?MXFEaWs4UDBacEJRUmlwWjRiZGwrK0hkZjVUSHJjdmc0dUlmTWs1Z2lER09l?=
 =?utf-8?B?M0JWRllYNHVEbnZza1RxTlZnRXJVdS9GMDdJZUlVYXdmNUdPcldrNUNtMUtU?=
 =?utf-8?B?c1JKR3QvMUdvL2RWTlFUUkgxQW5hYVdrMW5WYmNPR3hrN2FHMktJU01ONVAx?=
 =?utf-8?B?V2VHWldIQWwzdk1samdKK0ZUakloOGM0UUJkV3ptNW41TTVQUnhGZVBlaGxX?=
 =?utf-8?B?YXU1d3FXU0dkVlUwRXZqeWZMdFNhcGo5aVU3S3BWa1l0dXhvUXlTdlc1SXhh?=
 =?utf-8?B?dGJlWjJsc2RUcjdOR0gxZGRiZWZvTFU1Tkh6WUxRZWw5dXhQdS9NYmZTakxI?=
 =?utf-8?B?NGR1N29aRkdybXkyN3B5am1yZ2lQbWFNTklDWmo5L0hCVHR3VUdLYk1lK2Z4?=
 =?utf-8?B?ZWRWVXQ3N0dyWUJBdVpvL00xZUtnOTJsb3JqSVlFSVg0TkdUaUhnRmp1Y3JD?=
 =?utf-8?B?YVV1UDBtV1RoejZzUzkvRHoreTVFRzNUelVvci8xY2tSenRTeW5LbWlzZ3lP?=
 =?utf-8?B?cmhXUkk3ZzdESWJuanFENFIxcGxrOWtkTG9jNm9NRzE4ZnpyZkpuK2dhSmlj?=
 =?utf-8?B?WlZFTU1vY0tZMmRhaUJ6cCtVQXlqWDAzQ2IrMkdwNjZ3WnA1VndZNUxITWdz?=
 =?utf-8?B?aFBTelZpeWh0cVRmSGdSV0ZyV2g5RElZd0hJdzRYTGo3SWxYS1REdllyU2da?=
 =?utf-8?B?QzNBVGxxRjNBOXRpalU5bC9IZ2dTWko1WUtZWm9TK08wRitkZHozUkVXTkYw?=
 =?utf-8?B?YW9DQ1Via2VCdTlrRUpYZG51b24yY0g4bVVCZUVrbk1OR1crbDZYUm41Q3U5?=
 =?utf-8?B?L0dlK04vM2liV0VlRTkwditGaDVQTWdRMWNTZDRkSE9PZVVaVDNwUjhwYnNj?=
 =?utf-8?B?d0s3L1N2d3lxSGYxNk5vcC9BUUNaMEVLaWdMVjAvbXVSV3h3SUFtU2loTk1W?=
 =?utf-8?B?bXNFbkZJaXNjUjlwR1BUVUV0RUlGb09zK29ZNUdWSUZUaEJiM3N1Ym1HdnJK?=
 =?utf-8?Q?mh6GheqXR0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXYyM01PS1VCWHdML1VYbGhPUGNOay9nc1F4TGFaZEJWNURBNG1kRE0ycEls?=
 =?utf-8?B?czlkdzYybmR0T2pvUUFVR0ZoTU5pV1lHbkgvTCt2WFZHS0pVMGJUYU1OT1Nr?=
 =?utf-8?B?UU1sVFpqZHNxZnIwZUFkSGppT2lBbVI4MUUwRFlrRk5iTVN1Y29ITXovdjBW?=
 =?utf-8?B?Z1UxWktUZ3hCc2NVUHRCQVIrNUw5RHJyV2xRNVY1eVlVTXVWU25OaGZ6TnRS?=
 =?utf-8?B?V0FpRXR2Q0xvYnRKVmh6WTAxamp3aHk3YkROU0ZhemxGRlFGS0NteDU2Uk52?=
 =?utf-8?B?Rm81bUFKZnRVR3hPT1ErcUl1VkdmVEJ1empyeVREdmk4UXQwaEljVVF3Ui9h?=
 =?utf-8?B?OU5sazFKekNReWYxZHZmYmdNWkpLR1hxN0w2ZFpxSWtubG11c1MyRHJ5V2ZT?=
 =?utf-8?B?eEdyY29mMlZTMS9iV0praGJlcGlIQ1FzZGlBNHgwQzMydlFKbTNXaXNwZGlq?=
 =?utf-8?B?RGRVYTRNajZMZmFxTE1jR1NySnFMN2R2enczN1kwQ3MyUjRDZjdyRmRDTTk0?=
 =?utf-8?B?Z2xQWFVoZWJib2Y5Z3MyMGhLU25IOTRBRHh6Wkg5aXdsUUZhY0pxcDA3ZDhk?=
 =?utf-8?B?aUhzNzVjNy90ajY1TG4yVmNhWlhjMUE3OUZTaVdMeDA3b05Pa09WTUF1T0ZZ?=
 =?utf-8?B?WE82Q2l6dmloYjJBZHNVZVR6UVlmUTZIemhneTVUUTRkb3N1dlp5VkIyN1RJ?=
 =?utf-8?B?bERSTkxCVlNXKzBuRkFheWpJZjk0RnJWTGE1N294TElQclNVTDRUQjVFVU9w?=
 =?utf-8?B?ZytXTnVCR2x0Rmx1UU5rekJ3QnZJcnU5Y0tOQjhtMUhsTm1Pb1RoclZJeHBi?=
 =?utf-8?B?aE95a3B1bXNMK2RPSDh6a0Ivb1VxeDJUR1NHU0lnNDdnY3FEcXdJb0h2Ym40?=
 =?utf-8?B?czZTWHpHWXE1UENsTjNpTDVjc1YyTjA0dDdPZlFKb216SDExeFNXa3NDTVlX?=
 =?utf-8?B?WTFIaEduTUdnMTZ3K3JCUThvTmJmYVhMODNFRkl2cUxkL0o2SUJGamxtekZq?=
 =?utf-8?B?ck9DTnhSRDZSUkwvWUMwQWsyaTBFZGxmRTljaEhJbXdZMTk4L3UwUUVlT0ZG?=
 =?utf-8?B?MW1USmYzL1VobGxCNTNrcUp4Vjh4SjVBakdsRFI5TTlVNXFJV1IvdkJ1OWZJ?=
 =?utf-8?B?cFZORytIWWhwL0pQNmh4d04yb3dFaERuSWdWTW1NTERLZEZnVVBYY2xHTU9S?=
 =?utf-8?B?UUV3L3JpcDB4c2NyNHdob2hXLzllcHFHMmNyMjNubUxZNms0dE9uMHF1Rk1M?=
 =?utf-8?B?bjA4T04rTzRuQW9YRER4YVBIempXaGttb0xYUFVTTnNEeEpKSXFlL0UrS05m?=
 =?utf-8?B?RFIxRllKbzB5RjRienExbXdmNE1JaldrZ0xLSWNwU2VsejVaaTZiaEFDazBE?=
 =?utf-8?B?V29sQTJnSVBKTktUN2tibkZGYjdEV2FHUnBMaFFLNWhyaG1JbnRCR1QxMExO?=
 =?utf-8?B?VytHVnRwWDJnem5XWUMyRkZzOU0rakNBVTFUOVk5U3cvYzVNZWpzaFliWUJK?=
 =?utf-8?B?cGpjKzJSemovVFVBTjIxZVdFY0g2UFYxWWdnaUQ3LzdmQUR5R1UvRE90d2Ft?=
 =?utf-8?B?YjZzZThVM0k0bmdyODFxeEpqZVhmNXQ4QmZHeTUwbyszN0IzdmtHMXdkTzFl?=
 =?utf-8?B?S1hGWDJXSnVZbVU5WDAyNUxSS0wvYnFQMjFGVzJyUGlUUVRncXZjeEFhNWh6?=
 =?utf-8?B?YXVGRDVpZEdXTnlIVGdkT1lQL3V3TnF4RWJ5T0JFTnlQREJraXlKelNsNlJY?=
 =?utf-8?B?RjBaQmdxT0NRM0xWR2t5d1pHZGNnRE9RZExyMnMxbmdzVTEzaFBHR1FlbmZs?=
 =?utf-8?B?dUdNRGZxUXZDdjZlN0VNamFZTHhXYVVwbytPbDZaNXVmSEtLQUcwK2x6MzVo?=
 =?utf-8?B?eTZpdG5lYnVteGRiUVhSR1o4cytXUUdHL3VHOU5KNkY2bXlGZHpqVEpKN1g2?=
 =?utf-8?B?RFQySVNMU044bURYdzJId0c3NU5yNklDdjV0WjdmeWZIYWhITzlWSzNNTmx3?=
 =?utf-8?B?OHBSaVovaVFXV05kblI4SzJnQ2VyeGtld0ZOV3FuQm13OURZbEc4cjdoT2Ez?=
 =?utf-8?B?R3hFcCtCQnZERlY3MEkyK05mdXRKampLcmFIV2ZnWVNDbGtoa2xZUGJCUUxT?=
 =?utf-8?Q?fYbxch3q7LmhHRbSFeV2YgadV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a3dabe-ffd0-45e9-3b5a-08ddc39bb44c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 12:32:47.0726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J84KvoPYpmEalJuxJ07flqeC/V88fuvicboAp9O8o5Gg2eP1AiTJmfo8W/ApngWO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6669
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

On 15.07.25 14:20, Philipp Stanner wrote:
> On Tue, 2025-07-15 at 12:52 +0200, Christian König wrote:
>> On 15.07.25 12:27, Philipp Stanner wrote:
>>> On Tue, 2025-07-15 at 09:51 +0000, cao, lin wrote:
>>>>
>>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>>
>>>>
>>>>
>>>> Hi Philipp,
>>>>
>>>>
>>>> Thanks for your review, let me try to clarify why I added
>>>> drm_sched_wakeup() to drm_sched_entity_kill_jobs_work():
>>>>
>>>>
>>>> When application A submits jobs (a1, a2, a3) and application B
>>>> submits job b1 with a dependency on a1's scheduled fence, the
>>>> normal execution flow is (function drm_sched_run_job_work()):
>>>> 1. a1 gets popped from the entity by the scheduler
>>>> 2. run_job(a1) executes
>>>> 3. a1's scheduled fence gets signaled 
>>>> 4. drm_sched_run_job_work() calls drm_sched_run_job_queue() at
>>>> the end
>>>> 5. The scheduler wakes up and re-selects entities to pop jobs
>>>> 6. Since b1's dependency is cleared, the scheduler can select b1
>>>> and continue the same flow
>>>>
>>>>
>>>> However, if application A is killed before a1 gets popped by the
>>>> scheduler, then a1, a2, a3 are killed sequentially by
>>>> drm_sched_entity_kill_jobs_cb(). During the kill process, their
>>>> scheduled fences are still signaled, but the kill process itself
>>>> lacks work_run_job. This means b1's dependency gets cleared, but
>>>> there's no work_run_job to drive the scheduler to continue
>>>> running, or we can saystep 4 in the normal flow is missing, and
>>>> the scheduler enters sleep state, which causes application B to
>>>> hang.
>>>> So if we add drm_sched_wakeup() in
>>>> drm_sched_entity_kill_jobs_work() after
>>>> drm_sched_fence_scheduled(), the scheduler can be woken up, and
>>>> application B can continue running after a1's scheduled fence is
>>>> force signaled.
>>>
>>> Thanks for the detailed explanation. Makes sense.
>>> Maybe you can detail in v3 that this "optimization" consists of the
>>> work item not being scheduled.
>>
>> Yeah, removing this "optimization" would also be a valid solution to
>> the problem.
> 
> If you at AMD are willing to work on that that'd be definitely fine.
> Removing code is usually better than adding code.

I fear I won't have time for that before my retirement :) 

> Do you think being afraid of a performance regression is realistic
> here, though?

No, absolutely not. It was just a micro optimization done long ago.

On the other hand with the scheduler code base I'm not sure of anything any more.

Regards,
Christian.

> 
> 
> P.
> 
>>
>> Christian.
>>
>>> I think that was the piece of the puzzle
>>> I was missing.
>>>
>>> I / DRM tools will also include a link to this thread, so I think
>>> that
>>> will then be sufficient.
>>>
>>> Thx
>>> P.
>>>
>>>>
>>>> Thanks,
>>>> Lin
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> From: Philipp Stanner <phasta@mailbox.org>
>>>> Sent: Tuesday, July 15, 2025 17:12
>>>> To: cao, lin <lin.cao@amd.com>; Koenig, Christian
>>>> <Christian.Koenig@amd.com>;
>>>> phasta@kernel.org <phasta@kernel.org>;
>>>> dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
>>>> Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily
>>>> <Emily.Deng@amd.com>; dakr@kernel.org <dakr@kernel.org>;
>>>> matthew.brost@intel.com <matthew.brost@intel.com>
>>>> Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when
>>>> killing app with dependent jobs
>>>>
>>>>
>>>> On Tue, 2025-07-15 at 03:38 +0000, cao, lin wrote:
>>>>>
>>>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>>>
>>>>>
>>>>>
>>>>> Hi Christian, Philipp,
>>>>>
>>>>>
>>>>> I modified the commit msg, and I hope it makes more sense:
>>>>>
>>>>>
>>>>> drm/sched: wake up scheduler when killing jobs to prevent hang
>>>>
>>>> nit:
>>>> s/wake/Wake
>>>>
>>>>>
>>>>>
>>>>> When application A submits jobs (a1, a2, a3) and application B
>>>>> submits
>>>>> job b1 with a dependency on a2's scheduler fence, killing
>>>>> application A
>>>>> before run_job(a1) causes drm_sched_entity_kill_jobs_work() to
>>>>> force
>>>>> signal all jobs sequentially. However, the optimization in
>>>>> drm_sched_entity_add_dependency_cb() waits for the fence to be
>>>>> scheduled
>>>>> by adding a callback (drm_sched_entity_clear_dep) instead of
>>>>> immediately
>>>>> waking up the scheduler. When A is killed before its jobs can
>>>>> run, the
>>>>> callback gets triggered but drm_sched_entity_clear_dep() only
>>>>> clears the
>>>>> dependency without waking up the scheduler, causing the
>>>>> scheduler to enter
>>>>> sleep state and application B to hang.
>>>>
>>>> That now reads as if drm_sched_entity_clear_dep() is supposed to
>>>> wake
>>>> up the scheduler. But you add the wakeup to a different function
>>>> (the
>>>> work item).
>>>>
>>>> Also the code actually looks like that:
>>>>
>>>>
>>>>                 xa_erase(&job->dependencies, index);
>>>>                 if (f && !dma_fence_add_callback(f, &job-
>>>>> finish_cb,
>>>>                                                 
>>>> drm_sched_entity_kill_jobs_cb))
>>>>                         return;
>>>>
>>>>                 dma_fence_put(f);
>>>>         }
>>>>
>>>>         INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
>>>>         schedule_work(&job->work);
>>>> }
>>>>
>>>> So if adding that callback succeeds we.. return immediately but
>>>> we.. do
>>>> that for the first dependency, not for all of them?
>>>>
>>>> Oh boy. That code base. We(tm) should look into pimping that up.
>>>> Also
>>>> lacks documentation everywhere.
>>>>
>>>>
>>>> Anyways. If this solves a bug for you the patch looks fine (i.e.,
>>>> not
>>>> potentially harmful) by me and if the tests succeed we can merge
>>>> it.
>>>> However, I'd feel better if you could clarify more why that
>>>> function is
>>>> the right place to solve the bug.
>>>>
>>>>
>>>> Thanks,
>>>> P.
>>>>
>>>>
>>>>>
>>>>>
>>>>> Add drm_sched_wakeup() in entity_kill_job_work() to prevent
>>>>> scheduler
>>>>> sleep and subsequent application hangs.
>>>>>
>>>>>
>>>>> v2:
>>>>> - Move drm_sched_wakeup() to after drm_sched_fence_scheduled()
>>>>>
>>>>>
>>>>> Thanks,
>>>>> Lin
>>>>>
>>>>>
>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>> Sent: Monday, July 14, 2025 21:39
>>>>> To: phasta@kernel.org <phasta@kernel.org>; cao, lin
>>>>> <lin.cao@amd.com>;
>>>>> dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org
>>>>>>
>>>>> Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily
>>>>> <Emily.Deng@amd.com>; dakr@kernel.org <dakr@kernel.org>;
>>>>> matthew.brost@intel.com <matthew.brost@intel.com>
>>>>> Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when
>>>>> killing app with dependent jobs
>>>>>
>>>>>  
>>>>>
>>>>>
>>>>> On 14.07.25 15:27, Philipp Stanner wrote:
>>>>>> On Mon, 2025-07-14 at 15:08 +0200, Christian König wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 14.07.25 14:46, Philipp Stanner wrote:
>>>>>>>> regarding the patch subject: the prefix we use for the
>>>>>>>> scheduler
>>>>>>>> is:
>>>>>>>> drm/sched:
>>>>>>>>
>>>>>>>>
>>>>>>>> On Mon, 2025-07-14 at 14:23 +0800, Lin.Cao wrote:
>>>>>>>>
>>>>>>>>> When Application A submits jobs (a1, a2, a3) and
>>>>>>>>> application B
>>>>>>>>> submits
>>>>>>>>
>>>>>>>> s/Application/application
>>>>>>>>
>>>>>>>>> job b1 with a dependency on a2's scheduler fence,
>>>>>>>>> killing
>>>>>>>>> application A
>>>>>>>>> before run_job(a1) causes
>>>>>>>>> drm_sched_entity_kill_jobs_work() to
>>>>>>>>> force
>>>>>>>>> signal all jobs sequentially. However, due to missing
>>>>>>>>> work_run_job or
>>>>>>>>> work_free_job
>>>>>>>>>
>>>>>>>>
>>>>>>>> You probably mean "due to the work items work_run_job and
>>>>>>>> work_free_job
>>>>>>>> not being started […]".
>>>>>>>>
>>>>>>>> However, the call you add, drm_sched_wakeup(),
>>>>>>>> immediately only
>>>>>>>> triggers work_run_job. It's not clear to me why you
>>>>>>>> mention
>>>>>>>> work_free_job, because drm_sched_entity_kill_jobs_work()
>>>>>>>> directly
>>>>>>>> invokes the free_job() callback.
>>>>>>>
>>>>>>> Yeah the description is rather confusing, took me more than
>>>>>>> one try
>>>>>>> to understand what's going on here as well. Let me try to
>>>>>>> explain it
>>>>>>> in my words:
>>>>>>>
>>>>>>> When an application A is killed the pending submissions
>>>>>>> from it are
>>>>>>> not executed, but rather torn down by
>>>>>>> drm_sched_entity_kill_jobs_work().
>>>>>>>
>>>>>>> If now a submission from application B depends on something
>>>>>>> application A wanted to do on the same scheduler instance
>>>>>>> the
>>>>>>> function drm_sched_entity_add_dependency_cb() would have
>>>>>>> optimized
>>>>>>> this dependency and assumed that the scheduler work would
>>>>>>> already run
>>>>>>> and try to pick a job.
>>>>>>>
>>>>>>> But that isn't the case when the submissions from
>>>>>>> application A are
>>>>>>> all killed. So make sure to start the scheduler work from
>>>>>>> drm_sched_entity_kill_jobs_work() to handle that case.
>>>>>>
>>>>>> Alright, so the bug then depends on B setting a dependency on
>>>>>> A _after_
>>>>>> A was killed, doesn't it? Because the optimization in
>>>>>> _add_dependency_cb() can only have an effect after A's jobs
>>>>>> have been
>>>>>> torn down.
>>>>>
>>>>> No, application A and application B submit right behind each
>>>>> other. Application A is then killed later on.
>>>>>
>>>>> The optimization in _add_dependency_cb() just waits for As
>>>>> submission to be handled by the scheduler, but that never
>>>>> happens because it was killed.
>>>>>
>>>>>> If there is such a timing order problem, the commit message
>>>>>> should
>>>>>> mention it.
>>>>>>
>>>>>> The commit message definitely also needs to mention this
>>>>>> optimization
>>>>>> in drm_sched_entity_add_dependency_cb() since it's essential
>>>>>> for
>>>>>> understanding the bug.
>>>>>
>>>>> +1
>>>>>
>>>>> Christian.
>>>>>
>>>>>>
>>>>>>
>>>>>> Danke
>>>>>> P.
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>>>  in entity_kill_job_work(), the scheduler enters sleep
>>>>>>>>> state, causing application B hang.
>>>>>>>>
>>>>>>>> So the issue is that if a1 never ran, the scheduler will
>>>>>>>> not
>>>>>>>> continue
>>>>>>>> with the jobs of application B, correct?
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Add drm_sched_wakeup() when entity_kill_job_work() to
>>>>>>>>> preventing
>>>>>>>>
>>>>>>>> s/to preventing/to prevent
>>>>>>>>
>>>>>>>>> scheduler sleep and subsequent application hangs.
>>>>>>>>>
>>>>>>>>> v2:
>>>>>>>>> - Move drm_sched_wakeup() to after
>>>>>>>>> drm_sched_fence_scheduled()
>>>>>>>>
>>>>>>>> Changelogs are cool and useful, but move them below the
>>>>>>>> Signed-off
>>>>>>>> area
>>>>>>>> with another --- please, like so:
>>>>>>>>
>>>>>>>> Signed-off by: …
>>>>>>>> ---
>>>>>>>> v2:
>>>>>>>> …
>>>>>>>> ---
>>>>>>>> drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>>>>>>>>
>>>>>>>> This fixes a bug. Even a racy bug, it seems. So we need a
>>>>>>>> Fixes tag
>>>>>>>> and
>>>>>>>> put the stable kernel in CC.
>>>>>>>>
>>>>>>>> Please figure out with git blame, git log and git tag --
>>>>>>>> contains
>>>>>>>> which
>>>>>>>> commit your patch fixes and which is the oldest kernel
>>>>>>>> that
>>>>>>>> contains
>>>>>>>> the bug. Then add a Fixes: tag and Cc: the stable kernel.
>>>>>>>> You'll
>>>>>>>> find
>>>>>>>> lots of examples for that in git log.
>>>>>>>>
>>>>>>>>
>>>>>>>> Thx
>>>>>>>> P.
>>>>>>>>
>>>>>>>>> ---
>>>>>>>>>  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>> index e671aa241720..66f2a43c58fd 100644
>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>> @@ -177,6 +177,7 @@ static void
>>>>>>>>> drm_sched_entity_kill_jobs_work(struct work_struct
>>>>>>>>> *wrk)
>>>>>>>>>    struct drm_sched_job *job = container_of(wrk,
>>>>>>>>> typeof(*job), work);
>>>>>>>>>  
>>>>>>>>>    drm_sched_fence_scheduled(job->s_fence, NULL);
>>>>>>>>> +  drm_sched_wakeup(job->sched);
>>>>>>>>>    drm_sched_fence_finished(job->s_fence, -ESRCH);
>>>>>>>>>    WARN_ON(job->s_fence->parent);
>>>>>>>>>    job->sched->ops->free_job(job);
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

