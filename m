Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAED4B573D5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 11:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F69710E2C6;
	Mon, 15 Sep 2025 09:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uEQ6TamH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AA910E2C6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 09:00:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShdNR1SXOCo/4JMbFF/NLRV+Ghf9WqFl624VHFeskwepl4j6j7OAURuv67EPlCk59my6jXrmvomJu/uYH0+gKO/2/4XwgLy1CQEHKlesQTBm/SbhBP9o6Sp+C1MUrtFtcy0GKDFEdN19brCcC47d98tTFN4D+tGbWBL6dxH/3ZXtb71APL7V8IjiDBVyYUq/pitKuMUA7DfFqDEUzRCqsdCvZGZ7CYEqvFdAzgPiPVKnDVg3r53FuQ3Jd3DfLWLm/vj+r4C1greVO+M+TxWyUuvfCwzaC4PRDCnD7TDiXwB07aIuxINAEUjAzYzuQDJID14+hHvg2vtts1ydtfb1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=souMwHADAtKetOnAbK5zZwXeNNUDSIaHDZ1iwOhAcb8=;
 b=qgAw+/LbRbaQIEuGDcdtGWYCWrtec7WefuPoJjMznpI2yUGCCEk66uylSz2CSb8e2WDldqrltj1O0AqggIRReR3dC1lHd+TdRa6UP32vKpzRDgtp9bwdvBsXoPYmqa0LGmtoMC2ktCewipvZs+fQ8Dsr1dZGDS4VUpaWhdaMwpqkp7ZWt/XaK2JQSCvq88IH2QSHGMHrZfovyzJyUGU0+3dvCetxjc7gYQp41OAsYzOq2LjwByRWSuXc9GfH3Rmuwsdiip00jsE8x3wTGySaiWPt9mU6VRwZkaOWcceloDqeC34vVntTxpv4CBYGMjrdgS+BqOszjuE2nVOLShgE2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=souMwHADAtKetOnAbK5zZwXeNNUDSIaHDZ1iwOhAcb8=;
 b=uEQ6TamHkea5xNgHEnsE0VF9uwGs+T7yABUU4Foam1rO2/ahWEgTUvd/MQE56pv2Z1hXPTUdWEo/2WRWHoA5tJpczrrpQPUa+uIB+HBUTsjr28fmlN33M7kH1V82pOOoRpHe1dSOE4+qvNmKPWWq56MX22xHP5m6cdRrs1AelfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 08:59:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 08:59:58 +0000
