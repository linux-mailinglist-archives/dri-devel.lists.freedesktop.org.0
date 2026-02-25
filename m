Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMJ4JUmynmlxWwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:26:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1146F1942DF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6015810E1D7;
	Wed, 25 Feb 2026 08:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YYFe+q9f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4A710E1D7;
 Wed, 25 Feb 2026 08:26:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ah56fw2THIeKkDQBYuSkET8s6jN8pMTpPjZT8JX44YTBB8SDjjBWaEe5B2k8erTsJkDle6rWgFSbcjQLNse4rch9/tiPyjKLOTRBT5Ps1KGYOVuaOc2Smy3r13rc39xAKhbgHNVwOo7oI6EaVwg2gMiwTcoQ8iiw6iJJaohRQFS7yv88lLluvXtPAejlyM313104rn1NAVW3DByn6mOg2b+TWzdn1BIOe19mxaE3w5eoSJ5vtRZEeG+9W7EYdneq1pja2laNzOhukCsrfVhoKvRfz7gimifD7iuuh8ncUG6GIog5Lr7B1CWHBEpB50tyiBKvpfXO+52Kn6Sw0rLBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oquWuVf/gWLzgrFvELZ87JxTN/L/4Q1Ae65RDGgNe3Q=;
 b=t2++ehiahPnzwF0k/yvEW99tAyfw1LA+rz6F94sDE9sL0h8tH2KxVQFv1mWHgkk0NuBf0An2N394ilqk5PSmKbRlWAHqEqYY1SjwEsQyam3eeE/EHvtKJ8Y3NsoNeKlFRDXfqLF3zamOHyow4uPSs5w7z3QZpo8ph9fJ8Uy/RWAegWAD9iE2uZBmX73ZbACJmVzJy4LU6UV+q8+rBMxIkdGXNF/sFxKfNSzBI9lvybSQnEITDX5hVr4xAyEHnGxJVJZVUIVv5TKDgNAWlzTYGf7acjX1L1wAjfUpe65A+zbFJfYLMnv2xup6SP2kMrTudAcaTXfTL12+ukNTBh79Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oquWuVf/gWLzgrFvELZ87JxTN/L/4Q1Ae65RDGgNe3Q=;
 b=YYFe+q9fqHLfzAw10XgH5IMWYxXyQGiLjck9fisMX5cYH27tsmJvUwddvJtgnIvSNnMXFjSiPQ/+JbtMjjD7jewLagdIUjkr1EvUudiqyQecb7EZsAszRNgfWVaPooq2lP+befju4gGTXvKMyf/Z6ox2oSfFC6tfDdQ0CAhUxSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6817.namprd12.prod.outlook.com (2603:10b6:510:1c8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 08:26:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 08:26:44 +0000
Message-ID: <6c2ddbd0-c96f-4728-bd85-8b0ac10bb529@amd.com>
Date: Wed, 25 Feb 2026 09:26:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: Assign separate lockdep class to chain lock
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20260224175544.2167712-1-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260224175544.2167712-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fe8f31-005b-4a35-2b52-08de74479be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzZRUXJKckVuZEhjYWN3cGpKVEk5aGZ3cDFTLzRQQVRDL2pMZFFKbEFpemNt?=
 =?utf-8?B?UTR2QWNIV0JRNVhkYmN2alRGaW9Nc1hRTG11bFloQ2lSVG1YT0s3bDVuM0tY?=
 =?utf-8?B?WlpTN3pVZGd4S3VQZlVIWjhQelRIcnpteVM1aXA5TlM2czM4cUZIMm5YYkZK?=
 =?utf-8?B?ekgwTE4wbWZvUzI3NXN3aEZvaVNKQU56SEk1anZvOGUzenZMSjdmTUFBeng4?=
 =?utf-8?B?bmVRakowbnRZOEQvZ25jYzNmLzRjVGtRbjYxR0ZWWE15Z0Z5NlEzbjJ5OUxa?=
 =?utf-8?B?NzBEdUhuTEhpKzloSGxQWm9BL1RUWi84ZjFrd2g0Sjcvb3R4N1JJeW9BMlJG?=
 =?utf-8?B?MnVNNGhERmRPK09Jb0trVU5RZkc2WDV5Tmd2YS9IdHo2cXd6SFpSbjlsZjJy?=
 =?utf-8?B?SkU3alpxcUFxcEs2ME8ybitUeEdCT0dDOTR6Rk93dUhNS0ZRczF5N2VQbXRT?=
 =?utf-8?B?dVpBOVF0aDVLMGxtOE84REN5MEx5RnMvUm1VMHUwaVFISXU3WGVZQVdJdm5C?=
 =?utf-8?B?U2VMb016YzdUc3IvZ2pvaTJsZDNBdWVhLy9rZjVDcGl4VEtFRFQ3RHlmS25h?=
 =?utf-8?B?V05ZRFp1WWZySWwyTGI1TjNGcWhTajBkeGFtZVlFOUU5Y1hrbHVuYUxjamFl?=
 =?utf-8?B?Nm5QdFJlODJVMGROcXBoUjJEVjJCbFAySXd4c2RkR0E1VVZ2Z0pDZHdEWitl?=
 =?utf-8?B?NG1taEdJeVU3SS82U2taNFNKRUY5NmwwTlpPMDNveFcwNGJmamtWNVZoblZI?=
 =?utf-8?B?NG81eGRhY2p4YXgwT0RxZ1Jid201K25XdHU1VEY2K1craWk2VHh0NWJzKzlG?=
 =?utf-8?B?WGl4N1daSzVUSGNTL3ozSTFDaUVld2tVVzdkMjZhWEVNT3N2STUycGh4bW5D?=
 =?utf-8?B?ZU82dTNxRG9ocE16NmhBYWQ4cFdsOHBxS0RVNTRvaTY5YlJTbS8ycEM0QWx6?=
 =?utf-8?B?Z2wxYUs5WkRhamRUZWd6QWJhUTk3d1VEOE00RWhoZGtJR3FkVk11dEhxWGNH?=
 =?utf-8?B?ejY2b0ZHUjZ3Rng1QmtDQzN4RTlGZkVNNTNxR1MwNEg5ZmlObWZCT1M1UTJW?=
 =?utf-8?B?V3FLaVBtb0RPNXYrYTdTcUo3eFdJVW9JdXhMU0JCcVAxZlFPRDBhTXdST3d2?=
 =?utf-8?B?VU5JNDQwRkpVc2g2TjRKaXJTQWR1aTFsUWozT3JrMTNEVXBNSWVaRWJaWkZL?=
 =?utf-8?B?MVJuNUQ5OWxIdmFGS3d1K1VncExEaGxPR21hbUVTRDFSaStPODFtSkhLbXE4?=
 =?utf-8?B?ZTZXQUxhcmpiUnBQWG81d2FwOXhha2JxVU83Z3htaC9QSXZSNDhHKzh0cExP?=
 =?utf-8?B?bzRENUhzTTdaUFdRdHN2VEhNdnlUQzBDRlhCS2xUTEF5aDVjQTV0anF3VURn?=
 =?utf-8?B?YklFT3pvckFtdldFdm55WUlaRzhRbWZlVStqMFJGOXlyd25BSGlKRHFOTHU3?=
 =?utf-8?B?bzdhbUEyQVdsZmFuYUpqd1ppMEpDYXN0L09LSWpvZ3dFSldzcVFOejk3UGFs?=
 =?utf-8?B?c1B4QkVOWi91K1hKMXpLbHA3U2dqUHZ4eVJ1Q1BWeS9QMGlHWnVIQSsvN25h?=
 =?utf-8?B?SVcvUFgzWUZ1WXh3anhRKzl0QUh0ZVV3YUNIRVNUdEhBc1JmUnBGTHc3Mjc5?=
 =?utf-8?B?N2VHRndKa1d0TlRiRU5WbzEzOENtd1JJdTZ3cmR5QXZOaUR5VW8vNEt5MVJv?=
 =?utf-8?B?eVhlVEc3TXFUWkV6a2VrSEQ5S2VBbnk5bkI0UUNSRVpUV2NTQlEwK2czY1pu?=
 =?utf-8?B?WnJzTko5Y0NiZ2ZPeVVxSDBLTFRrNFlyY2FQMkhSNTRIdC91dzd0MkxVb2Js?=
 =?utf-8?B?Y2VrcENYUmNUdGI5Nk9EVFhFblo1eWxPTXp4SjJQSnhVVWhxblRvcVZRL0Va?=
 =?utf-8?B?dDRMdXI1L3ZVRHdLTzdNUHkrT1BaWjNCK3lIMTh3QXFnejRQSlN6Rmc4eHFZ?=
 =?utf-8?B?MlMwM0ZzaHdBYzRLektIeDlraHN1UzJDcVppUmlCU3pqL1VTdGhTKzBvRnRP?=
 =?utf-8?B?VlJQS05QelVNdkxEMUk4M0I5QVJXVXE5a1E0ekhFSjVhTFl3ZEZUUWFEVmt5?=
 =?utf-8?B?TENtdDM1K2ZVU3ZOSTNYS0loNEprRkhNbDIwMGNqUGlrakRpWlBYenQ3NnBD?=
 =?utf-8?Q?sCho=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlpPQ2hFSU9FQnorUXZOWHFYSkMrUHV1MjR6ZVdJc3pscy82ZUFxOUJ0RWFU?=
 =?utf-8?B?aFVzSmFWcWtWbmlGOXBTejJFTi92TFEwS2JMSXE2MmQrZm1LV0czaVVQUks3?=
 =?utf-8?B?T0R2akRBSUZSeGM4Tlo1ZzRUYndzSUM0ZTVrNVBnbSszaU4zSUFLRHdhQ3RB?=
 =?utf-8?B?OURZc2U1Yk5Bak1Kd0Y5Qm9JcnN5RkxOcVNYZ0lXZm5McTRDWHl3S3lIblpQ?=
 =?utf-8?B?SjhvbGtSQ3ltclNzVmJpNmVROE4zZGhiMCtpWXNJd3FsRFlTeUs5ZlBsM0xF?=
 =?utf-8?B?Y3JqRFpTNkd4MUFWMDJ6MHQramw5bHlycC9nVDJUajBQM0xCVTcyc1RpV1NV?=
 =?utf-8?B?ODlKbmtTYXZMQnpmczhxcE9ZWEhycDIvNjMrancvczVQaW9ETlR3aUlWOWcv?=
 =?utf-8?B?eUxxbXNURDd1MWhMYXZpbHdNMFVySkxNSXVGY20zQUpkSXk3cDQ0akY1VGFJ?=
 =?utf-8?B?UUVNd2E3ektPbkRFQ1p4aUN6SzBlQy80SnkrQnAwNFljTEF4U2Fkc2FxY0tZ?=
 =?utf-8?B?Ky85cVE3Y2Flb0NCV2ppUGRKaURvUjFGeHlTYzJIOUVXOVloTEpvb25vTjMw?=
 =?utf-8?B?bFVEc1RNbFBiejRzTExneE16VWpTYUlqTnpMSktUU0pUN2o5QUhqRURKc3Yw?=
 =?utf-8?B?aGQvNmZPTEJhNm5YdW91MEZHZ1pWYTNFT3p3TXkzLzh6VXQ2dUlZMGhCejhL?=
 =?utf-8?B?RkdSQnI4a0d6TWhxWDlLZ1hDRW44Z0FVYS9EOWJIRWpIa3p5MWNjY3Fkai81?=
 =?utf-8?B?YW16Smd6S1NiWjVRYU00ZDhpU3FwUzBkSzRyQ0JyWC9PSWxjSGtVVTQ4a0Nl?=
 =?utf-8?B?djNHWno5SkNhM3drVFZxdW5laEpGSUlTekJ0K0xoRVBKYTc0SE9pWGpPM3Ar?=
 =?utf-8?B?OGVBR0RwS0VkYVFTMnpnNEhrSDA3bHhsNXRIUTByS09GVzQrSHJ2NHdwRGN5?=
 =?utf-8?B?QjBNcVdmcGRaZE5vVlRFNFRyNlpzc0tHSGQrb0RqU05TVDBiTGlZODlPVjZ1?=
 =?utf-8?B?SzJUK1NkS28zV0ZaUDBjWFFXY2pzcWFSZlhKWjQ2V2ZWTXdLL05vZno3UlJh?=
 =?utf-8?B?alh4QlN4dk1Gc2RBMENQTEd6VU5JMjUzWjRkazRHcXNuVlUvaS9Fem1DbTQ0?=
 =?utf-8?B?NENiVHVxbytFZVJ6NGsyVnVndWZ5VHA0M0hkSG14WjB1WGdUVWtTNENNeHJW?=
 =?utf-8?B?R1VwQy94cUJWdjJwRktVcXkxZ0Vxank2N011SGYxWW03S29ZVUlvV0pZeDhQ?=
 =?utf-8?B?U1llN1h6Zi93QitKMVozUUpLUW9MdlBIVUhwcFdIR2pneWQ4R0wyelR6enVG?=
 =?utf-8?B?TnU3bHltWUVzemVOalVOTFcrL3F3aUE4aFNTTHNjV0RBNXMzWHM3S1JXV0NZ?=
 =?utf-8?B?UElYQy82S1IwRTVod24xZmpzanlEWk1Wczlvc1ZjbWdjZHlsaDJhM3BicWRX?=
 =?utf-8?B?Zk9CYnd5cTlXT1lsQStEQnhYUW9ZWC9JME4rVkIwUEdpR2V1WE1QMzNtZjYv?=
 =?utf-8?B?Y253c0NxNjdTQ3ZyZU1IUG9tUk5IeGtTTm1OZFlWMUZ4bjZ5UlBING9qRmpT?=
 =?utf-8?B?ZFhoWHIvSWNEZlJBNkFwVEpXUkxzMmZtNVBtdEhObEo5RkcvNGtObCt2b0NG?=
 =?utf-8?B?VzFEa3ZOSmcwYk1QK1Nnd1hIdzZiczFvR3cybHhsb0lnaXM2SXZCK2VqbXov?=
 =?utf-8?B?RnQ3MDhuYTlNRjFzUnd6Y1hlWmN5YmZjejFQeHdKczd2Um0vY3JHYWVXRlI0?=
 =?utf-8?B?Yjd1dU1tQzBkWWkvSDRFU1g1OHdrWjd0cEVycFZybnVGcXo3M1poZjVTek1s?=
 =?utf-8?B?aTc1Y25pK2J3TUgwZGF2N3QvU1llR0hGWDZaQ2J2R1NnVXg5RzlOZEg3R0RF?=
 =?utf-8?B?MDVKUDAyYXpmMnR4RG1uT2NDRGkrNEtPT2NtUTYwR01Iem5tbEw0eHBLOTNJ?=
 =?utf-8?B?QmxHVGExcHJTTEtzdE5IN1hnUk1YWml5aTRlMTlqNFhJdC9qK21uVkFaU3Vh?=
 =?utf-8?B?eXptbDhsN2x3YnIwdmQ2OW1KVUNibEJYSHlxOWZZTnMyMEVnRkpVazNFSWRF?=
 =?utf-8?B?d2NkNDdOMUZ0S0FLcFNKMzFETDlJVDlHYUdVdDNDWVNRY21wSXBJR1cwRXFp?=
 =?utf-8?B?ZmppNHYrcTRvc3lsc0NrejRQaFd4UU53NTZ1bUhTVWd2ckVjUDZweWs4M1Jr?=
 =?utf-8?B?SEZwREJNWDRSSkNFTSs3alJ1UG5YeTZ3cGpyQ21XRlNDd01aYzhVaGFUa2Vy?=
 =?utf-8?B?TG1ja1daMDJOSld3RjlkRFN4c2VXRU9kTUx0eHFKaHBjbTNTTlJXOU5PUHdG?=
 =?utf-8?Q?6yARluGtmn0/24Z8Oq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fe8f31-005b-4a35-2b52-08de74479be2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 08:26:44.2642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unAe8+TYX4E2noVFFM28nelkZGar6Y2qlWyXVv3SwNYrvy49xJR3zmzkYXDBzjaj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6817
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,amd.com:mid,amd.com:dkim,amd.com:email,intel.com:email];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 1146F1942DF
X-Rspamd-Action: no action

