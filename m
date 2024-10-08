Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C20993C8A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 03:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE2310E44A;
	Tue,  8 Oct 2024 01:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G+uJrtzP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0309110E0F5;
 Tue,  8 Oct 2024 01:56:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVy5DTi91J2qoHHS7BQHpsEb22Yyvuvn73SgYYeWq38tYQldNIcvnuWe8H0G+eDiTYNfKqb3HZ9+Q2/B0i6I4dPQGHV/54TDKmjUmiHXfMl1u4V/uFqv8UwspYVeVwcJ/YKkR5hVCUqjWbo9BV/LYzSVvs0N90hn0QKpgIH/b1/0wmBEhB0WUxAD8Fa2VhyN+uneBioEXjiyUUgY9sMSkY+OKGIudqDBBduiQS27Dw4fujthb56HAObkjsi2hAeHkXAD2f5rHlVTl6+9OBZqMAr9mbRIdpl7j64mtJiYCqwexlme/Dwas6SuaoQHOwMIyd2si7h/Cy2UQU/3PaxSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBud6PGWDJ1/Sn/n/FP/FETjfS/CQqJgof6eORgWf30=;
 b=n4V+QNUkkeBI0aIouPQixOdQyWNBUpSkj5vw8TMaBklBiNd+6/LrrBBk8CT0iU1DIe/eXj7sfaS20iWU1In0c+e/WDLv31JPybSgW9DuPUyUnCfs9bVGWO4iWa75jEK4+09bUvz37quy+O6bGU/cV2HADoDBueIMb9Ofoa1w1pbYWvi3ITsce0zgGbgn3tXKdr4yMQNSJVU8V0N7oT+aOneKB/jKpD5FZYiPly9RY2bPtCyIox7iGJYnrJzmc1yaN9T2TX8DqVlDivp2Wg8OBHtB0Yz/QTk9T6AylrPzvhlVWjnx11K2bgb+ZxLRXMA1cUEZ9Pz9WPKj2plIFDv0dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBud6PGWDJ1/Sn/n/FP/FETjfS/CQqJgof6eORgWf30=;
 b=G+uJrtzP2tvIjCQO82dHmErG+V35UmT6lDFyhUiS+0jN8C64PJ79KZ8JWifuWONJ+9hlf2ydiOJMYzvZ4J13jp3BPLONF2X1aJJTneVW2U1UXMSzHOxHhZHDa5Z/GiRH5Gu3+rvWSjOTJab0B8RJASHQThLgEoqSOSSp/dh0buc5VaPKv8+KFkFR6yfQajkMZKS+rL33shf5PnvSjhASPRfMH6ufOkTaOvT3NllUblWSyw6p1wyKBncrqYUSJK/W1Rp9T8Y7uPdeLWV2fLGDOGitAdwHUKnu9l5W1AaCJ6z4FLXIK1x1JZojGr69AAPyMchdZki/Qc0VAie9Kx9giw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MN6PR12MB8567.namprd12.prod.outlook.com (2603:10b6:208:478::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 01:56:36 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 01:56:35 +0000
References: <87mskehjtc.fsf@nvdebian.thelocal>
 <ZuS/NH/P8Fl+qptx@DUT025-TGLU.fm.intel.com>
 <87msk5our1.fsf@nvdebian.thelocal>
 <ece41917-2ea7-4571-83a5-a50c776c6587@amd.com>
 <Zu3n3MmtdlEDaXnF@DUT025-TGLU.fm.intel.com>
 <9a3e62e0-cb62-4d73-9694-7be8893f7206@amd.com>
 <Zu3wV9FJSTs1E5Vx@DUT025-TGLU.fm.intel.com>
 <ZvKnDT_bdx_PhAcG@phenom.ffwll.local>
 <ZvLr66F3VqpMyLlS@DUT025-TGLU.fm.intel.com>
 <ZvP3pWjVviMdezuy@phenom.ffwll.local>
 <ZvP79hb-0HJMvhv-@phenom.ffwll.local>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, Felix Kuehling
 <felix.kuehling@amd.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Philip.Yang@amd.com,
 akpm@linux-foundation.org, christian.koenig@amd.com
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
Date: Tue, 08 Oct 2024 12:33:51 +1100
In-reply-to: <ZvP79hb-0HJMvhv-@phenom.ffwll.local>
Message-ID: <87msjfcq7l.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY5P300CA0102.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:248::19) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MN6PR12MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: ce06b63a-54e5-4138-24ee-08dce73c70a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXJ5amxOb1ZvR1IrVWFjR1p1VmJLTzViQTlOMnBEWExHV1grd0VmdnZNaTUz?=
 =?utf-8?B?UWxkK2ZwU080NXVTRFViSEEzb01nTENGelc0dzluYllTZ01YbHJiTjkzRDFG?=
 =?utf-8?B?bkFrRmlkKzhJTWZRdmFuSFk4c1hKVE13VmhxOG1zRzJYYzcranMwM0xmNHNn?=
 =?utf-8?B?TE1ScThOb3daWEdsM3NsVEQ4RysrZUd2MGpRSWRTbEJncHFjWFFPbTZQdUdO?=
 =?utf-8?B?NkhBRUZMMm05aFVRYWlXSmRRVlVtZ2QzMTFOVW9YekgxTUNBQytOZVdWbVh4?=
 =?utf-8?B?Q2dJMVllcitMM1B3K0FvSnowWTR5N2c0UkNGSVh1UnJLb2x6ZUYrcmJSWHFr?=
 =?utf-8?B?djV2SGFINzVKSWVxQlBNWTJuYmRSVkhRUnhURDJLNTBGQWV0QjRaMUwycGhI?=
 =?utf-8?B?bjFpcXhHQVFCYzVRQXVLWUp3MUdzc3JKRHpYNk1YU25vODhJbnFKTzV6Vmtm?=
 =?utf-8?B?UFRaM1hSQXY3Z0krcTFtZGdLNG1aVWJuTlZVbkFIa1ZrTmo3VkVKOWEveDFP?=
 =?utf-8?B?bmswSW1aNUNiVFB1VVdIL1RjNHZGTU5uVVJmWUFybThXYVluZ3NZaFMrdWdS?=
 =?utf-8?B?Q25oR1FCRnlRNTNkeG0xMXJmUVp6ZXdTemwwdjkwamlFVGl3bnFxV0NoOG5t?=
 =?utf-8?B?RGQ4c1E3TkliSkVBa3V5QXdxSURhTXhaUEI3TzNzWlA1WjJBYTUxc2JnTGNF?=
 =?utf-8?B?c1hvQys0amxEaUtpM29kNXIyWDlScFFjKzF1VSs1RW1VSkNzUnlXbUliYkhO?=
 =?utf-8?B?MVNUUW03Qms4QThQcTBSRE5JamswVURqekMwWTVxcEI0R1VYcHBQVjEyblRr?=
 =?utf-8?B?MGcwT3FacE5lR29tcXY2T0VDbFlsNi9sWk8rYVRYQS83UlRRRkhpRzl5NUpk?=
 =?utf-8?B?ck1PalFDWkFzdU94d1FLQlg5dlJ2OFhLZXphK3Nna3NmeElWMm9wTXhZNlp5?=
 =?utf-8?B?a09DbGZCOVlyZkJjWVJqbEtrUHVEazczQUozdmg2MU5rY3h4OWVsNEg1OW93?=
 =?utf-8?B?TlkvTlNqRXgrWlVNNWZyNTNTRHBLYXQ3ZkNlSk1yb0tqRDRaL2JlZ1NCVFBo?=
 =?utf-8?B?WVJKVU42emtpRWNhVTRSRTRYVTF6N0x5SHNTb0VzS3JjbElXUGVXMHdtV3h3?=
 =?utf-8?B?TmhxUVVzcDJIMGp2ZldQZnoxWHp2Y0pZeFJHOW5vNndtUkZjNWpOdzJOalBk?=
 =?utf-8?B?amFYbXRTd1g2U1BDQ1BjZWpNb3hNZldublZEV0t1RFQ4dEZDR290N0dRNDR0?=
 =?utf-8?B?L2kySEU5MUZ5d3FXSURCY0Q2Q3pEVVdQYk51a29WcWsxeWkxajRGT1dtMzIz?=
 =?utf-8?B?bFhpY0c4WnVEVFRVYUE4dmtzQU92TWlob3JqNlI5ZTI4c085MFNUL24zbk1q?=
 =?utf-8?B?a3BBeFFCR0N1WjkveEJrS2ZsZnkvNVdkWXpoYnM4aHlyQmVoeGRlajF1WGdJ?=
 =?utf-8?B?NkIwbUJsUXBvdnBPSS9QQ2Y2dVZPdjNuaWlBQXN5T3A4eG1yV1Z4Qks0Qzdq?=
 =?utf-8?B?SkM0eDlxeEZEc3NCdmxXRGtrMlR0ZXNSL3ZJWnQ0bG1OdFlveXU3TTUxeTNa?=
 =?utf-8?B?aFdKd09RakRxODZGSGFXQW1YcURGNDZuREM0cTNhRzVHdzhSOUNoYm9vZjNn?=
 =?utf-8?B?ZEZpem5sU2NQM0NjK0ZNQkFKemoyK3d0aU9UYllYL05QaXUwRXpjanNXNSt0?=
 =?utf-8?B?bkU4QVkyZnZ3dnc2NUxzVmgxM2VvSy9wVWE1TVZpSDJ5RTVTcmwyZ0ZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0ZlVWN1TzQ1YVNBQks3c1dKY0RhZjVsUnRvRkcvdFJwLzF4ZTRwREViK1BS?=
 =?utf-8?B?MlVyOUVoWEZBTlpSTzlucXdBN1ZBNlNENmVrd3N5blVLdkNFcGhHdUVNKzMz?=
 =?utf-8?B?ZDUwaUtlY2FZZ1FndW5DMU0zZ1ljMFY1cTVoa1U4dEs2elhQQXFEUjhpMjdE?=
 =?utf-8?B?YVV3SE9RRXNMTmczTjZHSUVRVFRUdHNqSDczNnd3RVFmZG9Ob0pDQ05IMTR4?=
 =?utf-8?B?NjNQdnFUMStBbmVIcHAvQmZsVmtBdUwyUHZrWXdDUjVSVUtFUTRRMVp2UU44?=
 =?utf-8?B?THgxSjJvUjJoenVTUHBDSWdReWQ4TTBQQVNOSkJ6WVhsSnlHZnRrdmFmL2tv?=
 =?utf-8?B?dHhWZm40U1ZVZlN0N0h3QWVZSmJOek1jaDEraFVRb1JKZUJTRUJKTWw2UGd3?=
 =?utf-8?B?OUxIQ0VlZXNrM0NUc2o0WEE2Vk9xRk5EcGpGL3FiNFJhdlZkL0ttdzdtdEFv?=
 =?utf-8?B?VkRSOXpIQUlnRW5xeVdyeG0vaVJiVUI3ckpGYVI3YkNmcUxWMmxTZnU5eVpR?=
 =?utf-8?B?TWdWWjFsbi9EeHptV0ppV0Q4VkQwQ3VLaU5ldW44Z0d1Ujh0N29QWmYvWSth?=
 =?utf-8?B?SllHKzAvRHpiai9BenhHWjY1bXJnMzU2elF3Tm9qb21GdU1YYmdpL3VZbFFi?=
 =?utf-8?B?MWlXbHBqNXY2MXU5SGlBaTc2bWZGb2h5bkxWSWJaUGJkTGNEMG5OTHFiM2E1?=
 =?utf-8?B?WFVhMlM0VDF4aVY5MkY2RVBHTHVNR0xwSElSb1RtdTdNMm5SbmZ5Zk1TRzFw?=
 =?utf-8?B?L3hqZEIrejBlQWQ3dmJNNnB6V2oyN1BBbWJTMjNaTFV2dUhFWDd1UnRzbTVa?=
 =?utf-8?B?UlpsZTJZVXdMRWtzLzRSeGQxMnJaUWw2U2hqaXA1Um9ldUgxR1draENCVkJG?=
 =?utf-8?B?WUVCVWhHazI4YnQ0QU5ycTUvaU9mZjNvTmdBN3pFMThyemF2VWtTRlVwL0xh?=
 =?utf-8?B?K0k4RXcvMDd4anJIWFlXTnA3Q2dTaE9vdnRUNkJvMkc4cTBLZlprU1dNeWdS?=
 =?utf-8?B?UTRTQVhISDVEWlg1YkRLVTBERmpCWWZDd25nMWl6NWl4ME8yb0pvd2VONnRP?=
 =?utf-8?B?YVRvaUtSRk9CQlFJRUQ3OEVTakZaOUg0TnhJdFAzRU03TmR3WWdmMjhjR0Iw?=
 =?utf-8?B?bXpZVXdpZEpxeExjUXBzMHhXM2s1dWpsVU9HOW1CbldDRDFDelRPTkZwZGFr?=
 =?utf-8?B?Wjg0NFVuWTdqaG5vaFk4S09kS05TcUFpS0xjNmxxVEtDamdrRm5HVmx6WEcz?=
 =?utf-8?B?SC9lcWxidnJFYmgvZzZlNWdkSFB2UnRNUThXQWZmZWtDMnpWdUpMVlZuNGZv?=
 =?utf-8?B?REw1YmVQcUg3TnVSY0tlc2lSRFJ4THU3aTlVQUJ0ZExvdm9JdnUzaHF0bkRm?=
 =?utf-8?B?ZktmRlVQZEdidXhzU1QvbGpnSitYYnhmT0Y1MnVseXgxN0NPSWk2eGx5ZmVu?=
 =?utf-8?B?VXZxdXhuSjdJSEp3MUdDREtuc0QxQld3SEhuUktHNGNHYlhQcHZXK0JjZGZz?=
 =?utf-8?B?MkdxQXBocUcwdkErUm5xOHNDUnJyZDk5UGpvbFAvU1hnMDNCT1JuY1ZiK0Jr?=
 =?utf-8?B?anBlRHJ4TDR1dWcxeTFEZmdlNEdSa3ZRTDUrYkdkN2xGdjRGSDNBVDFTN3Jw?=
 =?utf-8?B?VUp6cEpSMnd3TXE5NkJjREpibXpyakNGdkk4UUxSOGVXZ25yc0R0ZVBIK1lD?=
 =?utf-8?B?RFlJS2lyeUxmaFN3U3ZYTnY1QS9PUXY0MHpLcnNQaDdWTnRIb2JYbmZMc2pS?=
 =?utf-8?B?OENhOFNiblNIbVNsbWtrQU9RUWNLYmR2UkZjTVVjRWV5amZIKzhJOFZtazk3?=
 =?utf-8?B?NG9rWmNyRkF5aU84Q3JFZi9zK2tJZVFpRUhjSVlWOUlSczRUQmZLQmFvR3do?=
 =?utf-8?B?VVJYME45T1FGblNkbXpNU1lOSEV0OVFsd3ZrdjIwTFcrTTl2ZGZZM2gxVkgy?=
 =?utf-8?B?NkNkMFh1TmwxUWVGcTVEb2Q3V3lpVExIcHBIcDNtZzNZS21jb0hjTmxPdVhN?=
 =?utf-8?B?aFNWeTFleVVJSjQ3MktnTmxnaldEa3d6SWR3bXJILzIyM0JEMGlUaktLcm9m?=
 =?utf-8?B?MTNLRy82ekNyaGtXTTBvYnFBTjliSkJHUzJhL3R2cWdQa09haU1Oc1gxRVV6?=
 =?utf-8?Q?aZDAyK6da4omhBpXYdYd4M7Mj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce06b63a-54e5-4138-24ee-08dce73c70a3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 01:56:35.6740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmuKPo8fLCQgo05l5xTKuBSMml9ohYbOoCC58rEFoj9PNK/YOOReK+hwp2x1yIXPzrOX76QofrJF47ac9wfj4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8567
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