Message-ID: <e47bb7e1-5ec7-4142-89a6-2f7813fa40c1@amd.com>
Date: Mon, 15 Sep 2025 10:59:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rust: Add dma_buf stub bindings
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20250911230147.650077-1-lyude@redhat.com>
 <20250911230147.650077-4-lyude@redhat.com>
 <14af50d2-f759-4d89-ab9e-0afc7f9cb280@amd.com>
 <c00130930901db1ca4ea2d0302350ef024b23f50.camel@redhat.com>
 <e1929999f89cd8d90c4454075df4ebe3bdfab36a.camel@redhat.com>
 <534238a347c24f99cfebfd2af1d79bf24e25ed27.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <534238a347c24f99cfebfd2af1d79bf24e25ed27.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0417.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: ed953019-77fa-48d3-351c-08ddf4363f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K09kbmZDSUt2TzI5WEpqTTFlbW1pQXFMWnpXZjJKWjRIZ0JPMWVXYjUraVZO?=
 =?utf-8?B?ZWZ0MFlvNi85Y010SVpTTEZvZ1hmeFVuaGdWcUdSaUlQQ1NGK2VxQWw4ZFdV?=
 =?utf-8?B?anBIOWxZVEhCMXFsdGJQR2JVdDFNQnJLaUpwTEhqN05WSUNLVE5WdkdqQTlM?=
 =?utf-8?B?a0hZVGlZMnJqR0I0eVZpVXgvMEVGNC9QRzV3QStGd1NKZGZwQ3FBc1gzdVZ2?=
 =?utf-8?B?bWJZYkRVM1c4RVNGL0xIRFNDeW93RnhGV042c1hTaWMzMll4OVh5bTZOblVW?=
 =?utf-8?B?QUVseFlzMzdsUUE4eEprRmNORnRMbHAwa3laVVU0ZGl0cWdTTHJKMC9ESHlp?=
 =?utf-8?B?T2lhU242b2hSYzh5Sm5SMUxwbDVjcWs4WC9OdVlPVm8zekwzYnk0aUUrUXVB?=
 =?utf-8?B?TXU0M3VaUEl3N3pZTEcxR2dSSUJqVmhPT2FxK3cvdGtPR2I5QTRZcEVPdWFu?=
 =?utf-8?B?S1RMNG5TWXFVU2hWTmY5bjdIRmRycDM2L3NaNENkZ0p5U3phVnNRNU1OZmVw?=
 =?utf-8?B?SFJBdnRFYkJJcExRSkRVV1k0VDV2cGl1T3VYNVdCNTJ3dUV0WkVYR0ZPQ1Bj?=
 =?utf-8?B?WjJMaHdZbWxtMi9VRThoSGVkMEZLR3V4SXozblpYV094UHM1MGlua3NyeGlT?=
 =?utf-8?B?QU90Wk41K1ZSTHhtOGJFYWtOV2J1eWYyMjRWd2pVUldYakdYdlo3a1lGVjZX?=
 =?utf-8?B?eVlCdlRxTzdIZzdqQVE4NjVYUXU1NWZaUytBUHdRTHJydUdiOGtYTlArS2ZN?=
 =?utf-8?B?d3ZYQ0RkWlpOUzB5UXBncVR2WndybmJqY1hTQ0RqV2xVRFlQbGx1YzRoNGVD?=
 =?utf-8?B?dEtsL0EzVE43S2ZUR1UvY0JUSUxwMTB0dVJrdzFvY2FRZ3Y2SmRFOG9JY3Ft?=
 =?utf-8?B?MStIcjR6d2U3UmpQMSs4SjlMSmVWNlhYc2JRT091MVVsY3l3Tk9HWjJXSW9O?=
 =?utf-8?B?M21nZWR1N1Y0anJBUXRFNXh6eXFCUmtGYTc0VDFHQ2RSdDNRdHF0bGM5YjhU?=
 =?utf-8?B?djFFdndBREZaL2tFZVErZ2UvTTVGaEJJSDJxL0hMRUhKRWUxd1hVelhIY1dZ?=
 =?utf-8?B?SVR1SHVPaEZYUngwR0hUZzRmWWJyWGZnM05GaklENUVVWno1Qk5PanE0d0JV?=
 =?utf-8?B?V3hueFFDcjYwcitJcFpmUXZMcGd6TkxXeGtBOWkrbnhPUU9wMXN4a01DMlJ6?=
 =?utf-8?B?dUNOR1hpYjU1ZzJaY2EyZE83Vjh3YUZaS2FPdFFKYU5JSGJFbWdYMnZqWTlh?=
 =?utf-8?B?c3pVSnlVUkJxNWxrRVB2L0JCekdvTVBiM1QyUEhLaUEzYVZIODRtcEgrd3NQ?=
 =?utf-8?B?YWR6S2poT3JIMnNPa1NaV2MrYTk0bWxQZExPSlZPU3lrQVZoc2diQzJSMkdm?=
 =?utf-8?B?cVM0Z0lpa2MzUXlBZThyN3d5SVp0c2FhYTlVYlpJeE9MNlZoMmN6U3IxdmtN?=
 =?utf-8?B?WG51WDg3LzkvRjJlV0ZLWEpMYmEvYnRtNVQ0T1ZKVVh3Z0RwbFovTmJ0eVd2?=
 =?utf-8?B?dmk4Y1UwOTM4bi9Zdkw4NGRNa1ExbVFBSFpqYmxkQ2YzYk1nei9nV3BmWTI1?=
 =?utf-8?B?MERoRnV2UE1pZ1kxbkxGNTd1Q3JqZDVtdjlOKzJqbC84akowM2pBcG1NWXNi?=
 =?utf-8?B?STg1SlFiWTNJblVzQzduUi8zODd3VUNHWU1vZmcxbG01MnJsNTlGNHlPRkd1?=
 =?utf-8?B?Yk1aY1RiQ3JNQUVDNUtVeDl0Z1k0aVV4Z081MStEVVl4RG0rUW1ZSjBzWTJ0?=
 =?utf-8?B?V29SVllVZk10T0MzWGIvOW9sWDQxbTMzOGQ5NjdOR1hWYTB2K3g1a1pyLytI?=
 =?utf-8?B?NzNVemQxeEphQk1QUGNReFQ1YWhLdlo2WCtkVTlnWEE0TGdKSFRjU1E0V1ZB?=
 =?utf-8?B?M0kyWDdpVENMWSt0VlB4NGIrL25BRkRPa3hQR3l0ZDlVRlc0RExzMDFLOXFE?=
 =?utf-8?Q?+uPuHKQ/dAM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bENVbjdObzFYRFMwbWUxcThMYVhKZnlLNnNFTHlsdGdqQThPSjdNMUZ6VExn?=
 =?utf-8?B?dStrVjE4REJwUEwvMjV0bmRnajUwQU5XMTIvekZmeUZLbVd1RmpoZXNaMFNZ?=
 =?utf-8?B?WUo0QS9BWSt3WUw5ekt2L3lQNVVFR0M5SkhOeklXbUZ4L3huNW9CN1dZazFU?=
 =?utf-8?B?OTk2M0lDcS9oek9KbW91emVqUHNYU0tHakI4QThYNDJ4WmVmbXNaSWlyK2JS?=
 =?utf-8?B?bW5jUXhIVkNneDh4aXNNUzJhNFIvdkVicEd5OUROejUyY1N4d09kNi9PWUJI?=
 =?utf-8?B?b2VuTml6L2dyUHcrMWsyUk5DbnBneHFWMUZramVUdzRjb09hVUhhL3RrdVJH?=
 =?utf-8?B?K3NGVnZYcTZPRG5hVjJ6LzF5bVpBaEVyOXk0cnF3OWE3Y0huNmpKdExPd2pt?=
 =?utf-8?B?bjZIOXNLanJEZ01OMlFOTjdUaFQzT1YvMXpjRkRKSzQwdWJ1WVVaajExQnpQ?=
 =?utf-8?B?ZkNOYXlvZUE4b3k0eVViY3JqamFzN1RnL2pJaVZIQzlRR2RtZVFjdzQyb1p4?=
 =?utf-8?B?blJlUlJxL2tpSTRrUm1KUkx1OUdNYk1GMzQ4NTcxSk1sVGcyemUwRitKbElF?=
 =?utf-8?B?Z1JDejZTbWZ1dkQvNE5NNzJHdXBQaWd1dnVadU9oTExkZlJ2ZWpZS0VFcXQ3?=
 =?utf-8?B?cUo0dndmQ29DSDN2SDJ3L2N5NDc4RlVxaEZKUkZFdkJ3dXRmdXFZRHdSNk5I?=
 =?utf-8?B?eVM3QlAyS25lMGZKaXhMK3loTEh6Rm5KUS9CVEFtUGI2eUx3MXNaZmRUZUZB?=
 =?utf-8?B?dkNIcnFoeXVEYWtCcDdCTStOb1pRR1Azc09yRnNpZm15MTRyczFscWJURWp3?=
 =?utf-8?B?MStUMEhGSW96QmpRb1g4SkRYcmxMUThjM2k2Y1dJWTdpUFRSc1R6TTZFTHlB?=
 =?utf-8?B?ODA0dncvL1liU3loVkdLWGZ2dWt5dkdiYTl6STNOUjdJRkZGSnl5b3l3YnR5?=
 =?utf-8?B?SWRDRk1OczhXZ0xPVHVGZ0hGV3VDWVkyRkMyUUYzc2V2b2hRSno4NDFaSTcz?=
 =?utf-8?B?K1Y2dTVWbzFWV21yT1Y0YlBUUHhDMGhsSWYxUkpkZHNRclp5ZUhsYlM3V0tI?=
 =?utf-8?B?Qmozd3JPVjQxZ2g4N3ArU2tZVnFUN0YydXJabmk4YlBUazNRYWFiWWlIR2dq?=
 =?utf-8?B?dFUxTmIwRW8rWFY5UFlaYUtjSHFZQ0N1MDhPWTcwVWZhaXdxUitWK3V0RzZ5?=
 =?utf-8?B?dDk4ZkpvMzFQRHNxZWZzK2t2aXN5bHEvRUFRQjdySHVlMU1lM0NhbjM5aEhs?=
 =?utf-8?B?d0x6Q1lic2NWcUdTZ1VEWkZUWXF6MGs3d090MG4vVEJpNjNuWXhKV3Z5TGhE?=
 =?utf-8?B?Y1dFWXV3ZXlyMmlJb2xSV0N2Q0lTdDkyN2huV1Y4U1VuWGxLSU1Gck9OOE1s?=
 =?utf-8?B?MDMzTWRhdkJwYUFwNUJBWk9aalRXY2VmbTlGZzhzYlllWFVOY3JFRVp2R2x0?=
 =?utf-8?B?ZGxXcVliUlpJR3lEZjNNWithd0Z6VnFIejVSSWJ0bTFDbDVDRFNwdlgzcWVU?=
 =?utf-8?B?dmgzUjYySjF6ejJzaWtITlRrQUJMWE82ZkFzK21aY1RBczhZaGhjNmpEdDBM?=
 =?utf-8?B?RWtMT2MzTVNRYThOVWlHUzYvT015bVEzanNsZnBpc2hMdXdyRGdaY2paaEh2?=
 =?utf-8?B?ODR2TXp1ZlJvRXVHM0xlWmU5SGlxNTFEclpUSU92MGovbEI2MXRQNGpQSVJS?=
 =?utf-8?B?aEdjdGZqbzBld2hoYTc3M2d5bXlWbkYyeFBpUmZLV25OdGFjWHR5VnI1RGJH?=
 =?utf-8?B?ZzJXOHRwbXBKejNTWERES21EUGljRGVOdnNJZjhQL1Q1RlB3UStaVTg4cTFF?=
 =?utf-8?B?OCs0OGMvc2xPZGJ5b3Jpa3NwS2E3dVNLRW16TXBCNmE3UUt0cEN0RVBqWTVo?=
 =?utf-8?B?SUh4SXVOb1kyUWdTSVZCc2FxekZKRTlhUmllc1MwWk82S2RTam9mWm5oMWsz?=
 =?utf-8?B?SzJPYkdONS9WVW9UR21HNXg2ZitqT0JJNHdXUllwdTY5UkhKSnBQeUtzSEtZ?=
 =?utf-8?B?UHpnbDR0dzBTVEJrNkVyQ1VRaXJtSUhvdm5xUGdXT0lkMmswWCthWmF3WXpt?=
 =?utf-8?B?dVdIU0FlZ0JGL2RiWnJieW85RVdPcXg3TU9UbXdrNXlGdmFVZ2QyZkVTaktO?=
 =?utf-8?Q?ajy7xKsZ/KaY3L3Cy4DmP6d4E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed953019-77fa-48d3-351c-08ddf4363f7c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 08:59:58.8194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yorWZee4WtU5OBmmSCsvPRVBtjfTYc9mucnXBGYSaogBbIOnfsHSEBe/7rCzJV6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719
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

