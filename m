Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE143BF9B3A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 04:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8FA10E693;
	Wed, 22 Oct 2025 02:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B8Fo8rUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012006.outbound.protection.outlook.com [52.101.53.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C370710E68A;
 Wed, 22 Oct 2025 02:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XumvyUeZNEm7TINeh/x73dBRTvJms8l/x+mUV+oBO1GoD7lJ3p+5Dlqu1ozDZ1Da0pedR/8OC76SH1iACJXfSiyuYpV6AKGbuprvYgLKIQyT+pOV5IWWGTyvzNoLjQLL2uFnyxoLA599EPhBgyICMwBwP+E4sxW8d+AAfx9fvWZqhz9s9ZPbADnb0dOh7YUNKURyT80shV8xkmaV8C9g5/SGjbUSZQjswPpSdmYUW8cl59pr5Lr/LbzyHP2w99TWGiAyZULfNwziRm16L3M14pvB/sLNYdblfqKw5K1sGKVXSmM/NUkr7L4dSJxHoG6bunDEr4Ebz9hcxOqxAfLsZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eC6mpgTVa09cBBVRkfT6R0pL9Iedxs4clFn6aeSpl+k=;
 b=Ctxmfi+PPXqfBHiBLZozDzVpbr3sExiWMMmpnnFrJqggxsUg/GQd7a2yckIo+FNfuZnYXi/X9iAUi9XlJh+raJk0fqWXbktnw79QpwPIPdimYJcPpGaKGo7AQcv/3mVf5SqQfc6xshyVLc6yMKME0jxA1FSPtYOyjpSZSpaCj0wy6Z36nyNgCg/+hc6NEPlDkfPOGTQCDfDKdM4xjJ5dwQcRBlR5HsVVV/5pRJO6n6bDF1/lDkwC8u/JONUOwRXAOhG1JOCsuCzq+HXrmVMBLJ3fH+sL3Jis/iPJYWGOX/LDrjTIdVLZwMNF9m92Vy6zfk5oGJ0G+7gsRELrYEn+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eC6mpgTVa09cBBVRkfT6R0pL9Iedxs4clFn6aeSpl+k=;
 b=B8Fo8rUo0GR8QSDp899/oZF62UcHa542RHpjuyvXeh9472lawOVzm/BpdQ7eKoEhlq7GZUpussQtVI3s2XRbyHjqmqwUvUil9oJLvEN6plsG19r2cDReOGLh3q8JPOwKu8p1PlJwi58j/PSnEP/nzM4LOxUzPsmPBQN46r0pa/p0OBMi4uTMyuayXDApb+Nywo/ky36kJneV+cI5yEH9I5QQuffhT/osWOz8F9VWkH9Qww4ljJ8JBTRtSKhqcGrcqiWedmPcaPkG/du6kzrA3j/uDHibgz+NaHWbq0InBrTxzYOGUGzdjuKd5NxAcqkYheKbjg4JJW70n9fgwbXlyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SJ0PR12MB6902.namprd12.prod.outlook.com (2603:10b6:a03:484::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 02:18:38 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 02:18:38 +0000
Message-ID: <0cfdfc96-f98b-4ec1-9218-10f7344d6605@nvidia.com>
Date: Tue, 21 Oct 2025 19:18:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] nova-core: mm: Add support to use PRAMIN windows to
 write to VRAM
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-7-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251020185539.49986-7-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SJ0PR12MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 63126da1-6fb3-4181-a1d5-08de11114feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTl5cXJNb2VDVEVGV1ArQWYxWUFqRjFCdHRaOTJSVmd6YkFRaitPS2dvWUU2?=
 =?utf-8?B?RVAzeG1Yc0xPY2hkYjZWTi9id1F4bUFvN24ydzlEZkZIakVIeE9XSWE0ZVlE?=
 =?utf-8?B?SW9oSDdxVncyUFFjWk9kdC9oR2crRWxJNWwzUFVZbVRpYnUvczQrMWRVRWVN?=
 =?utf-8?B?YkxKOThBKzJmQjhoYW1rQnNXT2hjdWNwY0ZFS2p1Q3NVWTJkOUM1YUhGZHhC?=
 =?utf-8?B?T0cwMjlzL2I2S2p4YzFkSDY0SENzTmh1M21pNUFjWjdnd09OaVc0NU9SYlhE?=
 =?utf-8?B?cGFlVm9OdzZzUjB5eE56Y20rYXNDYmtoMDlJcmV1N0JIbWJ1Yk9LdzhRMG03?=
 =?utf-8?B?R0N5dDJwREFUQjRFbHp2SytUemY0S1VNVSt2KzJzUERjUm1DNVFBQjhGcHBC?=
 =?utf-8?B?cmVLckVrbjZCRHJDcURHSFlsSUFwdDJmZ0NFWExjQWV5OE5BcStNUlFDTTM4?=
 =?utf-8?B?bGQ0YXVLNXpQVDZjKzliSFh1K0Nla0JNRlo1aE9BOGN2RjdlNW5id2xMZ3RY?=
 =?utf-8?B?TUMxTnk4SjBRYzFHdUhxckZMMmtTR2ZydXB5Um9iUEJLQTZGTGZnODJXSmpj?=
 =?utf-8?B?VGhyV1hITEtYNVZmbDM0dzdGYWI2SkxSdWt4MDBQK1NxRlA0ZVJUekFSZ3B3?=
 =?utf-8?B?bnZIRHNIOFJHeE8xUnZEUzNHenNHanJ1R1ZBRDFjUHM5QXpWWU5acTRGemtB?=
 =?utf-8?B?WUVjd1QrMmdSUzR5L0JBcDBKS1VkMytRN2tXaWEwOXl6anA2OXkwUCtNYTRh?=
 =?utf-8?B?NGh2ZTJkVzZWN2xhVFJkNHo2N0p0dGpyc0o1MEJNa2hBWFBrUFdTaUlsZkxi?=
 =?utf-8?B?amI0ZVA1TmhXS1N0T1FnMmF4QkpGaGJLVitsQmRhWGxNZ1ZQMDRLbVJscTlF?=
 =?utf-8?B?KzFMV0ROUlR2Ri9udmRGeisxYTg2UmJxR0ZHTXNpanluOG1zMXBqeXVudjM3?=
 =?utf-8?B?cGtKbkpUaTRRN0dscFZMQU5LWDUxczdtTjVZSFdmNHQ2VlRXNXMyNjIybzM5?=
 =?utf-8?B?Y1V0V1k3enFTUGNVZzRBck5vT095Z1lFNnNuWGpzQWNYT2t0S1BIa0VCQW1x?=
 =?utf-8?B?UEM5VFI2MmxLWHpIWWZiaEpmYmVSVkY4TzY1akdTNVVVclFpWWN1cTM1Nk51?=
 =?utf-8?B?aGVHUExPekQ4cXdvR1g5aVJPSHRMVzRJZDArU0o5V2t6aThidlRwTDV5M0hV?=
 =?utf-8?B?ZHg4KysyaU5OM0hNNjJJRWg1dFA3U2NwY09aZnlLWnFXT2F4Mi9VNGN3Q1lu?=
 =?utf-8?B?S05wYUFRekVYZU56b2dRbC9sSWRpR1dyZGc3OC9vK25ZSFYyb20zVTk1cE4r?=
 =?utf-8?B?K1JjTmpwaWJtU0RXcUZ0Y0NaV2JNK0RXcFc0SVlDanZzcTFldmJGMVVmbG1H?=
 =?utf-8?B?UERCTlpFU0FZYjQyTFJpWDdPT0NvWEpybUJxUkhhYnJXNlFkYUcwY29LVDBJ?=
 =?utf-8?B?QmRRc2pCaHJ2aU1IUXk5L3dkS2lRdG9qRVhaWTB4eHN2QXZHK1B1WlFKNUph?=
 =?utf-8?B?ZnhHT3VNSGd4d3NxT2ROM1JrNzFzVW0rdll4eTBGT0ZhZ003anVET1gva25n?=
 =?utf-8?B?dThNNy9qek5SY2lvamlwTHJwQXdYcUx0TVA2L2lEcmg5RG16T1NpMWZ5VGxw?=
 =?utf-8?B?VmJVRHJhbUc3c3pYdkMrcm1mOVNEWnJ2NFYrQkNkRHVFK2hvN3FUTFlOK2lS?=
 =?utf-8?B?SStVNitpdnFpZkVTL2U1aDJnbmRGQTVvT2J5WTRvSi8zdGRrdU9CSngrMGIr?=
 =?utf-8?B?YlJ4ZzJtR282REl2TUVxOU81MGtIeTRNR25zZGlYU0RLaEcrNG1RZ0daUGsw?=
 =?utf-8?B?NU1rVUJ3Zk0zZUh0Ui9VdnRSQzErYVJpVERvWnZGRkVWWVZUZ2twWXA5MTJY?=
 =?utf-8?B?dUMvRUt1UTNkTWJ6V0lUQzRqSnFZSmxIUGFXVllWSWRVazE3d0pCSWwvYjZH?=
 =?utf-8?Q?yaJW3yd+GKCFxtD0lOg/uZkYVJDrtXLW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzA2Q1ptL3lQeVF0cE1MSXpDb3dzSUNrQVI0WHJHSHBCNFdtTTJqcDU1VWJL?=
 =?utf-8?B?Q0lleFo1SmdDS1RtOUVxakN3V3JOdUNiR1ZNcGRpam83S2wvcWU0Sm85OWxP?=
 =?utf-8?B?Z2VSam1zcm1CT2wyNFF4SFplcC8yWHgrUFd4V2ZwN1FCTGp1RDJPRUhQcUNz?=
 =?utf-8?B?dC9icjI2Rml6Y2NrT2FKUk55NnkvL0RHSlFTQStxL0NhUFpPemplMHZXclJ1?=
 =?utf-8?B?RTBFNk9oVWJDRDNiOTExR0NUZG1oc1ZnV1Bsb3pPYXd0YjY1ajBCYWN3VERz?=
 =?utf-8?B?S2dndUFRVWpoZFc4SGs2NU5ZR2hKV0JueDIyL2hnRG5OVUFPc0EzanRIQzhH?=
 =?utf-8?B?Njk1VGNXUEFqaVRtTmVjaHZGYkZKRDdYZGVqT21CaGpFUGFvMExKM2N5M0Rp?=
 =?utf-8?B?ME9DNkJmSVE4bHdZdlFkQVVaOEdqZXB1d3hoZUNyazl2d1dJMnQ4QWVTUml4?=
 =?utf-8?B?VGtBeHNQVXYyUFlBcGxBMzFWTWVIS2Mrc1ZXU21yc1orTmxKU1pZUStpNVBE?=
 =?utf-8?B?ak1VRVMwZld4OHgxcGZHYmNnbitzSXU5WVhTTFBBS0dGK1VSVGUrbmp1bE11?=
 =?utf-8?B?OE53WlJ4V1BVdFdQaE5xOTZSZlBLa0lrZm9SUlpETVBjOEFvcXZ4a3ZVSFoy?=
 =?utf-8?B?RkJoZzRVK3BFckRDRk5jNUUwR2wyd05sZU9IVW1JbGQ4RjBtWWlIWGxtVklM?=
 =?utf-8?B?L3phanI5SGFKTzBDS3dlMndobHhZdzRzYzlzaytHRzhwSlpwWWUzNHdxUnp6?=
 =?utf-8?B?MzFVQ2pqWFJ0T3U4bkVsTUZ3QWk5TnVmVmljWWNkd2JGS3BOV2M4Z3ZUMVAy?=
 =?utf-8?B?U2tKeEFFdE1COFBsSUIxaGh6U2JuRHRzTzI5ZnRZZEFmRUliRXd2b1NuR3FR?=
 =?utf-8?B?ZmhLVjlFQ2tMY1BOaS9SdGJmejlQbEpGUGx5UGx4UGhkVlR4M2w1c2liMDY1?=
 =?utf-8?B?YkRsRFN6NHM2VWZGZFNRejEyeForVU9neW9qZ1hKYkFkRHpQZnJXRXNQYXlx?=
 =?utf-8?B?SmptOGJSbFg4b1dFOFNRZkt6TndWSWJocjhNa2RSczY4NFlsUVNUYVNaK1pO?=
 =?utf-8?B?VWdRYmlRWElBUXFwYXZXS2haRWJlT3NIYmQxN0FvWkN5QUZJVzlEM3JQaDhX?=
 =?utf-8?B?REh6c2pJbnF0OUZoUllkcE9obmVXN2ttem5RbmcwVyt5YzFzMEhsZlU4bkw0?=
 =?utf-8?B?Si9zMGFRWUxEeExad3JzUG40aVBFZ0NRTWxjSTZmM0wxamdEQzFCbFJSaUI1?=
 =?utf-8?B?RDMwdHlBRnJBSEFCbkh6RGU3ZHlDSXEwaG1wNTRjbEJycllPend0cG4xQ3l2?=
 =?utf-8?B?eTNSZGhQL0V0NVlEMmlvakptVVk1VDhFSHNTTnFHaDVRTUN0VEpsSk5hYmZZ?=
 =?utf-8?B?YmN5Ykh3SmRzN3V6eHUzU20xM0lyQ0V0eEE1bGJOc2xleE05ZE0vSVpLUDMz?=
 =?utf-8?B?Z0ROZHQxTUQ2eGZGaktSZTcyK3c3Z21NcmVHZzUxanNmaldvd0tOckRWNmtQ?=
 =?utf-8?B?dXdyQTRDZHZFVXYxRlBEbWdnQ2IvNCttcnZZOHdOMU5reHdtSjVPOXlNa1hW?=
 =?utf-8?B?bnZhQjY5V00wcXNucGZHVkRwcHNxT1gzNU05R0gwZWJCU2RTQzUxWFd2Z010?=
 =?utf-8?B?a0pIMUE2ZExhMS9WdGFxNUhtREs5dUthTHZaU2ZCc2VsMnlkdFV0azdHbTdk?=
 =?utf-8?B?OXY2Z3ZaM2JFN2x0b3BsOEt3WTF3clFJSmxKOEYwODFWVFJWbTJCTjdMYWEr?=
 =?utf-8?B?NlBDSFBIc0JTYkw2NTU2enc5N3IyVE9RWVJQREpOeGtmNi94M25nREloMlpB?=
 =?utf-8?B?Umw4RnhWaEdTQUFZSWJJcDZXY3U2ZEhScjRuQkVYYlFBMjZvRlc1ZE1xaGRF?=
 =?utf-8?B?TXg2WU9QYmZwTHJuYndTMGhnZGtnM2ozUTJRTG40SjNTN0dJU1lvOEtKclIx?=
 =?utf-8?B?czRza3pSOGFnZUlmemdHWXVnNjExcU1Nb2l0SnVxRXVDdVVyaklFcDZqbGlZ?=
 =?utf-8?B?ajV6ZGxBMU9nd2RIZkZwMTVnWmhkTmtRYmQ4cWpXQVhiV051Q24rK1JuWlNa?=
 =?utf-8?B?TFRzK3UxSldDeEg5cnEybnJqOVMyYVJDZ1JVb2ZlYVZEcVZSQjVTZlZpSFJj?=
 =?utf-8?Q?YcrM/9MocfjpQveJjtMYozngy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63126da1-6fb3-4181-a1d5-08de11114feb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 02:18:38.7796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYWvIVyJMRJNZEuDKV1lJA9I94YbdjbeceOHqJvTowMAVlxbdc+WF0DYRlXvyD/q6Z+F3nFfb82Yw0uDbffiBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6902
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

On 10/20/25 11:55 AM, Joel Fernandes wrote:
> Required for writing page tables directly to VRAM physical memory,
> before page tables and MMU are setup.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/mm/mod.rs    |   3 +
>  drivers/gpu/nova-core/mm/pramin.rs | 241 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  drivers/gpu/nova-core/regs.rs      |  29 +++-
>  4 files changed, 273 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/nova-core/mm/mod.rs
>  create mode 100644 drivers/gpu/nova-core/mm/pramin.rs

Hi Joel,

Lots of feedback here, I'm familiar with this part of the RM and GPU,
and have studied your patch here for a while.

First of all, I'd like very much for this patch to be at the beginning
of a new patchset, that includes calling code that actually uses this
pramin functionality. That's a good practice in general, which I want
to sort of reestablish here in nova, but also in this particular case
it is especially helpful in avoiding a lot of code that we don't need,
and won't need.

OK here we go.

> 
> diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
> new file mode 100644
> index 000000000000..54c7cd9416a9
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mm/mod.rs
> @@ -0,0 +1,3 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +pub(crate) mod pramin;
> diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
> new file mode 100644
> index 000000000000..4f4e1b8c0b9b
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mm/pramin.rs
> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Direct VRAM access through PRAMIN window before page tables are set up.

Let's omit "before page tables are set up", because that's an assumption
about the caller. In fact, this can be used at any time. (As an aside,
various diag tools use this HW feature to peek/poke at vidmem, as you
might expect.)

> +//! PRAMIN can also write to system memory, however for simplicty we only
> +//! support VRAM access.

Actually, I'd like to say something a bit different:

For Hopper/Blackwell and later GPUs, PRAMIN can only access VRAM.
For earlier GPUs, sysmem was technically supported, but in practice
never used in production drivers.

This is why Nova only provides VRAM access: Nova supports only a few
of those older GPU generations (Turing, Ampere, and Ada), and there is
no use case even for those few GPUs, for attempting sysmem access
via PRAMIN.


> +//!
> +//! # Examples
> +//!
> +//! ## Writing u32 data to VRAM
> +//!
> +//! ```no_run
> +//! use crate::driver::Bar0;
> +//! use crate::mm::pramin::PraminVram;
> +//!
> +//! fn write_data_to_vram(bar: &Bar0) -> Result {
> +//!     let pramin = PraminVram::new(bar);
> +//!     // Write 4 32-bit words to VRAM at offset 0x10000
> +//!     let data: [u32; 4] = [0xDEADBEEF, 0xCAFEBABE, 0x12345678, 0x87654321];
> +//!     pramin.write::<u32>(0x10000, &data)?;
> +//!     Ok(())
> +//! }
> +//! ```
> +//!
> +//! ## Reading bytes from VRAM
> +//!
> +//! ```no_run
> +//! use crate::driver::Bar0;
> +//! use crate::mm::pramin::PraminVram;
> +//!
> +//! fn read_data_from_vram(bar: &Bar0, buffer: &mut KVec<u8>) -> Result {
> +//!     let pramin = PraminVram::new(bar);
> +//!     // Read a u8 from VRAM starting at offset 0x20000
> +//!     pramin.read::<u8>(0x20000, buffer)?;
> +//!     Ok(())
> +//! }
> +//! ```
> +
> +#![expect(dead_code)]
> +
> +use crate::driver::Bar0;
> +use crate::regs;
> +use core::mem;
> +use kernel::prelude::*;
> +
> +/// PRAMIN is a window into the VRAM (not a hardware block) that is used to access
> +/// the VRAM directly. These addresses are consistent across all GPUs.
> +const PRAMIN_BASE: usize = 0x700000; // PRAMIN is always at BAR0 + 0x700000
> +const PRAMIN_SIZE: usize = 0x100000; // 1MB aperture - max access per window position
> +
> +/// Trait for types that can be read/written through PRAMIN.
> +pub(crate) trait PraminNum: Copy + Default + Sized {
> +    fn read_from_bar(bar: &Bar0, offset: usize) -> Result<Self>;
> +
> +    fn write_to_bar(self, bar: &Bar0, offset: usize) -> Result;
> +
> +    fn size_bytes() -> usize {
> +        mem::size_of::<Self>()
> +    }
> +
> +    fn alignment() -> usize {
> +        Self::size_bytes()
> +    }
> +}
> +
> +/// Macro to implement PraminNum trait for unsigned integer types.
> +macro_rules! impl_pramin_unsigned_num {
> +    ($bits:literal) => {
> +        ::kernel::macros::paste! {
> +            impl PraminNum for [<u $bits>] {
> +                fn read_from_bar(bar: &Bar0, offset: usize) -> Result<Self> {
> +                    bar.[<try_read $bits>](offset)
> +                }
> +
> +                fn write_to_bar(self, bar: &Bar0, offset: usize) -> Result {
> +                    bar.[<try_write $bits>](self, offset)
> +                }
> +            }
> +        }
> +    };
> +}
> +
> +impl_pramin_unsigned_num!(8);
> +impl_pramin_unsigned_num!(16);
> +impl_pramin_unsigned_num!(32);
> +impl_pramin_unsigned_num!(64);
> +
> +/// Direct VRAM access through PRAMIN window before page tables are set up.
> +pub(crate) struct PraminVram<'a> {
> +    bar: &'a Bar0,
> +    saved_window_addr: usize,
> +}
> +
> +impl<'a> PraminVram<'a> {
> +    /// Create a new PRAMIN VRAM accessor, saving current window state,
> +    /// the state is restored when the accessor is dropped.
> +    ///
> +    /// The BAR0 window base must be 64KB aligned but provides 1MB of VRAM access.
> +    /// Window is repositioned automatically when accessing data beyond 1MB boundaries.
> +    pub(crate) fn new(bar: &'a Bar0) -> Self {
> +        let saved_window_addr = Self::get_window_addr(bar);
> +        Self {
> +            bar,
> +            saved_window_addr,
> +        }
> +    }
> +
> +    /// Set BAR0 window to point to specific FB region.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `fb_offset` - VRAM byte offset where the window should be positioned.
> +    ///                 Must be 64KB aligned (lower 16 bits zero).
> +    fn set_window_addr(&self, fb_offset: usize) -> Result {
> +        // FB offset must be 64KB aligned (hardware requirement for window_base field)
> +        // Once positioned, the window provides access to 1MB of VRAM through PRAMIN aperture
> +        if fb_offset & 0xFFFF != 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let window_reg = regs::NV_PBUS_BAR0_WINDOW::default().set_window_addr(fb_offset);
> +        window_reg.write(self.bar);
> +
> +        // Read back to ensure it took effect
> +        let readback = regs::NV_PBUS_BAR0_WINDOW::read(self.bar);
> +        if readback.window_base() != window_reg.window_base() {
> +            return Err(EIO);
> +        }

Let's not "read it back to ensure it took effect". This is not required
by the hardware.

> +
> +        Ok(())
> +    }
> +
> +    /// Get current BAR0 window offset.
> +    ///
> +    /// # Returns
> +    ///
> +    /// The byte offset in VRAM where the PRAMIN window is currently positioned.
> +    /// This offset is always 64KB aligned.
> +    fn get_window_addr(bar: &Bar0) -> usize {
> +        let window_reg = regs::NV_PBUS_BAR0_WINDOW::read(bar);
> +        window_reg.get_window_addr()
> +    }
> +
> +    /// Common logic for accessing VRAM data through PRAMIN with windowing.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `fb_offset` - Starting byte offset in VRAM (framebuffer) where access begins.
> +    ///                 Must be aligned to `T::alignment()`.
> +    /// * `num_items` - Number of items of type `T` to process.
> +    /// * `operation` - Closure called for each item to perform the actual read/write.
> +    ///                 Takes two parameters:
> +    ///                 - `data_idx`: Index of the item in the data array (0..num_items)
> +    ///                 - `pramin_offset`: BAR0 offset in the PRAMIN aperture to access
> +    ///
> +    /// The function automatically handles PRAMIN window repositioning when accessing
> +    /// data that spans multiple 1MB windows.
> +    fn access_vram<T: PraminNum, F>(
> +        &self,
> +        fb_offset: usize,
> +        num_items: usize,
> +        mut operation: F,
> +    ) -> Result

This is far too much functionality, and the code can be made much smaller
and simpler, and still get what we need. Open RM only supplies small accessors
(8 thru 64 bits wide), and no "bulk access". The calling code can loop if 
necessary.

We should do likewise, and avoid this.

Then we can just create things such as write_u32() or write<u32>(), etc.

And do we even *need* read?? I'm not sure we do.

This is hopefully showing the value of including the calling code, as
a follow-on patch in the series.

Hope this helps!

thanks,
-- 
John Hubbard


> +    where
> +        F: FnMut(usize, usize) -> Result,
> +    {
> +        // FB offset must be aligned to the size of T
> +        if fb_offset & (T::alignment() - 1) != 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let mut offset_bytes = fb_offset;
> +        let mut remaining_items = num_items;
> +        let mut data_index = 0;
> +
> +        while remaining_items > 0 {
> +            // Align the window to 64KB boundary
> +            let target_window = offset_bytes & !0xFFFF;
> +            let window_offset = offset_bytes - target_window;
> +
> +            // Set window if needed
> +            if target_window != Self::get_window_addr(self.bar) {
> +                self.set_window_addr(target_window)?;
> +            }
> +
> +            // Calculate how many items we can access from this window position
> +            // We can access up to 1MB total, minus the offset within the window
> +            let remaining_in_window = PRAMIN_SIZE - window_offset;
> +            let max_items_in_window = remaining_in_window / T::size_bytes();
> +            let items_to_write = core::cmp::min(remaining_items, max_items_in_window);
> +
> +            // Process data through PRAMIN
> +            for i in 0..items_to_write {
> +                // Calculate the byte offset in the PRAMIN window to write to.
> +                let pramin_offset_bytes = PRAMIN_BASE + window_offset + (i * T::size_bytes());
> +                operation(data_index + i, pramin_offset_bytes)?;
> +            }
> +
> +            // Move to next chunk.
> +            data_index += items_to_write;
> +            offset_bytes += items_to_write * T::size_bytes();
> +            remaining_items -= items_to_write;
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Generic write for data to VRAM through PRAMIN.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `fb_offset` - Starting byte offset in VRAM where data will be written.
> +    ///                 Must be aligned to `T::alignment()`.
> +    /// * `data` - Slice of items to write to VRAM. All items will be written sequentially
> +    ///            starting at `fb_offset`.
> +    pub(crate) fn write<T: PraminNum>(&self, fb_offset: usize, data: &[T]) -> Result {
> +        self.access_vram::<T, _>(fb_offset, data.len(), |data_idx, pramin_offset| {
> +            data[data_idx].write_to_bar(self.bar, pramin_offset)
> +        })
> +    }
> +
> +    /// Generic read data from VRAM through PRAMIN.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `fb_offset` - Starting byte offset in VRAM where data will be read from.
> +    ///                 Must be aligned to `T::alignment()`.
> +    /// * `data` - Mutable slice that will be filled with data read from VRAM.
> +    ///            The number of items read equals `data.len()`.
> +    pub(crate) fn read<T: PraminNum>(&self, fb_offset: usize, data: &mut [T]) -> Result {
> +        self.access_vram::<T, _>(fb_offset, data.len(), |data_idx, pramin_offset| {
> +            data[data_idx] = T::read_from_bar(self.bar, pramin_offset)?;
> +            Ok(())
> +        })
> +    }
> +}
> +
> +impl<'a> Drop for PraminVram<'a> {
> +    fn drop(&mut self) {
> +        let _ = self.set_window_addr(self.saved_window_addr); // Restore original window.
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index 112277c7921e..6bd9fc3372d6 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -13,6 +13,7 @@
>  mod gfw;
>  mod gpu;
>  mod gsp;
> +mod mm;
>  mod regs;
>  mod util;
>  mod vbios;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index a3836a01996b..ba09da7e1541 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -12,6 +12,7 @@
>      FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
>  };
>  use crate::gpu::{Architecture, Chipset};
> +use kernel::bits::genmask_u32;
>  use kernel::prelude::*;
>  
>  // PMC
> @@ -43,7 +44,8 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
>      }
>  }
>  
> -// PBUS
> +// PBUS - PBUS is a bus control unit, that helps the GPU communicate with the PCI bus.
> +// Handles the BAR windows, decoding of MMIO read/writes on the BARs, etc.
>  
>  register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
>  
> @@ -52,6 +54,31 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
>      31:16   frts_err_code as u16;
>  });
>  
> +// BAR0 window control register to configure the BAR0 window for PRAMIN access
> +// (direct physical VRAM access).
> +register!(NV_PBUS_BAR0_WINDOW @ 0x00001700, "BAR0 window control register" {
> +    25:24   target as u8, "Target (0=VID_MEM, 1=SYS_MEM_COHERENT, 2=SYS_MEM_NONCOHERENT)";
> +    23:0    window_base as u32, "Window base address (bits 39:16 of FB addr)";
> +});
> +
> +impl NV_PBUS_BAR0_WINDOW {
> +    /// Returns the 64-bit aligned VRAM address of the window.
> +    pub(crate) fn get_window_addr(self) -> usize {
> +        (self.window_base() as usize) << 16
> +    }
> +
> +    /// Sets the window address from a framebuffer offset.
> +    /// The fb_offset must be 64KB aligned (lower bits discared).
> +    pub(crate) fn set_window_addr(self, fb_offset: usize) -> Self {
> +        // Calculate window base (bits 39:16 of FB address)
> +        // The total FB address is 40 bits, mask anything above. Since we are
> +        // right shifting the offset by 16 bits, the mask is only 24 bits.
> +        let mask = genmask_u32(0..=23) as usize;
> +        let window_base = ((fb_offset >> 16) & mask) as u32;
> +        self.set_window_base(window_base)
> +    }
> +}
> +
>  // PFB
>  
>  // The following two registers together hold the physical system memory address that is used by the


