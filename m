Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BBE96976C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6299910E3B6;
	Tue,  3 Sep 2024 08:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="KdFE4NjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2075.outbound.protection.outlook.com [40.107.255.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287F510E3AB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:41:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFP23RRFgqXRUNbZjlf+dZBKMBphbVzuLq98E/rWboDxPsAQubILB91u1uIBElUG779Jvm5CRKuLxP+/q6JieLiSUZrujGKz+UupqdMVJi/PyTysmBxrkYyuHkmQsntqptyd5ZNheT6AS9gcY9+4kQo1cLwxqoSRXIMGMS65KysuXsNJXPfoJk3zYA4Ynu1e8kfc9s9I4bI6O4nleTU3rTwn3pwTiu32A/3trlkAjM7fHQdmpfu49dvGoH6LhUdkQJXHQEUwV6CQ1StoleJYq6JjJGFJ7GY8FT4kwOry9aw/BQwM4anywMPkrSdvCK29WUG3kABNetLdytkM4aRhuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8ywkoNL33RDIyoTlNZYtSPcsmbjf2buTyOB9sZCS+I=;
 b=sTskR04Rc4XSzk4Q5n0RglLa+dfyzWhkFU76aIEPPaMs+yd0drryc3Nz9TeOLOJbgNNtawYGuCREWxLWjtsCrdQKWhlkg+61zOGe62EzNdVIbX9xwF4TZtnwg0LB5mRHf+bJBHJwQtsDkeGbxhF0Dkx22h0h0yQ+ewsJSecM7s4eG/UzBamzylxvF9Y0on3++lJXcvurcWw/0FOAS6N7pCEzQA8MNDdyXBRRUPjnPRK/IA+DpXXUZ7oLxa31de9pbfvNLd1aaYr9MsPXgiGL4jsN1ZVtYRpmFiNAq0O45I6MvvO7f2bwsZ+Kx7lsbxjzCIbQXzGl+VJsxpXVt02sww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8ywkoNL33RDIyoTlNZYtSPcsmbjf2buTyOB9sZCS+I=;
 b=KdFE4NjSoxJBGq4E/JL9e7VTuql+X+AJNtmoK0mBlnAiIMzVUnsqcTbs/YHZTFyBV43aBq/il+conGza5kWIYrXFyMq1SBLlblAYv8Df3dxpKjPtw9O2DZcRSg08Y6ZmvFCf4IrEb6zzdOnFVWewwcbrLfFNC+V6M9avCXEAqJ+2He+xPSc3opZHtcURomGdP/lYkdyP04GbtX3b5BJo9DuWEfj8CMh8v/KyLql+POGm6bKT9cAZQTg/8haaCOAV7WibkjHwc9Z56Arjq5Bb+ggJ5djELTj1vXbGcZH+GuCjZD+X6J0lcqRvwzIL1TFGqo/wovYEXBIILDIXBUyM7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5359.apcprd06.prod.outlook.com (2603:1096:4:1d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:41:37 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:41:36 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v5 0/7] udmbuf bug fix and some improvements