Hi Lyude,

On 13.09.25 00:43, Lyude Paul wrote:
> Agh! Sorry for the spam, I should have double checked the code before writing
> this as I realized the reason I didn't implement this. Correct me if I'm wrong
> here since it's the first time I've interacted very much with this API in the
> kernel but: it seems like the reference counting for dma_buf objects is
> intended to be used for keeping a dma_buf's fd around while userspace is still
> accessing it and not for use internally by drivers themselves, correct?

Yes that is more or less correct.

The DMA-buf references are handled by the DRM layer, in other words as long as you have a GEM handle the DRM layer keeps a reference to the DMA-buf providing the backing store for this GEM handle.

So you should not mess with this reference count if not absolutely necessary.

> On Fri, 2025-09-12 at 18:32 -0400, Lyude Paul wrote:
>> …though, I just realized immediately after sending that response to you that I
>> mentioned that this type is reference counted in the commit message - but I
>> never actually added an implementation for AlwaysRefCounted. So, that's at
>> least one additional thing I will make sure to add. Similarly though, I don't
>> think doing that would require us to interact with any locking or sg_tables
>> since we're not yet exposing any actual operations on DmaBuf.

Well exporting the buffers is trivial, but that is not really useful on its own.

So when you exported a DMA-buf you should potentially also use it in some way, e.g. command submission, rendering, scanout etc...