Simona Vetter <simona.vetter@ffwll.ch> writes:

> On Wed, Sep 25, 2024 at 01:44:37PM +0200, Simona Vetter wrote:
>> On Tue, Sep 24, 2024 at 04:42:19PM +0000, Matthew Brost wrote:
>> > On Tue, Sep 24, 2024 at 01:48:29PM +0200, Simona Vetter wrote:
>> > > On Fri, Sep 20, 2024 at 09:59:51PM +0000, Matthew Brost wrote:
>> > > > On Fri, Sep 20, 2024 at 05:50:10PM -0400, Felix Kuehling wrote:
>> > > > >=20
>> > > > > On 2024-09-20 17:23, Matthew Brost wrote:
>> > > > > > On Fri, Sep 20, 2024 at 04:26:50PM -0400, Felix Kuehling wrote=
:
>> > > > > > > On 2024-09-18 11:10, Alistair Popple wrote:
>> > > > > > > > Matthew Brost <matthew.brost@intel.com> writes:
>> > > > > > > >=20
>> > > > > > > > > On Wed, Sep 11, 2024 at 02:53:31PM +1000, Alistair Poppl=
e wrote:
>> > > > > > > > > > Matthew Brost <matthew.brost@intel.com> writes:
>> > > > > > > > > >=20
>> > > > > > > > > > I haven't seen the same in the NVIDIA UVM driver (out-=
of-tree, I know)
>> > > > > > > > > Still a driver.
>> > > > > > > > Indeed, and I'm happy to answer any questions about our im=
plementation.
>> > > > > > > >=20
>> > > > > > > > > > but theoretically it seems like it should be possible.=
 However we