Date: Tue,  3 Sep 2024 16:38:05 +0800
Message-ID: <20240903083818.3071759-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SG2PR06MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f0976e-c6c0-4d7b-b638-08dccbf438dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXB6N1FNamlyYk1NUXloQ2dDaEcvU3Q2b0VtRkF2cEVPNGpJWVA3amJwYnVI?=
 =?utf-8?B?VHY2SG53TEc1d04zZDEwenlCLzMxa0pYendXRFpOM00xbkVUS2pmbENtai9q?=
 =?utf-8?B?S2pJblFJRnhNOEdTbzQxQitVMXIxSmdsUHZnSjF2WUdWSWgzMEhSc2IxNFcr?=
 =?utf-8?B?MEptYVJmblZFNFVueGQ5dFBJYUNJbk1OYnowZHFDWjlQN1JzZkYzQStBelFi?=
 =?utf-8?B?djNFald5SUE0MUNEZXRzcHlDMkhhWWIyOTRUOVE0Q3pTaGFSczE2UXhiaDZR?=
 =?utf-8?B?NjZrdHA4QUFoUkdFTFE5M2VjT3Q4UTN0LzFCZGh6TzhGVU1IRXJKc1g0a09C?=
 =?utf-8?B?czBqRlJvWExiSlpmLzJQa08ySzFURWQ2Z0VGSnV4WmZzSUpCallDcHZaSSs3?=
 =?utf-8?B?bDVLVzJyVkhRSmhSbkg1QnprbHd3eEo3ekMrTm02MkpjMG52RWNpRlVuZmZQ?=
 =?utf-8?B?ZEV6VVR6Z2NEWUxpeDZBa1Q0L3MwbmVCYlNwam1zaVFURDFWbndmSzQyeWNO?=
 =?utf-8?B?eGh4MGVqUS9LbUJiYk90UlRFM2haTXYyWUdOQUFCeElLaG1kbmRiczFWQ2M2?=
 =?utf-8?B?VUN0ZVZYSEd2SzZqTXVNaUU1NmJLNTlUWUwyNE9xdkl3UkRBbG5STUJUbXRk?=
 =?utf-8?B?NVFVbXlNSEFUV2h5Lzd1clpaZHBCaXFnaTV6LzFUd0kvUEhBR0VqNjViUi9J?=
 =?utf-8?B?aGcwcGtCZmhPWnc2M3VUNmZvQzg4U2JxZjNBNG9lVXlSV3A0ZWIvczFmdTU5?=
 =?utf-8?B?czhSdHh1bHF2Y3lBb2hjdXdRdDdyenNKQmsxUVFrUGJlUHBjaDNBeG80dWpQ?=
 =?utf-8?B?dXBvL3NjNXNuYkdHY1c3L1FUeURwOEowSkwybnEvKy9BRmpObk9tT1hsK0ps?=
 =?utf-8?B?a285OFoweWFMMkM0TnZhalVLMHphMU1sZ0pTUXcvU294cnZGOXVkMGtwV0Ri?=
 =?utf-8?B?UExyRmRSWEU5ZXd0djVSRkZCVHYramovdUpzdi8zeUtldlhPUWc4RnNVaHhs?=
 =?utf-8?B?cE9Oc2tiUlBsc3o3UmJyb2lTVEU5SUlVOXZlNUdKNU11dmFyb1dtSFZ2T29o?=
 =?utf-8?B?Sk4rOGp0Z043ZmU1dTVvMWFpbFZFd1JMbVJLOXkvWjlyOFpmRnErUXZZS0Z5?=
 =?utf-8?B?NG1sWkNSQkpRcENlYmtwTDFDdFJHeHFYRXJQODBNd1JJMFpnM1dHbm5WZVE4?=
 =?utf-8?B?L2NvYzdiQWtQYkJSV3VrWnBQODMxWkdIYjNGUG5qTnh1M1EzR3Y1bEpuaTRQ?=
 =?utf-8?B?MHdlMVg4QUEwWGZMamtPWWZNWTJLR3VlYjMwb24wQTFLK2hLMkI3MTE5VHpJ?=
 =?utf-8?B?Q2ZRcS9TNVhxWUZPOUs5S2lLdGY0VXBKNjNaZVJIY2JpUFdGSzBVajVPMCtw?=
 =?utf-8?B?UVhwa3o3K0VpcklDOWpoYXhKQjZ3eXNMNTlYSHEzRFh4RkhpeXh6V0R2bDlw?=
 =?utf-8?B?Ymc3YjA3UTZUUzgwcURRWExPcng1WkFHR1Ixc0xEb20yQVdOSDZNMnNCVTBz?=
 =?utf-8?B?dlRhV2Ewd3FnOVpSQmh4Z1d1Z3ZObGs1L0R3OEQ1cVBPTzhZbGo4Q2o5OUJJ?=
 =?utf-8?B?QnZ1OXM5YUtQT3pKLzg2ZVc1ZHdqVXF2bzRFSEZFb2RLa2NQOW1WVHhnay9D?=
 =?utf-8?B?b0h2V1hhclhiVmNkeHBjaXoyaWthVTI0SnhsWlJja2VjYnoxaHFISXNDbTN1?=
 =?utf-8?B?aHhJbXpDTmYxUDRET3hvMTd5TEJTVi9QTCtuWHphY2ZNWnh0R2kwbkpuWGly?=
 =?utf-8?B?Mm9LTU1jSUNyTEkzaEppSjJTNVlyMHpOU29yVkxhTHpjVjRLRWtUMnZWMThR?=
 =?utf-8?B?ZGFHTWFCTW5FY096Yk5WODBQWHhQVzBYalEvdWg2QWJraTJ0T3E2bHpMQm9l?=
 =?utf-8?B?SWpydkJTTjJqdlNPWkxra2tKWGJRbW5wbEtjRUljMGlkbUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2tkd2todW13QTczcktIaWg2VzdBNVA4ZU9oZlNsTVkxbVFDZFR1WVQvQ3Br?=
 =?utf-8?B?cW5RTncwdXRRTHFOR2RVdkRNVTRpV2dwQlRUa0lVSHlZNFNiUXdiNjVxc0Zz?=
 =?utf-8?B?NVBkcDBuNk5uamVYZnJ2eDB0RjRnN0ZtQlhlMVl2dVprKzdXODdSVm9EYitl?=
 =?utf-8?B?SjF1N2xaSjlqVElCNWl0VXVoSnQydTkwd0psZExCRndkTlN5Rm1lbkdiSXFH?=
 =?utf-8?B?RXMveXZoUVZoWFFKWC9Pbi9RV0J3aU9INzdodUtWVzV0QzdNbmdBcDVqbzJj?=
 =?utf-8?B?RzVuWU96R2t2Qm1SUEJYdlpKR090VUFaN2oycm5DSEQ2eU5iMC9UWktGRmVF?=
 =?utf-8?B?c3RhUEJxdzg5TmRGS2lCUGlMdER1cEp1M2hncWd3SW1Ec2lqendnVHlicWdi?=
 =?utf-8?B?NGhIbGNHWEZSTnk5OWxhb3BYaVdmVm8rZ3k0eVlVdFN0Z3BZak5zYXNBNk5y?=
 =?utf-8?B?bU5nNzR5SDR4eVZVSGNSaUxFRmF4QmJMRVZ4T2ZhdGhWM2FNSUxPTlZud2Vj?=
 =?utf-8?B?d0lSODhBV25GYjhwTlJzNlo5MU8wblFldUpWR2FFa1VMVDRndG1USU56d0tG?=
 =?utf-8?B?QWdlM1FTb3crRHVPRTl0VnMvbzdrdHFIMTFLZjNaYzZuL1U5UnFKR2g4UHh6?=
 =?utf-8?B?aG5Wbm5RMGc1Vk9YM2FuVG5QWmFzYWs0NzdBNTVyZ1R6Zk9hRmh2dTFYRVRm?=
 =?utf-8?B?NDBjUStWOXhOdDRiRFVxQ1RVYU45SHY4QlJhOExQU3JPY1FXM3FrM21GM01n?=
 =?utf-8?B?N1o1R3FCMDhMdUlxUHpLdExqV0JWYTRhcjNrdi9BL2YwTEczZC9vaFJVSVZj?=
 =?utf-8?B?V2tLYmN5aUQ4aVVmQkdLVjcydDRSL3ozZ244MEpDbEZBN3FoakNFT2xRZEQ0?=
 =?utf-8?B?U0hBc21lWmRRSkdxYjIvQjQxeUpVRnpQcjZwL2hSSzExNmtpbkVTN3FMNEdi?=
 =?utf-8?B?UGVWYkMvazJJdEdmekdCdldrd0VFMXRoQVZNQS9NWHlCMm40b3J3M1dKU3cx?=
 =?utf-8?B?eTNJOS9rMlhBWWxVZnBOS1lrSTdWMjZ6UXV1a1Q3eHNRb1pBSnB4S3BQNFla?=
 =?utf-8?B?N1FZTTkrS05oQUxSNDRiWWE5OWQrY2ttYXIzU3JjenJKNTN6YzZlZFQ2aFhE?=
 =?utf-8?B?SVZwelZ2VStLMm51Yno2eUFxVmV2SmtycUpVNFkrSHFpN29yMURMdjBSVUV6?=
 =?utf-8?B?SElBRTh2aUhDM3VmNzIvMUVGZGZyTXZ4eUVoZEZDQjZaSEVvV0ozK081UjlF?=
 =?utf-8?B?M3RUbkovd2JCdW1OMEd0MVVCVVIzOXd1ZVdvT1Qwemt1aGUzQW9Md1VxaG9X?=
 =?utf-8?B?aHhXaUE3ZDIxRUFTZU5EdHlvNktrMHBmWmJMYVArSmxXTlZYWWc3Z3oxeklv?=
 =?utf-8?B?bEQzKzRTN3V1amxRdkJIWjF4RVVobW5Kem9jcjFOWkhUOXJaRTB1bGZ2V2pL?=
 =?utf-8?B?WnkwRVdlZEZIcnhRaEJkT0h6SlV3VU9YK1JjMERLejhSd3FUZ0xva01vaVFl?=
 =?utf-8?B?UFNkeEpmYUtoRXUxdW1iSFQ5Q1JsUWF1R3RTd2lrZEt5cDJnUkt4K2p1akRP?=
 =?utf-8?B?MGNMVm9yYVNEWlk5TU5Na09Ld3hQRXg2a0Z3VEM1bFdRU1hrZnNWKzJySE9w?=
 =?utf-8?B?ZW91Tkp0dnpySFpFeTBRRU5oS2FqS0hLK3RQaC9FRjZFZHlRMmN1RWRHYVNE?=
 =?utf-8?B?VnZVSDhuUnNUdm05Qm5pUlBjUlBLbERDS3pJS09kV09FcEhiWGlxd3NZcnF3?=
 =?utf-8?B?K3UrcCtVYTU2QTAyMk9TZkZ1OVpoYjhBWEVEMmlJVTFBRWlndlF2QU9aUUd3?=
 =?utf-8?B?dXA3TjY0N1VxblJUcWRVUjBwMEd6RDFsc01qWmZYNjRDbjFScE5taGlkZGFy?=
 =?utf-8?B?TmlIcy8yZXJ3enMzcHEycjk3WUt0NVhPbjVJYzQ1ZTBIRGpxYUtRWE9CcWdV?=
 =?utf-8?B?dGtlNWRZTWt0NkpMMEg3ZzhycWNzL21WeTBSK3YwTFBndGpFdjlLWkFub3FR?=
 =?utf-8?B?bkIrRDBEQnB0N1dWY1hNemRCUU5xbml3dmI4clM1VEdqV2NQVThWdHRrVnU2?=
 =?utf-8?B?UmExd2p4bmF3akNEVXdSWlJ6azErWlAxYk82ZWpxZWlPeS9VY1hxdFN2Q2s1?=
 =?utf-8?Q?M/kbfl8td0dqlkb052yq+y2bI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f0976e-c6c0-4d7b-b638-08dccbf438dc
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:41:36.8413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZZmqzZ+8lNZ/SdcpFQ/GiXzZF3+1IjuFdEPWqi525pB6KDDqeiQACLJpZh194FoeBXHyiChxomir2qbNgZZ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5359
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