How do you do this without grabbing the lock on the buffer?

The usually semantics for a command submission is for example:

1. Lock all involved buffers.
2. Make sure prerequisites are meet.
3. Allocate a slot for a dma_fence on the dma_resv object.
4. Push the work to the HW.
5. Remember the work in the dma_fence slot on the dma_resv object of your DMA-buf.
6. Unlock all involved buffers.

Regards,
Christian.

>>
>> On Fri, 2025-09-12 at 18:29 -0400, Lyude Paul wrote:
>>> On Fri, 2025-09-12 at 10:25 +0200, Christian König wrote:
>>>> On 12.09.25 00:57, Lyude Paul wrote:
>>>>> In order to implement the gem export callback, we need a type to represent
>>>>> struct dma_buf. So - this commit introduces a set of stub bindings for
>>>>> dma_buf. These bindings provide a ref-counted DmaBuf object, but don't
>>>>> currently implement any functionality for using the DmaBuf.
>>>>
>>>> Especially the last sentence is a bit problematic.
>>>>
>>>> Wrapping a DMA-buf object should be pretty easy, the hard part is the operations on the DMA-buf object.
>>>>
>>>> E.g. how are locking and sg_table creation handled?
>>>
>>> Mind clarifying a bit what you're talking about here?
>>>
>>> FWIW: regarding sg_table creation, we currently have two ways of doing this in
>>> rust:
>>>
>>>  * Manually, using the scatterlist rust bindings that were recently merged
>>>    into drm-rust-next
>>>  * Through a DRM helper provided by gem shmem, ATM this would be either
>>>     - `gem::shmem::BaseObject::<T: DriverObject>::sg_table()`
>>>     - `gem::shmem::BaseObject::<T: DriverObject>::owned_sg_table()`
>>>       (both of these just use drm_gem_shmem_get_pages_sgt())
>>>
>>> However, I don't think we currently have any interactions in the bindings
>>> we've written so far between SGTable and DmaBuf and I don't currently have any
>>> plans for this on my roadmap.
>>>
>>> Regarding locking: I'm not totally sure what locking you're referring to here?
>>> To be clear - I'm explicitly /not/ trying to deal with the issue of solving
>>> how operations on the DmaBuf object work in rust, and instead simply come up
>>> with the bare minimum interface needed so that we can return a DmaBuf created
>>> from the drm_gem_prime_export() helper (e.g. gem::BaseObject::prime_export())
>>> from a driver's gem::DriverObject::export() callback. Or alternatively,
>>> destroy it in the event that said callback fails.
>>>
>>> Unless there's some locking interaction I missed that we need to solve to
>>> fulfill those two goals, I'm not aware of any rust driver that needs anything
>>> beyond that just yet. As such, I assumed this interface would touch a small
>>> enough surface of the dma-buf API that it shouldn't set any concrete
>>> requirements on how a fully-fledged dma-buf api in rust would work in the
>>> future. And at the same time, still allow us to move forward with the shmem
>>> bindings, and make sure that the surface area of the stub API is small enough
>>> that adding the rest of the functionality to it later doesn't require any non-
>>> trivial changes to current users.
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Signed-off-by: Lyude Paul <lyude@redhat.com>
>>>>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>>>>>
>>>>> ---
>>>>> V3:
>>>>> * Rename as_ref() to from_raw()
>>>>> V4:
>>>>> * Add missing period to rustdoc at top of file
>>>>>
>>>>>  rust/kernel/dma_buf.rs | 40 ++++++++++++++++++++++++++++++++++++++++
>>>>>  rust/kernel/lib.rs     |  1 +
>>>>>  2 files changed, 41 insertions(+)
>>>>>  create mode 100644 rust/kernel/dma_buf.rs
>>>>>
>>>>> diff --git a/rust/kernel/dma_buf.rs b/rust/kernel/dma_buf.rs
>>>>> new file mode 100644
>>>>> index 0000000000000..50be3e4dd4098
>>>>> --- /dev/null
>>>>> +++ b/rust/kernel/dma_buf.rs
>>>>> @@ -0,0 +1,40 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +
>>>>> +//! DMA buffer API.
>>>>> +//!
>>>>> +//! C header: [`include/linux/dma-buf.h`](srctree/include/linux/dma-buf.h)
>>>>> +
>>>>> +use bindings;
>>>>> +use kernel::types::*;
>>>>> +
>>>>> +/// A DMA buffer object.
>>>>> +///
>>>>> +/// # Invariants
>>>>> +///
>>>>> +/// The data layout of this type is equivalent to that of `struct dma_buf`.
>>>>> +#[repr(transparent)]
>>>>> +pub struct DmaBuf(Opaque<bindings::dma_buf>);
>>>>> +
>>>>> +// SAFETY: `struct dma_buf` is thread-safe
>>>>> +unsafe impl Send for DmaBuf {}
>>>>> +// SAFETY: `struct dma_buf` is thread-safe
>>>>> +unsafe impl Sync for DmaBuf {}
>>>>> +
>>>>> +#[expect(unused)]
>>>>> +impl DmaBuf {
>>>>> +    /// Convert from a `*mut bindings::dma_buf` to a [`DmaBuf`].
>>>>> +    ///
>>>>> +    /// # Safety
>>>>> +    ///
>>>>> +    /// The caller guarantees that `self_ptr` points to a valid initialized `struct dma_buf` for the
>>>>> +    /// duration of the lifetime of `'a`, and promises to not violate rust's data aliasing rules
>>>>> +    /// using the reference provided by this function.
>>>>> +    pub(crate) unsafe fn from_raw<'a>(self_ptr: *mut bindings::dma_buf) -> &'a Self {
>>>>> +        // SAFETY: Our data layout is equivalent to `dma_buf` .
>>>>> +        unsafe { &*self_ptr.cast() }
>>>>> +    }
>>>>> +
>>>>> +    pub(crate) fn as_raw(&self) -> *mut bindings::dma_buf {
>>>>> +        self.0.get()
>>>>> +    }
>>>>> +}
>>>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>>>> index fcffc3988a903..59242d83efe21 100644
>>>>> --- a/rust/kernel/lib.rs
>>>>> +++ b/rust/kernel/lib.rs
>>>>> @@ -81,6 +81,7 @@
>>>>>  pub mod device_id;
>>>>>  pub mod devres;
>>>>>  pub mod dma;
>>>>> +pub mod dma_buf;
>>>>>  pub mod driver;
>>>>>  #[cfg(CONFIG_DRM = "y")]
>>>>>  pub mod drm;
> 