>> > > > > > > > > > serialize migrations of the same virtual address range=
 to avoid these
>> > > > > > > > > > kind of issues as they can happen the other way too (i=
e. multiple
>> > > > > > > > > > threads trying to migrate to GPU).
>> > > > > > > > > >=20
>> > > > > > > > > > So I suspect what happens in UVM is that one thread wi=
ns and installs
>> > > > > > > > > > the migration entry while the others fail to get the d=
river migration
>> > > > > > > > > > lock and bail out sufficiently early in the fault path=
 to avoid the
>> > > > > > > > > > live-lock.
>> > > > > > > > > >=20
>> > > > > > > > > I had to try hard to show this, doubt an actual user cou=
ld trigger this.
>> > > > > > > > >=20
>> > > > > > > > > I wrote a test which kicked 8 threads, each thread did a=
 pthread join,
>> > > > > > > > > and then tried to read the same page. This repeats in lo=
op for like 512
>> > > > > > > > > pages or something. I needed an exclusive lock in migrat=
e_to_ram vfunc
>> > > > > > > > > for it to livelock. Without an exclusive lock I think on=
 average I saw
>> > > > > > > > > about 32k retries (i.e. migrate_to_ram calls on the same=
 page) before a
>> > > > > > > > > thread won this race.
>> > > > > > > > >=20
>> > > > > > > > >   From reading UVM, pretty sure if you tried hard enough=
 you could trigger
