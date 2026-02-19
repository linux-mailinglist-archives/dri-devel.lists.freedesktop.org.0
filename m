Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GJkKt4sl2nmvQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:31:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8251602B9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEFB10E6FC;
	Thu, 19 Feb 2026 15:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DVbJHwyC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F02110E6FC;
 Thu, 19 Feb 2026 15:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZ2wkrI/Yt0UQCeedc9GPlej3jiow1TQhRtUstPJdEHEXGkwaH1NG6R6p6G7/5CVbnf9G9/TQDpX8168dYd3ncX1NU0y2bEqeQOafwydvgydH4awMKHADvlvoDx7pNrSuGqkGk30fivmXeYe7JDKhPbyGLvQIV1KyzcKXaqoWVpACHzzelQ9uSJE1gEfZuZPPs4hLOVNOSzFsUASfl9pWmQOYOqw9yWyMQitmNiGqp5U7ERxUTH82oVYFxYIe8MwZrwhsCw54FV6wGS5O7iOMTHKXe241VYI5MmljmyQiQ9PFkgoTwCFQIyX1rwaaLZlCEKbrHwhLHlswz2Jj2mFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/zqWzEwyThRHWh9StTlNVrcs9I6Pw5BjFSiUy3lg/I=;
 b=S5np7vPQtZSgOwceyYQVKKngtvneA2yj9b0YWeYYKhX3cf6eoMRhTTzIqX7xkUmrqIUiJk4BYb7GyoNTQ+wiDTRiQBv51XeTb7EEhfeSsdyYzaXvw1vnJP453LZluwK2nVC8IxXMVsS9CRRktRXvg2WhxyQUmOxlBPjEJUjnnRkreEj07DgPrtY0sxTeOORMemzwGum1KHpxrOPK679/sMu0AL+0/4EvciN5bzBBRPjJIBZH6expB6DT2G81Jk+NmdWqqFJBBSJLSwNnbQSrUbrUWsziMhDrsJEZPg46poSWy1sObUCyWuwe3KDz4SubCpWlp2ovFj47OEKRIMJOVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/zqWzEwyThRHWh9StTlNVrcs9I6Pw5BjFSiUy3lg/I=;
 b=DVbJHwyClIWkadi1zVKi1TrJ0tKMfVr9xQviSiIc7RbSDCxp2PDSfLJasLbjEhrsc4RkTCowBHDm9CRC/E6KItJJnvqPwhUGYS8l0Ec6uqN6obTM06LiCB1p8oFQqztNk6kqEDBmGVDbQklqBoHOGdox1RjAP9wHgMe+NLRfqXDxLRPBDIJCxz1sPewg5m7HTeMZqOshk6TMPgP+Y76/2didxNU+OpUNw4Clf1M9uxNor3cXItWEAT+Kd5Jw8ocZViaNUPIDrKtu/Cl9I/sOZJFZS/DbiN9gWOQMI4KFZj8sYJculJfD6rMCdhrHfjXw6/FZL2/G1JmfiSzQo8BEBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV3PR12MB9437.namprd12.prod.outlook.com (2603:10b6:408:21d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Thu, 19 Feb 2026 15:31:30 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:31:29 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v10 2/8] gpu: Move DRM buddy allocator one level up (part
 two)
In-Reply-To: <DGIM3AE5HMTB.1INPUXJQ5GQ4P@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-3-joelagnelf@nvidia.com>
 <DGIM3AE5HMTB.1INPUXJQ5GQ4P@nvidia.com>
