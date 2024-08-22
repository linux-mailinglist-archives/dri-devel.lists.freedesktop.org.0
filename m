Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD6C95B0C7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 10:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9C110E5DB;
	Thu, 22 Aug 2024 08:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="UK0CVOd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010019.outbound.protection.outlook.com [52.101.128.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2187C10E5DB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 08:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/A1lMIXSdpE1nzP3Z6exExAQ0f+T56TIQOVPnah5oeesiWafXwJh+pkK0wr5PjRAs944UE3sflfagjR4aKyEsnaZkzy79Vrn0ScEW0mj0GvjxrEwhB6ZgPAM7ljXlR4iQFZV3qG1pujm1muJYwhHcxwBcppF0Z1i8TKpO5FPnfPOs0QfaXr07tyHDjc4dAr2zHB/ELNlgyqBnu5/lO0/bQdtJx9uNMPkuo6nDWED3m0wk0AX1mhC/qxP3Q8Aaehjsjob2saVHz3cswOJ7fA32t9zzsE6Q3Zxr0vrrJS/a8jKdJ7eyF0sivacK068lVs5FizO9LGn0sk40s106yTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZ0EDg7J5xF9Ken8evvZ/Cghi/i1KIkpLvh/LrUwe24=;
 b=rK6khwUwBswDh9QlB1G7UwTmUCnRByS1KrRJujAjT2EBgZM3JDx4gkHzBx23JEvHKX4h5wffhFS0Kk/6UDVs9T6ALHCe/TxwDFAMt7sfzm5eWQIuVm7P9M0ib3JDkswnpuudqNZJ/URu5WA9YMz/SoGm1P10ug7sVNpR4puIEAdnfqTDrJCspLAQ+J8zwhp4Lo3DYDOov5NXxQuQbufz5kqDpR4FaRgrBUL39/ykyiyxgxk9f1A2sGvMm3qOs29h5HuLK0jDARbV8WMHdhl32yU8+IRLMddDiScivF8zl7GqSrTkwO+GIFt44QWbFdCRsOdM8HQkIXFCxzoW/0YnjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ0EDg7J5xF9Ken8evvZ/Cghi/i1KIkpLvh/LrUwe24=;
 b=UK0CVOd4wkB2q16jEEyQvy6/dnboFj2MOeiQoEWNxzulNz2n5B3eqTjnzkQzUDlTcR2DU3iqeLtA8sfuHGghzTlvmZ6cU9guClkaCwr9k/jFBvGrrbXroZiaXrbuluustLjvs84FMDby0B3G4EuW/KSUmlb7RwgoBc12KAd9k9t52Xq9t6XaIsP588dUU/Mh/BFJGnRpoYRRWG1NqZOYu505Q5QC2j5X1nHsoUSpJP2sccVSSPg+XrvKBD7s5REm+Ow5YEdMsEqWU0MXwrFu1n3eBIVYbWfUKvP8pGwvebQRN/6YoO+yuI2daLxmix77G3izMcY+MxjaJrLv4rbG+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB5400.apcprd06.prod.outlook.com (2603:1096:101:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 08:44:39 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 08:44:39 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v4 0/5] udmbuf bug fix and some improvements