>> > > > > > > > > a livelock given it appears you take excluvise locks in =
migrate_to_ram.
>> > > > > > > > Yes, I suspect you're correct here and that we just haven'=
t tried hard
>> > > > > > > > enough to trigger it.
>> > > > > > > >=20
>> > > > > > > > > > > Cc: Philip Yang <Philip.Yang@amd.com>
>> > > > > > > > > > > Cc: Felix Kuehling <felix.kuehling@amd.com>
>> > > > > > > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> > > > > > > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
>> > > > > > > > > > > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch=
>
>> > > > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.co=
m>
>> > > > > > > > > > > ---
>> > > > > > > > > > >    mm/memory.c         | 13 +++++++---
>> > > > > > > > > > >    mm/migrate_device.c | 60 ++++++++++++++++++++++++=
+++++++--------------
>> > > > > > > > > > >    2 files changed, 50 insertions(+), 23 deletions(-=
)
>> > > > > > > > > > >=20
>> > > > > > > > > > > diff --git a/mm/memory.c b/mm/memory.c
>> > > > > > > > > > > index 3c01d68065be..bbd97d16a96a 100644
>> > > > > > > > > > > --- a/mm/memory.c
>> > > > > > > > > > > +++ b/mm/memory.c
>> > > > > > > > > > > @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(stru=
ct vm_fault *vmf)
>> > > > > > > > > > >    			 * Get a page reference while we know the page=
 can't be