This patchset attempts to fix some errors in udmabuf and remove the
upin_list structure.

By this patchset, udmabuf remove page struct relay, only use
pfn and folios.

Some of this fix just gather the patches which I upload before.

Any patch has passed the udmabuf self-test suite's tests.
Suggested by Kasireddy, Vivek <vivek.kasireddy@intel.com>
Patch5 modified the unpin function, therefore running the udmabuf
self-test program in a loop did not reveal any memory leaks.

Notice: Test item 6 maybe requires running the command:
  echo 1024 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

Changelog
===
  v4 -> v5:
    Patch1 doc why pre-fault failed not report error.
    Patch2 no change
    Patch3 update ack tag marked in v4
    Patch4 split some change into patch5 and patch7, this only contains
           udmabuf pin folio's function
    Patch5 add helper init/deini to clean udmabuf struct initialized
    Patch6 remove unnecessary code
    Patch7 remove reuse folio remove v4 patch4

  v3 -> v4:
    Patch1 fill vma area with pfn only when true access.
    Patch2 no change
    Patch3 select VMAP_PFN
    Patch4 use function pin each item.
    Patch5 use pinned folio array instead udmabuf_folio struct.
  v2 -> v3:
    Patch1, avoid use page, instead, use pfn, and use vmf_insert_pfn map
    suggested-by Kasireddy, Vivek <vivek.kasireddy@intel.com>

    Patch2, update acked-by Kasireddy, Vivek <vivek.kasireddy@intel.com>
    And keep the kvcalloc on the same line.

    Patch3, avoid use page, instead, use pfn, then use vmap_pfn map

    Patch4, split v2 patch4, single update codestyle to keep review
    easy.

    Patch5, another way to remove udmabuf_folio
    