Date: Thu, 22 Aug 2024 16:43:32 +0800
Message-ID: <20240822084342.1574914-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec5d0e5-0118-4742-48d9-08dcc286a887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEhTcFQ1MEtPcWYySUpKNE9obmlDblpSbXdRR2N5UEY3MVZnTWlYV0IrdWhw?=
 =?utf-8?B?V1l5WVBFZjFjeXloZHhnN2VRdzUvZkhaNUs1VDJPZk5PTS82aEROcVNwVXRZ?=
 =?utf-8?B?c0lQNEcxd2Z4eVp1d1JpMmZzUnlVK2h3VlpLUEZHdTYxcFJZVmJLT1FmRDEr?=
 =?utf-8?B?QnYzbG1iSWdxUWpTb2kxODJyYWVOdVc2QndsalppaWtUZ1hGbmhIejBFakly?=
 =?utf-8?B?Si9Dejg4WVdzVDIvbUdZQjZ3bXZiU2pHODdRMUR2dStjSWNTamozOUdrZjVj?=
 =?utf-8?B?aWdzcWRJbEdFTDB1WExxK1hrOXpjN2NRN2JvNFF2SVJnMWNqQ0pJbzYvelZT?=
 =?utf-8?B?WGJROUovK09TV1hSUVdkUGhubWwrTWo1T3ZONzlqYW8xWDJHM1pmZzExSTEy?=
 =?utf-8?B?cmxBbzUxQUEwNUp5S3VKQ0FWNDlNSkdVdFNqRFd5TXZVQkt2M1NZblI0S2gx?=
 =?utf-8?B?RzFUMUxLYkZaZzlnOGI4eks0RFBhMGlFSUp5dWtST1Q1SG1vNCs2NHVGYnhr?=
 =?utf-8?B?ZzRPbjg1dWs5KzkvWmoraHluWFlBTEEyamp3VnNLMHdKbFk3a0QwZ0JsSmhq?=
 =?utf-8?B?OVA2emVxNlhQTzBXeUJ6SlE4VmNscTBwNk16NzdqSnF5RUxQMWNOdmVSOU1v?=
 =?utf-8?B?c0hkejFnem5FOHJmYU5vN3U4M0xBNnk4eUpqQnc1bkpGUHdoMEZtbkFPREh0?=
 =?utf-8?B?SjlRM0lyUG9MdWlQejhrMld6WEZhczVqbm1IUjByZnB0YXQyOW80Rkc1Z3B0?=
 =?utf-8?B?bEJmUlFBOGVDUEh3NmRCRjkxMXVoNEJ6RkZDZmFONlhDalpNc1poUkNIVWdR?=
 =?utf-8?B?eWc3NWR3ZnNjWmNRRmg0WDdIeEs4NWFoUFBBTjRQVmg0bFVTTlpkMW5JRXZN?=
 =?utf-8?B?dmZDL1NGcXVIWSszV1ZXSGRqR0NSVm55NFhON0xRSjVHaWs5eDVRSktOcnVQ?=
 =?utf-8?B?cEhjTU1KOGpUSkRJVzMwYm1YNS9CdHV5ZFd2V21URkV0RHl4ZVdpRHJpN0xD?=
 =?utf-8?B?ZEJpZFBMdjNrZjVaVDBQeHZqb0pTUTh6VXU3MFFDODg4U0M3TTZJSDlyVGF6?=
 =?utf-8?B?NFlnd3g1UTFWWkVIUWhtTGRpSUpHU0xSTFJLT1cydnY3MnRtOFd6NnFzcGFR?=
 =?utf-8?B?L2QrZ3A0SXVVdmpRbTVrVC90SE42R1llUE1GZE84TEZZSEpJc0Eyak1hOG5a?=
 =?utf-8?B?OUtQVkJxSWpMRHkySDU5bHVlYXdNWFZnM2c3dWFHb0pudE9xRUlaR2NSbEQr?=
 =?utf-8?B?VUN4Mm5SMThlQWlIbEpBaUkwMjFWVEVBNWZuVkN4SHBsZmlRdUFXUnlZVkds?=
 =?utf-8?B?ZE1ZRnRSZ0pmMDhXOVNrK1pEa2RaNjA3ZkpHclhFQTBFR2gyNFg0UW43YURo?=
 =?utf-8?B?UU5sSXJIenNYUEp2ZGtPWnM2UTYzcWxicUEzYnBhcEZmdzBna1VvYmJGNnpQ?=
 =?utf-8?B?eGVCaHBZVnlYOVJFdS9tQ1hJYzYzY3hjMUNDMGFrTDUzc1lKeGNBZnAwQ01k?=
 =?utf-8?B?bEJ5RSs3WWkzalBmdEtQRjNQM09vMUVFY0Q2NzY4R1VvY3FMY2Z0dlpDekVj?=
 =?utf-8?B?MklCNDhKbGJMNnRZcE95RnVpZU9SaWxXWGlhWkl2Vi9ZL1BJU3VPRDJVY3JO?=
 =?utf-8?B?czNWbEQwZklUOGxpdlBsV094MHRTSjJaQk5QRU95OUpCOGRjdGhkNHdETzRH?=
 =?utf-8?B?KzFUZktYd1NxcStXNmI0TWZxK2JZSWl5YzczMDdNZjRjUkQyZzZPZUw5cVIr?=
 =?utf-8?B?UHhpZjAveVRzakYzOGd0Y1Yvb1ZucWxneW9ZelljcU5YNDJlSU42ZFpaOStW?=
 =?utf-8?B?eTJXd0lTV0UraHJhZTNYQ3ZkUzYxSUwzSlRQRzRYMFhuSzIwYmxHTXJWdGND?=
 =?utf-8?B?d1FvQXlKYTFNQS9LbzZteUxDL1RKYi9LQnhhNE8xZks2NVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHdoRnVQRUY2KzJhQTZ1OXRHMklXajVpSU01QUJlMVR0MVcrUjZRU2JlWEl2?=
 =?utf-8?B?N1hPaFQyWlNQYzg4ZXp3S2Z1aHBwM0dudmlHOTI3OU1JVGkyeWJDakhrMis1?=
 =?utf-8?B?TzFvSkRmNVB1ZUExWDg4dmFhZjh2RmZmVjJIN1djNllLQzYxSGpEL2NiYU8r?=
 =?utf-8?B?bzZ0N01paGl6ODNOcktwUWdnbGJOQ2V0T2lJVFg5SGtEbzRBbXA0Wkcyckxl?=
 =?utf-8?B?Y2c1TjJxOUNNdzdldnJNK2FRMTlUUFZlQTJtaHAyTUVsZGZDUjc4N2dWU0ky?=
 =?utf-8?B?Z0ZHUTE1Z0MxekVmUjVNSlRVOTdtdWJyWmxDa2xlU3VQWTJMUDhhNE54Z1FC?=
 =?utf-8?B?YjRWN0lMWWZpWmwvcnJDdFpOSnR3QWRpVGVrSTNxWXFRd2ZFTGo5Mjd2OURO?=
 =?utf-8?B?K0lRazZCNSt2Q29RTnA0ZlBSRUVOL3dWV3I4YXFPN0tkTzNVTFo2dk05TnNn?=
 =?utf-8?B?endwUEoweXRsSkdzdFBJTFpSL2JDNVBablhGRjc0TWZnZS9DZndnaWdmU1dL?=
 =?utf-8?B?b1RNak9hYXlTaytjNWFEOUtBWHcwZmZtMGhLOVJOcUx5M1RjcTVBZ3I5OHRn?=
 =?utf-8?B?TXBNZkZpbzk3VnNSYnN5czgwZlpqNVE0eXVya24rSTdOZVVWYWk1SG93cXRT?=
 =?utf-8?B?ZFZGYUNkWGdyZ2ZLUkkxd1BhQ0hyaFMxRG4vTEJqZVhhQ1hTTU04bGR1S2wx?=
 =?utf-8?B?NHBsK0F3SFVNYzcya1pHR213SXc5ckVzRFBYYy8yU0t3TzF1OVpUQ21vOGZZ?=
 =?utf-8?B?Y2pJTHgxa1dVdWVzbmM2T2hEZTVzNm9lS0MwUExYQlp1S005aWQrM2JZT0hu?=
 =?utf-8?B?VVcwd2w3bjJ0cDFhVk5MOFhtaEVVNXdMcWtOVVAxSGxPbG1kTkpZL2VjNlFh?=
 =?utf-8?B?ZlV4dmNOdStRU3V5TzIybWI4UUNFU0JrOXBmNWZFWURtdmR1TE8vdm82bXRy?=
 =?utf-8?B?c3B3VUszaWdlQUpTZXFOdUVCbWVEUUk0bjJrVUhMNWt1alpEN2l0a2NNUWtD?=
 =?utf-8?B?b3pFYks4UG9wWUkxYnczN3B0V2tEeSt0N3JuM0hRTmNmMzFVYng5aFNxM2dO?=
 =?utf-8?B?bUpocmZ6WC8yTk1jRzU0WTJ5cDBWZlhJYk9Rclp5eEJ0amlMUVpFQnR0dmJF?=
 =?utf-8?B?YjJvQk8ybXVjK1pGTFo1Z1ZvdXpiUGpGUHlUNk5SR0s2bUk2Qnd6K0hlYzJV?=
 =?utf-8?B?dWU0dEY4TDNnb09aQVh5U2RQQnNMRmsxYzFwaC9NbEN1UGRvY3FRdGdUWjNY?=
 =?utf-8?B?cnRTeWozTUN4Vnk3VVpnUjVTbXBZRVlpQU1hcnpPN0ZLV0ZXZWpLZzV4UEsw?=
 =?utf-8?B?WVl6WVF6NXJPYTEyRXM0YTMzOFkvVkFRaW9NV0xGTktVeGg4WWg1YjJMa015?=
 =?utf-8?B?aHkzaEFmWldVdmZzYzUwYmhhc0dGYXIrMFR2REpiQ2gvZi9hNkgvQlhIQVNK?=
 =?utf-8?B?VVlXRWtad1hvNXFUWFVNZVN2L2Vycm4wNVZQaHRvdU5CSy8wd3pHR2VOV2Mv?=
 =?utf-8?B?cmRXMnh1UXRuamhqRmhsYmpZN3BzL3FFdmVJMldxQk5lejdZZXRpMStwN3BG?=
 =?utf-8?B?bStpdjhza3BXK05pVE5uOHI3Wlg5TW9UQURuMjlzM3ZoRjcvUmU1V3IzNjlU?=
 =?utf-8?B?UTZ0YXZnbGJVR0UwdFVxQTNxcEE5WCtxUFI1V2N2NW9QblQ3c2ZQWElXSnZi?=
 =?utf-8?B?bE9Hc25vakU2Q0ZwajRhZ2Z5SFhrQmRTRDJRclByNGdxdXBJaEh1aEJUaE1K?=
 =?utf-8?B?MW1BTWk5NDNUaTJEWms4S0tEL2loL0VOU0tPK1ltOFRCV20xa0xOUVplaWFC?=
 =?utf-8?B?WWVqVlVFYndLNGFQU0Z2eFo3TjVKTSsrWmlXS0pPMk1WQzdBRDF2bWVtTHU4?=
 =?utf-8?B?QUp1TUNqUDJNVG9mQlo0Qkt0cDEyLzRUYTFZZXdIWi96QVI1aC8wRXVTamls?=
 =?utf-8?B?NFdjeTVacTJYa2FaZkI4dG8vNHArRkJoNEZsQnMxMFNabncwdWNvcFpYSmsv?=
 =?utf-8?B?cndKcWcwdzdNOUhrdGFVbXZoR2VqakVzeGlkN1dyd2NYUDFBTmhJOTAyU1Fs?=
 =?utf-8?B?YjZsZ09BQ0NlcURQeWZuVVZUQVBIcmROcFNrUGZlSWM2KzFYdHBzcVFXaElU?=
 =?utf-8?Q?QG2ozKHTYNS8c56C7yFNBgxmx?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec5d0e5-0118-4742-48d9-08dcc286a887
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:44:39.0299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvXDUSv5y5yCsXum1OMeh5kQ/C00g5ta22F0x60S7J61JINUYsEIiXi57vAK2x3djDsLfE+hf2Nyw8NzHC6DWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5400
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