>> > > > > > > > > > >    			 * freed.
>> > > > > > > > > > >    			 */
>> > > > > > > > > > > -			get_page(vmf->page);
>> > > > > > > > > > > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
>> > > > > > > > > > > -			ret =3D vmf->page->pgmap->ops->migrate_to_ram(vm=
f);
>> > > > > > > > > > > -			put_page(vmf->page);
>> > > > > > > > > > > +			if (trylock_page(vmf->page)) {
>> > > > > > > > > > > +				get_page(vmf->page);
>> > > > > > > > > > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>> > > > > > > > > > This is all beginning to look a lot like migrate_vma_c=
ollect_pmd(). So
>> > > > > > > > > > rather than do this and then have to pass all this con=
text
>> > > > > > > > > > (ie. fault_page) down to the migrate_vma_* functions c=
ould we instead
>> > > > > > > > > > just do what migrate_vma_collect_pmd() does here? Ie. =
we already have
>> > > > > > > > > > the PTL and the page lock so there's no reason we coul=
dn't just setup
>> > > > > > > > > > the migration entry prior to calling migrate_to_ram().
>> > > > > > > > > >=20
>> > > > > > > > > > Obviously calling migrate_vma_setup() would show the p=
age as not
>> > > > > > > > > > migrating, but drivers could easily just fill in the s=
rc_pfn info after
>> > > > > > > > > > calling migrate_vma_setup().
>> > > > > > > > > >=20
>> > > > > > > > > > This would eliminate the whole fault_page ugliness.
>> > > > > > > > > >=20
>> > > > > > > > > This seems like it would work and agree it likely be cle=
aner. Let me
>> > > > > > > > > play around with this and see what I come up with. Multi=
-tasking a bit
>> > > > > > > > > so expect a bit of delay here.
>> > > > > > > > >=20
>> > > > > > > > > Thanks for the input,
>> > > > > > > > > Matt
>> > > > > > > Thanks! Sorry, I'm late catching up after a vacation. Please=
 keep Philip,
>> > > > > > > Christian and myself in the loop with future patches in this=
 area.
>> > > > > > >=20
>> > > > > > Will do. Already have another local patch set which helps driv=
ers dma
>> > > > > > map 2M pages for migrations if SRAM is physically contiguous. =
Seems
>> > > > > > helpful for performance on Intel hardware. Probably post that =
soon for
>> > > > > > early feedack.
>> > > > >=20
>> > > > > OK.
>> > > > >=20
>> > > > >=20
>> > > > > >=20
>> > > > > > Longer term I thinking 2M migration entries, 2M device pages, =
and being
>> > > > > > able to install 2M THP on VRAM -> SRAM could be really helpful=
. I'm
>> > > > > > finding migrate_vma_* functions take up like 80-90% of the tim=
e in the
>> > > > > > CPU / GPU fault handlers on a fault (or prefetch) which doesn'=
t seem
>> > > > > > ideal. Seems like 2M entries for everything would really help =
here. No
>> > > > > > idea how feasible this is as the core MM stuff gets confusing =
fast. Any
>> > > > > > input on this idea?
>> > > > >=20
>> > > > > I agree with your observations. We found that the migrate_vma_* =
code was the
>> > > > > bottle neck for migration performance as well, and not breaking =
2M pages
>> > > > > could reduce that overhead a lot. I don't have any specific idea=
s. I'm not
>> > > > > familiar with the details of that code myself. Philip has looked=
 at this
>> > > > > (and some old NVidia patches from a few years ago) in the past b=
ut never had
>> > > > > enough uninterrupted time to make it past prototyping.
>> > > > >=20
>> > > >=20
>> > > > Cool good to know this isn't some crazy idea. Doubt it happen anyt=
ime
>> > > > soon as I need to get a working baseline in before anything then s=
tart
>> > > > applying optimizations and help in get other features to get the d=
esign
>> > > > complete. But eventually will probably try to look at this. May pi=
ng
>> > > > Philip and Nvidia when I have time to dig in here.

Apologies for my late reply here, I have just returned from vacation.

We (Nvidia) are actively looking at this as we have the same bottle
necks. Mostly I've been doing some clean-ups in MM to make compound
ZONE_DEVICE pages possible.

>> > >=20
>> > > I think the big step will be moving hmm.c and migrate.c apis over fr=
om
>> > > struct page to folios. That should also give us some nice benefits o=
n the
>> > > gpu side, since instead of 4k pages to track we could allocate 2m gp=
u
>> > > pages.
>> > >=20
>> >=20
>> > I think was thinking just encode the order in the migration PFN like H=
MM
>> > does. Really only Nth order entry in the page array needs to be
>> > populated then - HMM populates every entry though which doesn't seem
>> > like that is required. Maybe having a folio API makes more sense?
>>=20
>> Both I'd say, as a first attempt at least. An array of folios, but only
>> populate the ones we need and jump over empty entries. A bit wasteful, b=
ut
>> eh it's just allocations.
>
> Ok thought some more, I think there's two things going on:
>
> - spot contig memory sections so that the gpu side is more efficient and
>   can user bigger pagetables and stuff like that. this is what
>   hmm_range_fault does.
>
> - optimize the core mm book-keeping by working on folios instead of
>   individual pages. hmm_range_fault does not care because it doesn't grab
>   references or lock pages or do anything else interesting with them, the
>   entire synchronization is provided by mmu notifier retry loops. But the
>   migration code does do a lot of expensive stuff, so it would need that.
>   For hmm_range_fault it's probably not so important, so maybe we could
>   leave the folio conversion of that to later.
>
> I think we need both, meaning:
> - switch to folio, leave out entries as NULL for compound folios
> - on top of compoung folios still track contig ranges so that the gpu sid=
e
>   can additionally benefit when e.g. 2M pages are split into smaller
>   folios but happen to be contig

Definitely I think the folio approach makes sense and I was prototpying
a series to allow compound device private pages and to migrate
them. However I got caught up on similar questions around migrate_vma_*
API (specifically around whether to allow splitting/merging) so never
got around to posting them. Probably the simple array based approach
makes sense though.

In any case to get something like that merged I'd been asked if we could
fix the ZONE_DEVICE refcounting mess for DAX (as it was the only one
still relying on the off-by-one refcounts for compound pages). The good
news is that series[1] is getting close to merged, and as a side-effect
it allows for compound ZONE_DEVICE pages so extending it to
DEVICE_PRIVATE pages to allow THP migration shouldn't be too difficult
and was going to be my next step once this was merged. So it's nice to
know other people might care about this too.

[1] - https://lore.kernel.org/linux-mm/cover.9f0e45d52f5cff58807831b6b86708=
4d0b14b61c.1725941415.git-series.apopple@nvidia.com/

> Cheers, Sima
>
>>=20
>> > > Once we have folios at the driver/core mm api level doing all the fa=
ncy
>> > > thp stuff should be at least a well-contained problem. But I might b=
e
>> > > dellusionally optimistic here :-)
>> >=20
>> > I think it contained in the sense is the DRM SVM layer just allocates =
a
>> > THP or large continous device memory and hands it off to migrate layer
>> > and that layer does the right thing. The 'right thing' here I believe =
is
>> > a decent amount of core MM work though.
>>=20
>> Yeah that's what I meant, once we have switched the interfaces to be
>> arrays of folios, where for larger folios we leave the entries in betwee=
n
>> NULL and have some appropriate iterators, then the driver side is done
>> mostly.  The core mm side to actually make use of that will be fairly
>> gnarly though.
>> -Sima
>>=20
>> >=20
>> > Matt
>> >=20
>> > > -Sima
>> > >=20
>> > > >=20
>> > > > Matt
>> > > >=20
>> > > > > Regards,
>> > > > > =C2=A0 Felix
>> > > > >=20
>> > > > >=20
>> > > > > >=20
>> > > > > > Matt
>> > > > > >=20
>> > > > > > > Regards,
>> > > > > > >  =C2=A0 Felix
>> > > > > > >=20
>> > > > > > >=20
>> > > > > > > > > > > +				ret =3D vmf->page->pgmap->ops->migrate_to_ram(v=
mf);
>> > > > > > > > > > > +				put_page(vmf->page);
>> > > > > > > > > > > +				unlock_page(vmf->page);
>> > > > > > > > > > > +			} else {
>> > > > > > > > > > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>> > > > > > > > > > > +			}
>> > > > > > > > > > >    		} else if (is_hwpoison_entry(entry)) {
>> > > > > > > > > > >    			ret =3D VM_FAULT_HWPOISON;
>> > > > > > > > > > >    		} else if (is_pte_marker_entry(entry)) {
>> > > > > > > > > > > diff --git a/mm/migrate_device.c b/mm/migrate_device=
.c
>> > > > > > > > > > > index 6d66dc1c6ffa..049893a5a179 100644
>> > > > > > > > > > > --- a/mm/migrate_device.c
>> > > > > > > > > > > +++ b/mm/migrate_device.c
>> > > > > > > > > > > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd=
(pmd_t *pmdp,
>> > > > > > > > > > >    				   struct mm_walk *walk)
>> > > > > > > > > > >    {
>> > > > > > > > > > >    	struct migrate_vma *migrate =3D walk->private;
>> > > > > > > > > > > +	struct folio *fault_folio =3D migrate->fault_page =
?
>> > > > > > > > > > > +		page_folio(migrate->fault_page) : NULL;
>> > > > > > > > > > >    	struct vm_area_struct *vma =3D walk->vma;
>> > > > > > > > > > >    	struct mm_struct *mm =3D vma->vm_mm;
>> > > > > > > > > > >    	unsigned long addr =3D start, unmapped =3D 0;
>> > > > > > > > > > > @@ -88,11 +90,13 @@ static int migrate_vma_collect_p=
md(pmd_t *pmdp,
>> > > > > > > > > > >    			folio_get(folio);
>> > > > > > > > > > >    			spin_unlock(ptl);
>> > > > > > > > > > > -			if (unlikely(!folio_trylock(folio)))
>> > > > > > > > > > > +			if (unlikely(fault_folio !=3D folio &&
>> > > > > > > > > > > +				     !folio_trylock(folio)))
>> > > > > > > > > > >    				return migrate_vma_collect_skip(start, end,
>> > > > > > > > > > >    								walk);
>> > > > > > > > > > >    			ret =3D split_folio(folio);
>> > > > > > > > > > > -			folio_unlock(folio);
>> > > > > > > > > > > +			if (fault_folio !=3D folio)
>> > > > > > > > > > > +				folio_unlock(folio);
>> > > > > > > > > > >    			folio_put(folio);
>> > > > > > > > > > >    			if (ret)
>> > > > > > > > > > >    				return migrate_vma_collect_skip(start, end,
>> > > > > > > > > > > @@ -192,7 +196,7 @@ static int migrate_vma_collect_p=
md(pmd_t *pmdp,
>> > > > > > > > > > >    		 * optimisation to avoid walking the rmap later=
 with
>> > > > > > > > > > >    		 * try_to_migrate().
>> > > > > > > > > > >    		 */
>> > > > > > > > > > > -		if (folio_trylock(folio)) {
>> > > > > > > > > > > +		if (fault_folio =3D=3D folio || folio_trylock(fol=
io)) {
>> > > > > > > > > > >    			bool anon_exclusive;
>> > > > > > > > > > >    			pte_t swp_pte;
>> > > > > > > > > > > @@ -204,7 +208,8 @@ static int migrate_vma_collect_p=
md(pmd_t *pmdp,
>> > > > > > > > > > >    				if (folio_try_share_anon_rmap_pte(folio, page=
)) {
>> > > > > > > > > > >    					set_pte_at(mm, addr, ptep, pte);
>> > > > > > > > > > > -					folio_unlock(folio);
>> > > > > > > > > > > +					if (fault_folio !=3D folio)
>> > > > > > > > > > > +						folio_unlock(folio);
>> > > > > > > > > > >    					folio_put(folio);
>> > > > > > > > > > >    					mpfn =3D 0;
>> > > > > > > > > > >    					goto next;
>> > > > > > > > > > > @@ -363,6 +368,8 @@ static unsigned long migrate_dev=
ice_unmap(unsigned long *src_pfns,
>> > > > > > > > > > >    					  unsigned long npages,
>> > > > > > > > > > >    					  struct page *fault_page)
>> > > > > > > > > > >    {
>> > > > > > > > > > > +	struct folio *fault_folio =3D fault_page ?
>> > > > > > > > > > > +		page_folio(fault_page) : NULL;
>> > > > > > > > > > >    	unsigned long i, restore =3D 0;
>> > > > > > > > > > >    	bool allow_drain =3D true;
>> > > > > > > > > > >    	unsigned long unmapped =3D 0;
>> > > > > > > > > > > @@ -427,7 +434,8 @@ static unsigned long migrate_dev=
ice_unmap(unsigned long *src_pfns,
>> > > > > > > > > > >    		remove_migration_ptes(folio, folio, false);
>> > > > > > > > > > >    		src_pfns[i] =3D 0;
>> > > > > > > > > > > -		folio_unlock(folio);
>> > > > > > > > > > > +		if (fault_folio !=3D folio)
>> > > > > > > > > > > +			folio_unlock(folio);
>> > > > > > > > > > >    		folio_put(folio);
>> > > > > > > > > > >    		restore--;
>> > > > > > > > > > >    	}
>> > > > > > > > > > > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct mig=
rate_vma *args)
>> > > > > > > > > > >    		return -EINVAL;
>> > > > > > > > > > >    	if (args->fault_page && !is_device_private_page(=
args->fault_page))
>> > > > > > > > > > >    		return -EINVAL;
>> > > > > > > > > > > +	if (args->fault_page && !PageLocked(args->fault_pa=
ge))
>> > > > > > > > > > > +		return -EINVAL;
>> > > > > > > > > > >    	memset(args->src, 0, sizeof(*args->src) * nr_pag=
es);
>> > > > > > > > > > >    	args->cpages =3D 0;
>> > > > > > > > > > > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct =
migrate_vma *migrate)
>> > > > > > > > > > >    }
>> > > > > > > > > > >    EXPORT_SYMBOL(migrate_vma_pages);
>> > > > > > > > > > > -/*
>> > > > > > > > > > > - * migrate_device_finalize() - complete page migrat=
ion
>> > > > > > > > > > > - * @src_pfns: src_pfns returned from migrate_device=
_range()
>> > > > > > > > > > > - * @dst_pfns: array of pfns allocated by the driver=
 to migrate memory to
>> > > > > > > > > > > - * @npages: number of pages in the range
>> > > > > > > > > > > - *
>> > > > > > > > > > > - * Completes migration of the page by removing spec=
ial migration entries.
>> > > > > > > > > > > - * Drivers must ensure copying of page data is comp=
lete and visible to the CPU
>> > > > > > > > > > > - * before calling this.
>> > > > > > > > > > > - */
>> > > > > > > > > > > -void migrate_device_finalize(unsigned long *src_pfn=
s,
>> > > > > > > > > > > -			unsigned long *dst_pfns, unsigned long npages)
>> > > > > > > > > > > +static void __migrate_device_finalize(unsigned long=
 *src_pfns,
>> > > > > > > > > > > +				      unsigned long *dst_pfns,
>> > > > > > > > > > > +				      unsigned long npages,
>> > > > > > > > > > > +				      struct page *fault_page)
>> > > > > > > > > > >    {
>> > > > > > > > > > > +	struct folio *fault_folio =3D fault_page ?
>> > > > > > > > > > > +		page_folio(fault_page) : NULL;
>> > > > > > > > > > >    	unsigned long i;
>> > > > > > > > > > >    	for (i =3D 0; i < npages; i++) {
>> > > > > > > > > > > @@ -838,7 +842,8 @@ void migrate_device_finalize(uns=
igned long *src_pfns,
>> > > > > > > > > > >    		src =3D page_folio(page);
>> > > > > > > > > > >    		dst =3D page_folio(newpage);
>> > > > > > > > > > >    		remove_migration_ptes(src, dst, false);
>> > > > > > > > > > > -		folio_unlock(src);
>> > > > > > > > > > > +		if (fault_folio !=3D src)
>> > > > > > > > > > > +			folio_unlock(src);
>> > > > > > > > > > >    		if (is_zone_device_page(page))
>> > > > > > > > > > >    			put_page(page);
>> > > > > > > > > > > @@ -854,6 +859,22 @@ void migrate_device_finalize(un=
signed long *src_pfns,
>> > > > > > > > > > >    		}
>> > > > > > > > > > >    	}
>> > > > > > > > > > >    }
>> > > > > > > > > > > +
>> > > > > > > > > > > +/*
>> > > > > > > > > > > + * migrate_device_finalize() - complete page migrat=
ion
>> > > > > > > > > > > + * @src_pfns: src_pfns returned from migrate_device=
_range()
>> > > > > > > > > > > + * @dst_pfns: array of pfns allocated by the driver=
 to migrate memory to
>> > > > > > > > > > > + * @npages: number of pages in the range
>> > > > > > > > > > > + *
>> > > > > > > > > > > + * Completes migration of the page by removing spec=
ial migration entries.
>> > > > > > > > > > > + * Drivers must ensure copying of page data is comp=
lete and visible to the CPU
>> > > > > > > > > > > + * before calling this.
>> > > > > > > > > > > + */
>> > > > > > > > > > > +void migrate_device_finalize(unsigned long *src_pfn=
s,
>> > > > > > > > > > > +			unsigned long *dst_pfns, unsigned long npages)
>> > > > > > > > > > > +{
>> > > > > > > > > > > +	return __migrate_device_finalize(src_pfns, dst_pfn=
s, npages, NULL);
>> > > > > > > > > > > +}
>> > > > > > > > > > >    EXPORT_SYMBOL(migrate_device_finalize);
>> > > > > > > > > > >    /**
>> > > > > > > > > > > @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_fin=
alize);
>> > > > > > > > > > >     */
>> > > > > > > > > > >    void migrate_vma_finalize(struct migrate_vma *mig=
rate)
>> > > > > > > > > > >    {
>> > > > > > > > > > > -	migrate_device_finalize(migrate->src, migrate->dst=
, migrate->npages);
>> > > > > > > > > > > +	__migrate_device_finalize(migrate->src, migrate->d=
st, migrate->npages,
>> > > > > > > > > > > +				  migrate->fault_page);
>> > > > > > > > > > >    }
>> > > > > > > > > > >    EXPORT_SYMBOL(migrate_vma_finalize);
>> > >=20
>> > > --=20
>> > > Simona Vetter
>> > > Software Engineer, Intel Corporation
>> > > http://blog.ffwll.ch
>>=20
>> --=20
>> Simona Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