---
  v1 -> v2:
    Patch1, 3 Rectify the improper use of the sg table.
    suggested-by Christian König <christian.koenig@amd.com>
    
    Patch2 add acked-by Christian K�nig <christian.koenig@amd.com> which
    marked in v1

    Patch4
    Modify the data structure to restore the use of pages and
    correct the misunderstanding of loop conditions such as "pgcnt".
    make sure pass self test.

    remove v1's patch4

v4
  https://lore.kernel.org/all/20240822084342.1574914-1-link@vivo.com/
v3
  https://lore.kernel.org/all/20240813090518.3252469-1-link@vivo.com/
v2
  https://lore.kernel.org/all/20240805032550.3912454-1-link@vivo.com/
v1
  https://lore.kernel.org/all/20240801104512.4056860-1-link@vivo.com/

Huan Yang (7):
  udmabuf: pre-fault when first page fault
  udmabuf: change folios array from kmalloc to kvmalloc
  udmabuf: fix vmap_udmabuf error page set
  udmabuf: udmabuf_create pin folio codestyle cleanup
  udmabuf: introduce udmabuf init and deinit helper
  udmabuf: remove udmabuf_folio
  udmabuf: reuse folio array when pin folios

 drivers/dma-buf/Kconfig   |   1 +
 drivers/dma-buf/udmabuf.c | 272 +++++++++++++++++++++++---------------
 2 files changed, 166 insertions(+), 107 deletions(-)


base-commit: c79c85875f1af04040fe4492ed94ce37ad729c4d
-- 
2.45.2

