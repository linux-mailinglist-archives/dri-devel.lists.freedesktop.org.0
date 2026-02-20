Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8J4SNqN1mGnhIwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 15:54:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C181688DB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 15:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6840A10E361;
	Fri, 20 Feb 2026 14:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NnqPRTUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010030.outbound.protection.outlook.com
 [40.93.198.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E064710E361;
 Fri, 20 Feb 2026 14:54:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWTLNBYa9tpaNl/jBz2Qx5uHseTJUfM1kkqbtNtfVavLlvT7BMpM/1L/zDJwEclotY1ytxMZzqCuRDWGImO/vslmIXbUt2b4zniqKWUj6sHT9yaBS4orbORhN6nJqKId7Nzdy/WBuByeD6K94jOlpt5250vjxi9VyBo4KRF2nQqZ43irVR70mEOY/34V6lt5t/xzheydj/v9/AY680JxupJvyTCmYplAH10Jmx3RXiYE0dBsTRM7+ff8W3toiAwqHCks/ggL/4RPngrNQZaenV8LvLNTf/0gqhJsvdW1CsUaHi6+4F29gB4LvMMRoLMiF5NhnOhTug4YLHF5OoH67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFL6m8OTXLOSvEwEqED0DYG6E9hqGxl8ETUV3HZp9ls=;
 b=dJhJgnDP03Fst+B2p58V1/avt6cJOvJpwvmCkyzisZIuSDF70SRfxQte+yQO/841ZdZ28LBNIkehJUF072mbT0BZOI3chbg+atWJviwwrtEfrGYRgTvlubQEmCmpL34Cn9wgiAHWgYXtaAsC44fEGUodbVVxWhhBobk8CbHIbTdqPzoIulhlUb1usF/xlLfGKNsqsCdkbM3BFs9hUuaNLZX/nN7+dqhPTlRIrVkwu/XyKQmpuGlC4GIse7i+t9pXkQtCBkZ3ZqEG1doUWcilB89VMf7GYatcONXyoAC8JttPfMO+oEW2BDtBt6N4tApavWgx268VaTC0N1LRJ4HGkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFL6m8OTXLOSvEwEqED0DYG6E9hqGxl8ETUV3HZp9ls=;
 b=NnqPRTUdytaqBbH+rXlAzuSWe6cyKoIqUgjw4UI1Frx6AT9nYn35zIMQXbOu62+KmMtUTLU4qrWWAbqZV+F2G8dR/GD+U1nRSubL0a66LXAlm/cMj8CNMTdLESGgtncpAUO7znGHidiX6RwLesATo3/RPI7Cth9LmoVgjDIlYPr7X7RX8HDeHkQYHUmN+Es4VNKlVISC77RCmjdPqPjPhmAs0aJ4ltkn9K6vl4HPig8Frq2UenTb66rxo2TxYWEfYDgy4BSVMcVYjZBNR62pQ9blcQEU0R393ovUyIplo4iqRuc3g0VWUbWOvClAVYGt5Na2WCcduk43Q/K88xcbEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ1PR12MB6289.namprd12.prod.outlook.com (2603:10b6:a03:458::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 14:54:17 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 14:54:17 +0000
Message-ID: <ece7e6c1-f91c-4e7f-801f-28b228bddf3a@nvidia.com>
Date: Fri, 20 Feb 2026 09:54:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGJN74VW6HS2.29CXZ59K9M220@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGJN74VW6HS2.29CXZ59K9M220@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:208:236::8) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ1PR12MB6289:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae8e560-104d-426b-6a08-08de708febbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2VmVW9rSmFPU1FyWjBIRVFmb0hTTWJKYjd6bjVzVjJYcHNiV293alZPYmNq?=
 =?utf-8?B?d1Z6YThLYm5rVkFra3BiUU9BbTlkSVJtbGU4bXVZS0JTTkdxUTJPMk16QXht?=
 =?utf-8?B?aUdWd2ROTk4zVEVEYW1nRENyNDl1UW45bUJTZzlLdUhRRURISjlJbCsvTlpo?=
 =?utf-8?B?YzJabHdmMHRzdjBXYk9pajFhZWV2WUFkU0lja0VDbmZhVmluQkJpUkRsOTY3?=
 =?utf-8?B?V0gwYjB4Z21Dc1NSNjE5eEZ2SVg0dzQvZGVHclpkOGRlVWI1MDVZd3crb1Fq?=
 =?utf-8?B?OE9jM1BZcEEwckhlUElNazNzUktvTXE1enlFNTBxaGMwY2JZeTRJWVIrRlhP?=
 =?utf-8?B?Zlh5MGdHbk50MS92M1NnaTBLQXJwUzZ4eHdNTnZCNVRtZTNaZ0kwVHVsRE9F?=
 =?utf-8?B?ZUJ1YXFyUmhYWHhwWnZPUkE3VU00aGUxRDZhNXRWUWZRZStGNC9tSS9IL2Ir?=
 =?utf-8?B?ZGdVcyswWDZmWk5LNHI0N1ZyL25jOHJzQ1lBMnJNLzMxRG9wUS9QcVJOTThp?=
 =?utf-8?B?Um5nR1V6RVNvaStkRWVJKy9yUFk2cU9EK1NiTnhZaDlzdzJOZ1RHMHVxU3ZG?=
 =?utf-8?B?M0NJM3YzUHhWZ002Qmsxa2RxZlBLcEE5NE9sNFNJRVl6UStYZWppeDYxYXlj?=
 =?utf-8?B?b0ZzQ2c0em1McmJ2TkFaV3luQ3d5OUVMZFBWVlZBK2Z3MDR4cDh0YWx1T2tj?=
 =?utf-8?B?UUhnMzk5alpENTE0ZmxGV2FYWjl2MHhTZzk1dWx2dDVuWWpGTU96dVZDVlJs?=
 =?utf-8?B?ODJpSGJaUVBsK0dxOTQ4VE5TL20xZlpZbllUUWJ0VVFyK3B2eHdEc0JNMi9Y?=
 =?utf-8?B?QnlSbTBMVGYvRE9BVis2NEF0MWdia0JtTG5sM25UbUdaMmdiUFR6cTZRWWdi?=
 =?utf-8?B?YVdLUjdOWXJNSTd2MTN2QlQ0Q21XbG5GNUNYSmh5VlVCQUF5MEdTeWlKRE1q?=
 =?utf-8?B?OUZEemJ1RHZNRlByRUhLdzF6bnJzY3pnNUdMWFludUlUdndGckdqb2xxdE0z?=
 =?utf-8?B?aXdnUmVVZkg3WmRid2lHSUIrWTd6KzhjRGMzUmdLSTR1djhSMUdpa0VWaWh4?=
 =?utf-8?B?bklkbW1WQnZSZjdqVDJIN05NOFI3Q2RRVUpYOXBBUjlDcER2M3RKSlY5dGVy?=
 =?utf-8?B?M3lhSGtITllsSEx1QWNZbDliME1KcEFmbUxYeWVzRDBub1ZZNjBZWGdaR3c3?=
 =?utf-8?B?cE5Ec1JMT3RuOFlWaTJyZEU5aWtVSmtYc1JZUjFwSG1UMnlUb0xnQlBTL0kw?=
 =?utf-8?B?NUhxUnB6Y2lSS1pTb0JDeER3VHVrakExc3lrZXB6UmVqRmFDVnVsVXd6Ymd2?=
 =?utf-8?B?RkxJSm1FazJrYjdxOGszYkVPZkw2NlFjK1NXUGlNU25ROHVTYnVXYWplVGZq?=
 =?utf-8?B?S2x5eU9ycWtMQTFxemMrUFpOVGhHeUxBZFNJVnlsMFZuK1J1ZTgvWXJXQTVJ?=
 =?utf-8?B?VTA0RjNHbnBsYzduUU8xYTFOTEFqZERwWDc3S2Qyb0h5Q0xKV2I5azRDVjB3?=
 =?utf-8?B?d09zUlhyQ1V5bktPeXg4dlFGSVBoVUkzbFJWSW1WYStnRUsrbnNvV1grOS9w?=
 =?utf-8?B?bG9aZVJVZWJSTHJqWUlsNFN4UCtsRnBqc1hLQzlZdmw3bDMzZE8xU2tSbkY2?=
 =?utf-8?B?Q2ZvRkZUY0NLWDA2T05FVHVDeUZ6Nk9tS1pKVnpsUFVEZnZJUnN1Y2xWaWtO?=
 =?utf-8?B?d2EzU2ttZitRMGJack9SZzlHOVQ2QjBXekVMcllWOVFGQkdpbWU4WFV4OUFT?=
 =?utf-8?B?VnlmTk1kNHlWd0tTd2dnQ3FxaE5PZUdSVWxSWEpUOW5Pejc1V1A4bW5LdC9y?=
 =?utf-8?B?eE5vV09QaGk2SXFsZ3BadEh1N3ZHZCt6KzQvNmdwRWRnM3BUVDNGR0xlZEVj?=
 =?utf-8?B?T2E4WXFzUVpqOWdscURXd3RuaHpuOFlhZlZDU29VTG40dXZLbThLTWFDYzVY?=
 =?utf-8?B?eEhYbnY2Y1dVdUxhV2JiNXYzSmZLMUpXNkdqeCsxRUh0N2ZiUFA0Q3ptY0Fp?=
 =?utf-8?B?WWNjSTN6OFpBV09HK0t1ekNKSWRXTEVkUHRWY0RaK0NQRWcwcWZab0hLb3N5?=
 =?utf-8?B?WnZ5RFdLU3owTElLRitCd3UyclIxd2Z0RjBKeWpVSFB0a2U3S29iVnptNnlT?=
 =?utf-8?B?ZG9BYkUwUm8xbk1ndW9majhLbXo4M3VDWXV1YVh3MVd4RnBtbk5WTXEwd1Vw?=
 =?utf-8?B?Q3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3p1dTZSTElEU2FWUlFsTVUwa1RPUllPMTFxVHFjaG1RajZyVkNtcllZczFS?=
 =?utf-8?B?dWZtY2NUNS84SjB0K0tVOEdRVXFCV2VkK1Jjb3VHNlFUbTk5M1JESXloZmRo?=
 =?utf-8?B?LzlqUWR0c0lVQ0ZFaEczd1lFS1lFcVhPS0dxekNWN1VJSEtUZS9qWjk0SXpq?=
 =?utf-8?B?RUg0THZvRG8rRXFIcDRaaStTTFJrek1HU0ZTVjNySEpKTVdCR3VnSjQvN0hi?=
 =?utf-8?B?Sll0Z0dBTVk3b3hKMG5FbG15RzFpY0ZhSG1wTlk2bFh0bjg3R3pJYzBJVkFW?=
 =?utf-8?B?Z2ZvbFFCOWs2RGpOdGFkTm1scWNOZUJNQ1J5S0lvUE1mY0NtaEplM2NBbzJr?=
 =?utf-8?B?VmRUS3l0YVJvNmtjQUdyNXp4UlJ1Q1BWMFY4TUNUYmlzYjRmWGQvSmg0Y1My?=
 =?utf-8?B?dkkxUlIzZXIzWlRXWXc5Y25hNG5ubTZZS1ZNbFhFL3dqWGovaW81TVg3a3BR?=
 =?utf-8?B?N0RYVERQN3o0MDMraGI3Z0xZdUg2UVUvQ2ZKbnExOFduTG1rYXdRWnBLVDdr?=
 =?utf-8?B?ZS9vUWxjRjVWUmVIOUgvYnVrWTZ6b0dZZzBjd1NWcDA3TTJ6Qi9wcFBpMnJU?=
 =?utf-8?B?aWVvRXl5V3V6VExvNTBNUzVxbDgyMlh3c2ZOOGNrVHU5NWVPdXFubG1paGhL?=
 =?utf-8?B?bXVMR2lScVdwc2FxQlhlWDlrbjhjQVBaWTd4amJnUlA0b0FIQjMwNzByK2Vi?=
 =?utf-8?B?UytsNmtJbDlUVG5aeVJmSXhrMGdkYVRJa003L2RiT1RKUWxjcVp6d3A1WUdU?=
 =?utf-8?B?TXkwQUg2ZUErajlpS0VSa0c2TTZhaklpeGRub1hCSURmSnpFd0hWMjVYL20w?=
 =?utf-8?B?eVJwNEttQlNRRmp5TmJpZFB2MkdKQm9sY1hDZk5ER25zY3ByMHVWSitvYlFG?=
 =?utf-8?B?SWlwS2F3MTIvUXV0OTh3cjZyRGNGTFpGeURJNW5FODgvdjFJMnB3TERXTmdN?=
 =?utf-8?B?OEJUUzFqKzlFRmpuZHQzZGZVZm83NHUrZEV4VDNzSzVHNlJmaWV6dS9rQy95?=
 =?utf-8?B?L1VoTDJxWWI5eXAraTBoZjAyZUpEaHB0TTVSeHdxbXJyQ0kwSzBxRkN0cGxu?=
 =?utf-8?B?NlJNVTVVeFdCYVlQVGl5K01YbVBpRHhRdTZDTkd0MWlBZVVpbjNHMXJXbUQ3?=
 =?utf-8?B?L2ZqZm8ySmZmL2V3ZUlqK3pyLzNLQTFOOHRpdlhaY3pvc3BFQXdzY1E2TmhL?=
 =?utf-8?B?UW90SURhbm5PeWM5aVFDZVQvSVNiRGx4UjlFMlV0Z3NPK251NWVkTllnMlc1?=
 =?utf-8?B?aytOazQvc1hZNXoyclZ5eEZkQ0IyLzhNNStTdjB5Y0d1MFdHSjBSTlJDTXdW?=
 =?utf-8?B?VU9XcWJFZGVXUGo4QXhwd3ZuNFgvUFZGaG41Z29PRFh6TGVtNlYxWHBFcHZL?=
 =?utf-8?B?c2ZEb1ZPVGRYUm9LRmNlOGdKRzI2bjNQRDVBWlA5MHhkZDdOYVBlTFdWK05F?=
 =?utf-8?B?QzBUNC9PcXhjZDNkYjJHaHpoY0RUSURFbEZUR2xZckpkWWpXSE9ycGg4MUJx?=
 =?utf-8?B?ZEFRaWVyRm5pbEo1WXdPb2JZdExyRmh2SWY2QjRadWJjemE3Rmx3M01VaFkw?=
 =?utf-8?B?ZnE5dExGQ1VBa2NxZDVZZ1lmMjVqOENiTUJpcStBalc1SjVTcGpWd3liV1ho?=
 =?utf-8?B?cFE3WWdDUitRMTlxbGIxZ1h6dnRQMmUyTWN0REhsalB6NXlvMmVkNjVBaXYv?=
 =?utf-8?B?elJTVW95ZTNGR0ttRXRjMEJoNXFtZzM0VVJKbWlIdWxSTXE0a01HM21XTERG?=
 =?utf-8?B?am4ySUcxSzhCdEMyVmVqR2w0cVRFVTBGNWxUejRsakRUUzFiNHhLNTVaeU1C?=
 =?utf-8?B?b0l5ZzhqMk9HbXVjdTMzRGRWT2NRS1pRdm5JOUVCWkJlQzhNTmlnNExROVVh?=
 =?utf-8?B?NTdMRFFrUlFkeElLdExmVGt6ZmtMYjF2YjIvWmw5bFhtaHlWL3pWOWVCQ013?=
 =?utf-8?B?WE1GMUpDS0cvZDBMUWE1U1M4MlNNNWh1Z0k3WncwZUhoeG13QVowSGpJZWNq?=
 =?utf-8?B?a2VHSXliSmt4L00vNisxYTdDdzY4MnhJRFptZ1FYMVZRbUsrUGhXaEdYYUU0?=
 =?utf-8?B?bW1rZ2dYVDV0UEMxNjZPdkszTVdKV00wOHB5OWRJSklPMmJZNHFXSmE5N1k1?=
 =?utf-8?B?a3hlbkVlRUllVnMvZmh2eitWNnhSMmdNUmRmOXVkbytSQmVLWW53OUMyeUQ4?=
 =?utf-8?B?UTlRRm5nVmd2eWVsZHJoVGhJTGV1QnVLOWpGNER0TGRhNWI0T2p1OFpSNWxL?=
 =?utf-8?B?bUZPbnRPSDZEY21MdXUwdVNkYm1OMVVzc09IVXQyRkFwUmc0ekxTTksrUGV1?=
 =?utf-8?B?S0F2V2NLMkE2WmdIZDNyRHM2ajcwaENiOGRmZno0WEVBS3JkLys3UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae8e560-104d-426b-6a08-08de708febbc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:54:17.3306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6BvitI0whH5Sho42glEX5aUr/SG1x2wDSJ5ii068ueheRVYhpixcCvZ9G3h3D4Z4twEZoKMH60pHwNo1oN2eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6289
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[buddy.rs:url]
X-Rspamd-Queue-Id: 33C181688DB
X-Rspamd-Action: no action



On 2/20/2026 3:22 AM, Eliot Courtney wrote:
> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>> +__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy *mm,
>> +						   struct gpu_buddy_block *block)
>> +{
>> +	return gpu_buddy_block_size(mm, block);
>> +}
>> +
> 
> Will `rust_helper_gpu_buddy_block_size` be used in the future? It
> doesn't appear to be used in buddy.rs.

I think it is worth keeping because it is a pretty basic API the underlying
infrastructure. Finding the size of a block can be important in the future
IMO. It is only few lines, no?

Thanks,

--
Joel Fernandes
