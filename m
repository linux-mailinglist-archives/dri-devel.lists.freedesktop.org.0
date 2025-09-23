Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B27B96132
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 15:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7447910E61A;
	Tue, 23 Sep 2025 13:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x8THb0wJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988F810E619;
 Tue, 23 Sep 2025 13:49:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuiePmAXCcbtwIbYACFzDC7KU1c+YvMgb11wAGG3gotchKJnJhAJC7ts3vwU6iwKzMNwEoEfWZNsHhbKljPkWpFwKs6hzouVbpoTd5+LXz8T8y25NY0iCyP/i9apubO8IcEkW8c5xRtzONvuYkpNJRW7bDky0/r/QIUUE6Pux9TMFSLZSjged1NVlNdI7t/4neDj/CsAM1eDqvoY1sBETO2pbUvLHkgkCYDxW/3CGjucJNwezeTl+Tk0jfLwuGy3Yn5V2IVPNq3Zf/K7Y9v2JUWFEvV5xdpdpvIVy9Moa36Jzf3weaDvAnNgz+FfHC3ZIuvrfjNN7Q3/gMulBZT9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5Ksz/Wope+xJLL8IQ02d2WAzPRJKIL6BLmy5AxzhxU=;
 b=QxvwPNN2WJ6xLTrGX/+x8rR3e5uwPgX6W8gs03QbN6sV4wD8OVz16uxiuNAUCTgkO3dvn1PbNwLRkETVgTUjAeXmIRQ276jSjdMzN5/cOmXtdrSSQZp0MO1iU9gDO0GoLjVjCB0DVndEZNq7xALWTqqNPO34FYQdAem4kD7HWmj/qS8tH+VT566SNICG3kLWnS4Bm0vPzF4TUdER1el5NO6E2G24PUCAG3GsR5m6vMl4DiMoCYSbjdlmCg7FxaX/tGcyyk0K7kyFiXsFB7xdOdK9jabmwbo6JFap6dUepfS82mI5AfIQ6yEvKw4dR06aNzxnpizGf+ppgJpFXADA0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5Ksz/Wope+xJLL8IQ02d2WAzPRJKIL6BLmy5AxzhxU=;
 b=x8THb0wJNBte0QFFvXpcR5mvfntLwtm5H9CJRjpAS6oEgRxFiN3QcRzgeq9YVToJlpntvIzRiwbGLNzSgAZ+Wu0TOxAPdlHAqQ9wU9sidl+21KOUJDK5nBF2rz9l4Lqf+Z2/FN/67NLamNYlvOV0ski6R2N1K4EUYLSzlc2OV/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN3PR12MB9593.namprd12.prod.outlook.com (2603:10b6:408:2cb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 13:49:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 13:49:04 +0000
Message-ID: <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
Date: Tue, 23 Sep 2025 15:48:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <20250923121528.GH1391379@nvidia.com>
 <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
 <20250923131247.GK1391379@nvidia.com>
 <8da25244-be1e-4d88-86bc-5a6f377bdbc1@amd.com>
 <20250923133839.GL1391379@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250923133839.GL1391379@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0473.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN3PR12MB9593:EE_
X-MS-Office365-Filtering-Correlation-Id: 904fee8b-b0f1-437c-02a2-08ddfaa7f563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTd4S09EcTFOVVh6TVlOR0M2QlRQZTlvTVJpZXFZRUdBQVUzZFFlR0NjK2Nt?=
 =?utf-8?B?SldIOFlQSFF2aW4wbkdYMzBQVERCeXRKb1dJYTNqTDJjK0NOdStoREFPUWF2?=
 =?utf-8?B?R3poMWl6SHhKOTI0QTAyNXdDcDFnQzBraEtJMnkzeHFva2xySCthZis4UmdQ?=
 =?utf-8?B?c3h1ejVzeDBHU2JwQUIydVhsWVhhbERzc3lpS3ZFanc1bkIyZzZGTmZQbnhi?=
 =?utf-8?B?NFdUNHZ2eFIvQVdHQUVQZmNRcDFkOUxDN0wzQktwZ3c4ZzlKdFV0WWNQTzFu?=
 =?utf-8?B?eit6dHhqNCtvY3BWL0FVbEtyOUhzZE1HNnJUZmhRNThkKzJKTjJkVk9QdGZR?=
 =?utf-8?B?Rlp0ZUFjeFo4cE50UmdLQTNhdVhpMDErcmsvYi9oU0RQUjNCVjVPM29qMFR3?=
 =?utf-8?B?Q1pmSDFUcFk4eEx3K0JneTZZWXdmeUJmNW5NUHBTcTFTK2FlY0ZTVkpIUEll?=
 =?utf-8?B?R2VkUUJsWTEyMjJQZVJlWjBkejBmVTFuL2pITW1PdG1vVDUrMFdEMEFsQWoz?=
 =?utf-8?B?cjJPYkJ0TTkzRG5wKzk1aitleFA1UTZsQmV5aGdTdzl0aTQzOXpKQjRnKzRB?=
 =?utf-8?B?N2poVkJZOG9oVHB0b1BNRkptNHFnNXByVnZMSXVMMmRUS3lxcTExWXJuVXBU?=
 =?utf-8?B?T2hlNG1xNUZ6Q2FxT2t2c3NKQUx3UzBCMnltYUlXZEtaTTlxN1hSZG9XbHJX?=
 =?utf-8?B?VUd1Q0JrSlFReDVNdnB1K2cybTZCalBqS29pbFc0bTJINURXdVZlYnBBVCtU?=
 =?utf-8?B?UWpidWY2R0ZrNERSTGJyenlGZ3R1OUhJNjVJajZPVGg0NWpTNmpYYndPdDV3?=
 =?utf-8?B?Vm1IVnVVcGQzRGp2aElQeitNYm5mWDlDMXk4SloxQXlZa0h4cGtLbHE5ejJu?=
 =?utf-8?B?VldBZTRyZ0poNWlwR1dKU1RQOHBsTU5QNXZyUE1PSzQxQjZwUEljMnY4VGk0?=
 =?utf-8?B?QzBEeElVTC9xT20wb3lzNmQzMm1hSHVLK2M3QU5oVVVQdW04L25jUjdPRGc0?=
 =?utf-8?B?MitqckVVVVBHY3J2dzVZZzE3eUI4QWUxMFRqSmlDOFhzWFVRMzlPMlcvcmh2?=
 =?utf-8?B?SWdVeml3VUM1c2RlSnh2dHlmMW1ydjVxci94ajBPU1dNS0tYMzB4cjU0djEw?=
 =?utf-8?B?ampyQ1hTMElQRlA2RVo3Z0NzWVB0R2JQT0xUcVJweDlvZmVVWWNua25mMG1W?=
 =?utf-8?B?VE00clZISGVWN0g0dnpjSGtQcmlZeE4ycFF6WXdNQ2RCMEZwcXNxRUcyQXdW?=
 =?utf-8?B?VWhFSmhIeGlQcFJHaEFUVFUyUnJVLzFidUNtSUo3L2NydU9jYWYydUVDc05n?=
 =?utf-8?B?OWFYSFhwSkRheFZWQ0ZkbG1Fc1ZENUViVWVqUGhFNWgxRUV2SHkxSXlwYUVk?=
 =?utf-8?B?MzVadERFaEIrWDJwWmQveXFELzBLU2dCYSt1VU9HbUJvYXdwZkpwWERvSGdL?=
 =?utf-8?B?RDY0WkVmU1ZYL2UyTGhDUXBoRHBvUjlNM2hJQmZ0UXJ2VGFYdmJPQ3FleXVL?=
 =?utf-8?B?ZC95c0pXb1FHVDJaZ2hCbmE1elRRa1BaL1d1ZFhZSldVNVFPTkUzcnFEbHky?=
 =?utf-8?B?WGtYb3QwYnpWQ0FlR0F1a3NPT2dKQXpPMHVpdkhVYVpXcEpVRkpEbndNS0lE?=
 =?utf-8?B?bDkyWWFZc2NlbUJjRlFOV3pUSUUrVFd6ejU3dWthN1R4aUQrU21uZXhjalpl?=
 =?utf-8?B?Z1dWd1djRi8xNHlCOTBoSDhLQXpmQ0VrakJyRTlTV1NxeFNkVVN3WlVBdjZa?=
 =?utf-8?B?bDFvenloaGtEVDN2aUJaUU9ZaXZnL2EvN05QZFpZVWpFbDQvcGtBQXJxYlVy?=
 =?utf-8?B?VFkrbXo3cnkxaGZ1ZjR1MFNJRysvQWRCMzJvL0ROMXVwNkE4LzRYTng3dVZp?=
 =?utf-8?B?UUU5dlErSEtyOHNaTjIvNy9jY3dVZG9FQUQyeUpWMUZEckpDSDhQUUoyLzE5?=
 =?utf-8?Q?DUpsgCDHNG0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGlsblZ3UUFENnd5OVhMNlE2c3R0MTh4VjRJbkx3R2tUSWVuT0E0WU5heDdL?=
 =?utf-8?B?U1ErMFRsUzBPVVZ6OWpDL0cyV1NaM2x1eTlYMXRuT3RPODZGMFR5UWZUS2RU?=
 =?utf-8?B?WWJlYUZ5bTJrNTJBVjVVOWtlL3JVYUFhUms4SFVMNGtGdTdIbE5KanBEdTl4?=
 =?utf-8?B?MVF4Rjh1dnhHV0lSeUsyZW9ocW85LzlWWWE5ZmE0MVk3RWJFaXNJSnFGNXhY?=
 =?utf-8?B?T2pYQlBaTW5FWDlyVjNBM21BY0lxa1dxM1VkaWtwbUZzNHk4c0RNbzZ0S2hk?=
 =?utf-8?B?NmFDSUFTNnBLZWREdjNwZjl5ZnNZOTl5RThSMGQ1U1ZkbzhUTDJhWm1leWZB?=
 =?utf-8?B?aUN1cXZLemFXY0ZlQUFuVHg2aFF1UlFRMnJrSmNHSGZwVGM4a09kdGtCVnhK?=
 =?utf-8?B?dXFreHQ4dlQ2d2VkNDVLWFZ3SmpJUDhCYWFPMnBOT0pxRXB4K0xrVDdPdVZL?=
 =?utf-8?B?Qzh1VzZpdWp1SUlwdE1XamJTLzBYSnpDeEdOTDh0Ylo3azdKSnpXWWxPQTZl?=
 =?utf-8?B?dUxaU1FiRTJtRjVlaWxUVDBMTTZsT3VwQllnOTdSTDc0MkE5R1NmQjhSSVZH?=
 =?utf-8?B?UkkrZTBqZU14UHNyck5XZlI3LzdzK1hLb0wwWnFvSXFLcXd0cXBtdlZrNHh5?=
 =?utf-8?B?L25Jcks2TTl6c3BWZmVvRGRXWnRpT0JJcTlMTG96YzVQZ0I3QXhlazBzN091?=
 =?utf-8?B?bTg1L2ExUHNROFJrVmRZTVBDMmVSd082L1ZGa3R5RTZET3JBdXFDd1VQNUVr?=
 =?utf-8?B?SmZlNmJWU3daYlI3VVZ4VXdNQlRYeWVCNVBkenYvWGFhVEV4VjVSMnJkMzhV?=
 =?utf-8?B?TXpOenZRZUg1Q1dwRENtVi9UYW1iWHA5OEZpbVlJWXlBTHhvWXU3b3p3TTBH?=
 =?utf-8?B?dS9hbVRlOWhtdmh2TVhCd3BCbVNIU3ROUWFwWkc2YTNKbENTeXpOS29pTUJ1?=
 =?utf-8?B?bFlPNm1XZ2JBY0dhMHl2VExTMW1VUjBvaWVIZFRRM2JrdEl0SDlTMk82enZV?=
 =?utf-8?B?QmNlZGovSEZNcU5HV0RnWC9adElkZnRxVmQyOUczdkVOVmw2Vk5MQW01QUpG?=
 =?utf-8?B?Tk5QNDIyZlFSNHhIcmp2R2MvUjQ5MWFnQ0taSmRWeWM5VkxJeGp0bXJGekIx?=
 =?utf-8?B?aTRTQ3hVYkw2RzhhTEhWVzFTQkZZWE5pbzZQSkw2bTF6bjNJUTQydVpMaVQx?=
 =?utf-8?B?Z2J0YnhEaDAraFR6amEyQnAweW04SGRjMGY4V0xaY1lMZEw2UUNFcncwbkxP?=
 =?utf-8?B?UTJXa2hEWmwxbFNOS1M5Yi84QzRER0N0dEJ4MFd0QkIwU1A3cG5CNWR4NFZx?=
 =?utf-8?B?Y0sxd3BLQzVLMTB5anY0UHhQekNWQWUyRXNpM1pvSENLeDBKMUJ2RlhDVkxK?=
 =?utf-8?B?dlZKeEptQVpiNUJ3YUsvUEZyUFRFZG5JVHZRSDJUMUQrK2p6QndYTHVtQzNI?=
 =?utf-8?B?KzU1SFVteGZSMUY2Mk1OMWF6dHBzSlFsNXNDNWNSTEZSWmtXcnNYQ1M1eXBR?=
 =?utf-8?B?NXhDbm95emJVbzhFSlBsclVTMUUrS1RMSnVvZ0N6cm1Zck5sUVRCcllKTUFG?=
 =?utf-8?B?QldycTN6dnN6M1FFcDY4bEtIS1hkRTVGOS9JRVEyNVdmVFN0NFV6bmhZaXpi?=
 =?utf-8?B?UWFoSjNFeE1CTnhzM2xtaU5pVlRhcExIQXJkU09nelE2cDZabVBPOWJRaURK?=
 =?utf-8?B?NVNwazJqbjZuSjJPOVlYWnJvZExpTXVWSys5cmNIU1hSZmk1RmtrUGZSRVpr?=
 =?utf-8?B?dFVvbjdqZEFxd0cvU3FWNzR4SllEMHNOT202b01hcnc5dndOYWJsOEU3Mldu?=
 =?utf-8?B?VnRpcEtvODVoT2JPQjVwU01iTW14VnhBbzZXVVRQaDRqUWZxZjhjOEo1bjY3?=
 =?utf-8?B?MU1qd2NxTllPTjUwVFU0QVhUczRmRnJpc2thNzhRczFMbmIyREhjUEtCcmJS?=
 =?utf-8?B?RERTUVl2Rk0yK2pJS0ovWXBneGdnTTE5eXhUWWwvdHZIYm9SWVFyeVFHREdC?=
 =?utf-8?B?NWNqMmtnbmFLRnlMdlB2aTJUWDZzdC9vNXROR2ZndDVMZHBMaHJZeEUwczhh?=
 =?utf-8?B?U2pCcExQUFlzTHU3M1ZDeVFBbmh5SzM2T3k3d29BNjFDT2wydnUyWnlaRjZZ?=
 =?utf-8?Q?YIj4pENpH39FedPLE6GDgDZhP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904fee8b-b0f1-437c-02a2-08ddfaa7f563
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 13:49:04.1572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTqvOUs5WVvRyK6YqAvpiy934bk7hZCRtU7NifWKXhsHfnuJQ/kcCrozjOqtVqKo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9593
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

On 23.09.25 15:38, Jason Gunthorpe wrote:
> On Tue, Sep 23, 2025 at 03:28:53PM +0200, Christian König wrote:
>> On 23.09.25 15:12, Jason Gunthorpe wrote:
>>>> When you want to communicate addresses in a device specific address
>>>> space you need a device specific type for that and not abuse
>>>> phys_addr_t.
>>>
>>> I'm not talking about abusing phys_addr_t, I'm talking about putting a
>>> legitimate CPU address in there.
>>>
>>> You can argue it is hack in Xe to reverse engineer the VRAM offset
>>> from a CPU physical, and I would be sympathetic, but it does allow
>>> VFIO to be general not specialized to Xe.
>>
>> No, exactly that doesn't work for all use cases. That's why I'm
>> pushing back so hard on using phys_addr_t or CPU addresses.
>>
>> See the CPU address is only valid temporary because the VF BAR is
>> only a window into the device memory.
> 
> I know, generally yes.
> 
> But there should be no way that a VFIO VF driver in the hypervisor
> knows what is currently mapped to the VF's BAR. The only way I can
> make sense of what Xe is doing here is if the VF BAR is a static
> aperture of the VRAM..
> 
> Would be nice to know the details.

Yeah, that's why i asked how VFIO gets the information which parts of the it's BAR should be part of the DMA-buf?

That would be really interesting to know.

Regards,
Christian.

>  
>> What Simona agreed on is exactly what I proposed as well, that you
>> get a private interface for exactly that use case.
> 
> A "private" interface to exchange phys_addr_t between at least
> VFIO/KVM/iommufd - sure no complaint with that.
> 
> Jason