On 2/24/26 18:55, Matthew Brost wrote:
> dma_fence_chain_enable_signaling() runs while holding the chain
> inline_lock and may add callbacks to underlying fences, which takes
> their inline_lock.

Just for the record, we have the same problem for dma_fence_chain_is_signaled().

Maybe mention that in the commit message as well for completeness.

> 
> Since both locks share the same lockdep class, this valid nesting
> triggers a recursive locking warning. Assign a distinct lockdep class
> to the chain inline_lock so lockdep can correctly model the hierarchy.

Thanks a lot! I was just about to figure out how to do this.

> 
> Fixes: a408c0ca0c41 ("dma-buf: use inline lock for the dma-fence-chain")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com> for both patches.

Regards,
Christian.

> ---
>  drivers/dma-buf/dma-fence-chain.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index a707792b6025..4c2a9f2ce126 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -242,6 +242,9 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>  			  struct dma_fence *fence,
>  			  uint64_t seqno)
>  {
> +#if IS_ENABLED(CONFIG_LOCKDEP)
> +	static struct lock_class_key dma_fence_chain_lock_key;
> +#endif
>  	struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
>  	uint64_t context;
>  
> @@ -263,6 +266,20 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>  	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
>  			 context, seqno);
>  
> +#if IS_ENABLED(CONFIG_LOCKDEP)
> +	/*
> +	 * dma_fence_chain_enable_signaling() is invoked while holding
> +	 * chain->base.inline_lock and may call dma_fence_add_callback()
> +	 * on the underlying fences, which takes their inline_lock.
> +	 *
> +	 * Since both locks share the same lockdep class, this legitimate
> +	 * nesting confuses lockdep and triggers a recursive locking
> +	 * warning. Assign a separate lockdep class to the chain lock
> +	 * to model this hierarchy correctly.
> +	 */
> +	lockdep_set_class(&chain->base.inline_lock, &dma_fence_chain_lock_key);
> +#endif
> +
>  	/*
>  	 * Chaining dma_fence_chain container together is only allowed through
>  	 * the prev fence and not through the contained fence.