Message-ID: <1ad572134b32bb7213c621f1d9641075@nvidia.com>
Date: Thu, 19 Feb 2026 10:31:28 -0500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: IA4P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::8) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV3PR12MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d5ed44-c988-416c-8cee-08de6fcbf417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXZYMEh3OW5yZEVZQ01iRDVFdFh3bFlKcWJoSVVna3ZaQXJycEVBVmo2Mk5Q?=
 =?utf-8?B?MjQvL0dNeitUQTl6RDdiTkZvTVRaN0FSaDNFcGhPbkcyMGJaZmcrN2tRVWt5?=
 =?utf-8?B?SU1KaUMrRGgxdXNJL3hpdWtjK05mbWo0MWtqQnJHalNNTUZ5R1hUYjNqN21Z?=
 =?utf-8?B?TDBFTmYxSE04YjUxZE5QMmVsa2hOOUVBNVViQXFDNlRJMTRwS3JMb2ZFWWRP?=
 =?utf-8?B?KzZsUTlIUmE5U1Z1TTMvaWl6RGY3aVZ6YkNqb1JLY01NYmp3WmR3ZnU0eWhE?=
 =?utf-8?B?RStDYUpEOTh0UFJYYlEraWdUSFRpa0plS1hRa1pQKzIyV1liLzc4VjVPc0Z6?=
 =?utf-8?B?SFRlT21sdDlnM1hRWlZUdjFZaEEzVTA5Ym5RLzYvZGVqckhDUUlGSnI4Smsw?=
 =?utf-8?B?bmNXeUY4bWFGYzgwMlNreTkxdmFqSUw0R2VxL3NYRWhxLzJ6QkVrRWREQTcz?=
 =?utf-8?B?L21qQ29meU9aUTRJWUwzcldMU201NzZsV3RoSklYMFRweEh5S0dCVkJSV2tL?=
 =?utf-8?B?cThOTEpVbUNWVldWVjJteXJlUHcvbWlNaXhwaUsxUDl5TWV1aDh5Q0t2T2Y4?=
 =?utf-8?B?ME5JR0JGZHczeVRhcmJJM0k1dUsvWXN0dnIwV2IrbEhyOWRzTGhzOXJXNjRq?=
 =?utf-8?B?K1ZOSDNyMDFsTTJxQXNOT1VQZXJsbEN1T3lRRzVjclZXdkxzejdIQU9TcEE5?=
 =?utf-8?B?UjJMZFN5UjRleks4d1YxeDU1elNsREJMMW43VjYxNThpa2p3anBidWpKSTc4?=
 =?utf-8?B?cDcyS01sL2N5UHdoZmc5NTl4U2dMLzNTTVlzYkFsNU1Vb3NMREdYUEUwVStw?=
 =?utf-8?B?K3k2WmZlamg4K08vTDRtdWwwWFlXUS82Ym1xbzRva0JLSDZWQVpGV3BkTDFz?=
 =?utf-8?B?ZWdzV1ZHSzVYREU3bEpla0tKMHlzUGlxVU0yNURwNTF3T01INzR6Z2p1SndI?=
 =?utf-8?B?cTJLNUh1ZllOczNjMGVzczRaUHQ2NGgyNXhLdjVUdEF5eGNXc2hLRm5ZaXhY?=
 =?utf-8?B?S04wM2RGbTFDUGk1dGg5ZjV5dEFRMnh0b3E0cjFudzdZeFliVEtSSzQvak5P?=
 =?utf-8?B?RnV3QWJZTTRvb1YxbDh3WHNlSEF3UDRDcC9jS0I2ZkdGQy8yYkRDQVB4K2lF?=
 =?utf-8?B?SC83c0sxMis4c2x1Tm81R0hySzlxWTJCOVJSbGxqa0YzVCtVYzlQUjJocHgw?=
 =?utf-8?B?elc0bUFNRXJYcjZWWXZ1UXMvd0YyVVlsbUdIT1FEK3lBS2NWSWw0YjU3OEdX?=
 =?utf-8?B?clEza0VDVklodlIzYjZVSUJTZDFZdksrNlNrMDJITVlEN1hEUmJmMGNsaVEy?=
 =?utf-8?B?MUl0TDBSTUZHR3grd2ExbHhxMU9wZ0IwS2R5VncwbVZHZnhibWNrY1plZXB0?=
 =?utf-8?B?aWhNaDcrZWQvWEpyM3pSdElXdmQzWTRlQW4wbEVaVW44STFDM3NRQmZ2bTlO?=
 =?utf-8?B?YUlGSTVsSTBxZWxlTUZqN2hXMXlHcG53MmV3eTNVdHRoQjF0VGUwU016Y21I?=
 =?utf-8?B?QTdzUVhIS2duT2pRRGNUT1drcmxUQllFbFgwNDI4MytkNFA5ZGdDVmNWR2Ey?=
 =?utf-8?B?Y1Nqc2E0aDVKWGdzQWtGYXZ0NWJjZU5ILy8vS3U0NklzZzdFT2oyS2h5MXVQ?=
 =?utf-8?B?OFdwVmxlUWZMN0Y2eEIvcWt4RmRKK1ExeVM2djQ4blY0ZU1FWlZ6NENIWEZz?=
 =?utf-8?B?dWNmdW5pOWh1eEpjM0l1QUE5QTViZUpXTFdZZmcxL1B2bDZJZGZONDRobW5X?=
 =?utf-8?B?WWNWM2JHTkZCTXA3R1ZMRDlFVUJjT0xadG9ISHZtdUpuV1ZqMWptWWFxd2VU?=
 =?utf-8?B?aFZnNzRtZEtHMWE2dzkvTFc3dGR4S1hadFh6bCtZZGljaGhsRkZwVlBneUZu?=
 =?utf-8?B?NDIraHRPT0k4enJqaVR1MWtrbTFVeVFJTDFCV2t0bU9DVnFYeFBPUEZYZ3RQ?=
 =?utf-8?B?ejFNSE1ZeHIxMWZYeWpTM0lNOTJUQ0FlNTBCcVVaNGJXZnpEZ2xXb3dHeDFz?=
 =?utf-8?B?MjhkYWNSTHNOaExFZFIwMzZ0UU1Qa3RWWTdHd3BHcGxRclNOSWNYd1JFREM5?=
 =?utf-8?B?TTF4L2ZZcWFsakZJMlF0K2RDK01ZMHppZ1kvQS9aNFZHTzExandLaWwrREh2?=
 =?utf-8?Q?XDnY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXU3Y1NOblBma05XRHdKc1BWQlFJOHlUSTZzRzhsNFFlMnVpaU83a0JreEVr?=
 =?utf-8?B?WTQzbjdObWY0Uzl1RkFOU0NhS0s1anZSVW44dEs4MWVDMnVQUE1TaWVBVU1N?=
 =?utf-8?B?NTlMbFg3RUtWbEoxQXhpQ0NsYTVVOXgvMmFwZXZRY2d6a2krQjdjM3hZRFVM?=
 =?utf-8?B?azlmUEZHWUQxZ051TzNQUGhvQU50dG9VTEhxVHhsRkpZNE0veEZnanBwYkpM?=
 =?utf-8?B?Qk1lTW1sU2hTVXl0RTVJVDNwVXBEUkRndDlFOFlsZ0RRMFhLdWFEOU5tMnVI?=
 =?utf-8?B?NFQxRDBtMk1UWTdnL2FSOGpCRjRCalJkUFFvdWlSYXNtWG16NVNpdUE2RnRl?=
 =?utf-8?B?OWtHT3hWeGV0OHp1cDRDVjFVaGtudU5KMWptVDRrSWFsS2VFMTFnL3JWV1Ru?=
 =?utf-8?B?Y2wySGxGcmR2Vi9rMXlCS2Zxa2crVThPbDN5dGJhaHVrNDZkV0MveEtac3FQ?=
 =?utf-8?B?NXdITG1rZG5vOUtnNnRJYUk1ZldjYkZQdVFWUVVWNGhiL2lOckVNYzY2ZnMz?=
 =?utf-8?B?aFJPelVpTTE1cTFnZXJWbGNUdTJzK2pYRUlWOUltb3IzdXpKTThDMzBHdnZz?=
 =?utf-8?B?NzRMQ3RzVWtwZkdQbTVRT25aak9uNDd0MVJ3bXpRZVVxb3NwUWtwUTY3M1Nt?=
 =?utf-8?B?OFhwbU5KVEExaE1NRE82MUVaLzJXdkZYbm9Zb1FWMXpHUEd1cEh2RVNaSVpk?=
 =?utf-8?B?OXltSnRSNDlNcElRVldiK2wvelgrSjd1ZFlUZHJyb2lmTHBkdmMzc1ZCQ1NZ?=
 =?utf-8?B?RkF0bExpZWIvbVZYT0Y0ZzQrdEpvWUlqbk9OVjluR1hJQnZQV1MwcUNWODcr?=
 =?utf-8?B?OXZGOFBUVll6NHVFek5kVGkyRUx4Vnp6aXhtN21sSzZ0dDk0MEJUVzY0dmsw?=
 =?utf-8?B?YWtRVUJGMkRoQnJyRTZXeG5OZWFBMjlCdzZTd2pBcEl1UDhQMTJJejhyQ2FV?=
 =?utf-8?B?cjBpUjdWU081aUR5MHVNbFQwYU9ramtjQ016ZFJ4VERtaCtYQWlQZXJXeE8v?=
 =?utf-8?B?UWpBZXNnckVpdDV5RFlkWDhQOHpiYjJuV3RIT0t0djFrdFZIVldhK2tXMUw4?=
 =?utf-8?B?dkpCYjcxcjFJb0tWYTJQdmI5ZFYwczk2UTZrQk9kUmVnS1I4Njc0clJWNkIz?=
 =?utf-8?B?T1I3emNaZXVaR0lJOUtIVFlYYXBEWEl5enk2MUtzSWp0dXlKbDVjWUN0UWFi?=
 =?utf-8?B?OTZINU5QUG9FNlVsQ00wVXBDZXhNdDhvUzBOMnBKZkJVdjducjVzVEZKWkxa?=
 =?utf-8?B?dlBZUmZLU1pQcGR2WlNuZDZCU2hJWHp3TWhGWEpWQ2lOc2trdXpRSUwvM3Rw?=
 =?utf-8?B?bTlLeXJIdm1RTk05VHlRaHN3NlgxMFI4aXVYaFZRKzBBRXJIVHlNMkJzcXV4?=
 =?utf-8?B?VFYreTZIOTFGdGhJdm5sN2hNM3NmMEVyWWl5am03VGFraFpGNTVKbzhZcjR3?=
 =?utf-8?B?Mk81aWFkaUhSL211ZVpOOGdjeXBJN0lFQ00vNG5mM0VPaEtNenFtMkZEdXZL?=
 =?utf-8?B?QVdiRVF5K3JHNEZiYW5ESEVoZ0I1bWlMVitLMXVrTmdrSXpKM2szRmlnSnpX?=
 =?utf-8?B?U2dYWnhrREkxUzl4NkNBQmxzQjZwWlErSFNvOHlVT0xIOFFHaklDK21oUDFu?=
 =?utf-8?B?SkF2ZTJHdVdMd1VuNHVNUUxTeXo2RXIwOEpEOE9pbnRJR2xnbmtZUWlRWDVx?=
 =?utf-8?B?TlVDNXkwSXUrOGxZWllySlM0RXRLaEY0NEw0TVpXRmlIK2kvNGQzcG84WnB0?=
 =?utf-8?B?Z3RwZkZxWWVPNWZZTjRZb0lISHZ1bDJuWVY4dGVId2dnN2ZoTDJnajgxTXFn?=
 =?utf-8?B?c1U5K1U5ZWUydUxoTWNqVTZWWm9YQ1BjdDBUY0dickRkemw4MExYMjAyS1Nn?=
 =?utf-8?B?eVowSUVEamJ2MUVsbXVURlkwdG54RitoM1NucXJidzBZVHl5NEFYLzNoK1o3?=
 =?utf-8?B?Q2RwMWwzTVhBekdvUmxzRVlheDcvNWtCcnVVMnZwMlhlNXFUTDh6cldMczAw?=
 =?utf-8?B?M3l5YlVtTHBBNHREeldaYWRwNXFuc0tGVnJoY2M2TmhuejFjSC9hVlRQajh4?=
 =?utf-8?B?MFdUZ3lmOGVvbXNYQUVmWTNpQm1sSG1kdkV5YldxZi95WmRaTnhyNGNmSnJU?=
 =?utf-8?B?N09sTm9PUHpYYWVLMEl0Z29XQldiZ2xDcnQ4OFhpenNJZFJyZXdWczhITzRP?=
 =?utf-8?B?OGh6dUV4cTA4NGtEZVVQbzlwU1RSdHdtK2h0dnZ3ZlhVQXlqSzRPQ2RHWHZF?=
 =?utf-8?B?dkZtcVhMdGFFQkZ4eVpwU1lWOUc4WC9wM0t0Q1FpblZQdS9yakRtbzdqMzVD?=
 =?utf-8?B?REUzTlpVZkNPZGNpK21ZakxDN0lDbnp6U2EvajZBQUkyTUVBbm8zUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d5ed44-c988-416c-8cee-08de6fcbf417
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:31:29.8737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3RKTRYeBSOwRHrbPKknFqb76NEHc3i3kpItjmaEpxoxIzvFSPkqSk6aifBMdHbZKVoinDeeSECGAYVEP6Msjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9437
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 1C8251602B9
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 12:18:06PM +0900, Alexandre Courbot wrote:
> Patches 1 and 2 have the exact same commit log, but each one does only
> part of it. Let's only keep the part of the log that applies to each
> patch.

Good catch, will differentiate the commit logs for part one and part
two.

> > +F:	drivers/gpu/drm_buddy.c
>
> This line should be `drivers/gpu/drm/drm_buddy.c`.

Good catch, will fix.

> These files have been moved in patch 1, so their MAINTAINERS entry
> should also be modified there.

Right, I'll move the MAINTAINERS changes to the appropriate patch
where the files are actually moved.

Thanks,
Joel