Some of this fix just gather the patches which I upload before.

Patch 1,2,4,5 has passed the udmabuf self-test suite's tests.
Suggested by Kasireddy, Vivek <vivek.kasireddy@intel.com>
Patch5 modified the unpin function, therefore running the udmabuf
self-test program in a loop did not reveal any memory leaks.

Notice: Test item 6 maybe requires running the command:
  echo 1024 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

Patch1
===
mmap just pre-fault when the first access

test this by look run create udmabuf
size 3GB, then only record the "mmap -> memset"'s time.
This average show 1.2s cost

compare to direct map when mmap, this also show 1.2s cost.

environment: archlinux, linux-next, 16G, 4 core.

Patch2
===
This is the same to patch:
https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/

Patch3
===
fix current implementation of udmabuf's vmap issues, use pfn.

Patch4
===
Change codestyle and fix a potential bug.


Patch5
===
Attempt to remove unpin_list and other related data structures.


Changelog
===
  v4 -> v3:
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
v3
  https://lore.kernel.org/all/20240813090518.3252469-1-link@vivo.com/
v2
  https://lore.kernel.org/all/20240805032550.3912454-1-link@vivo.com/
v1
  https://lore.kernel.org/all/20240801104512.4056860-1-link@vivo.com/

Huan Yang (5):
  udmabuf: direct map pfn when first page fault
  udmabuf: change folios array from kmalloc to kvmalloc
  udmabuf: fix vmap_udmabuf error page set
  udmabuf: udmabuf_create codestyle cleanup
  udmabuf: remove udmabuf_folio

 drivers/dma-buf/Kconfig   |   1 +
 drivers/dma-buf/udmabuf.c | 281 +++++++++++++++++++++++---------------
 2 files changed, 172 insertions(+), 110 deletions(-)


base-commit: 6a7917c89f219f09b1d88d09f376000914a52763
-- 
2.45.2

