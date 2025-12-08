Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C26CAC6F2
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 08:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D618510E3B9;
	Mon,  8 Dec 2025 07:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ij9vrB6X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E4E10E3B8;
 Mon,  8 Dec 2025 07:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkKMqMyeHy2AHShEzSduTGunserRP8c5xax8En6cwaOw1rR4aw14pySuuE1mBnjOInCDXBC9MbXifD/AHk+kvGy6yyDGLJE+Zpybx1vVsoKK+KXR/lujUIYZf37hVqRAp7K/a/d4UahIX4Ka0Lzt/UA0YVXgi4rf81JBr0E162Kn6Bxz6eO2Vdibn8lkPW+IHjye8yOsJ3XIi+utuGfOzN/l9k32P27Oph+nygIJJ6ly6pR6XozRy0E7xtE6aZcpyGSTSPdVWXFVzk4UkseV5uLomWQf8ZXMoaZBUklQgj4elniIsWVmEv1OUsHWjA53jQy9IWV9xjA5P7v/FuV+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1wfksqe43U7QpPxR6qy3SwV6kb+pBHZelhP2V3lzvk=;
 b=QzsKyXK5grvuZaLAKYnYPgvidNH1KTNaTPPe+T8vCZOlEFDI3G9TqryqWgurV3Uu8EtSvkyAHHwbEVScH19lcioQwmZJOFKB91kLuwFvYgFHRbtkpmQvUeQ9vEMXe5rXhJfSXyogz0Lhj9Q9MxLmOLjbiiJDJi/RxfzWkJOJ3Yh1yKk35X7kFp7Xb7pvn2TftbObcf+5t7nHxvqMsgDxSnM5VIiPRLUy6yDTxf8i9tRL5E/a7erm4lbGOPoUd8yIXguEHpMGf7rHvtoatp6ioJFSMH1dnMAcv+hoYXxjeGplwSQ32J/vBHKgyau/XwZJuM+rVsIl5K3uyKbczhDfFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1wfksqe43U7QpPxR6qy3SwV6kb+pBHZelhP2V3lzvk=;
 b=ij9vrB6XVTsjanGWGnPM/EBTCYItkl7VEAdPTFL0dzL+1O+GDa2f4564mGmyiRAVbzZdIMX3DAHsr+lTglnWtpmUbZhoHcBQFOG7lyPWtZw5cNj2+Gw4KuC228QX/O730+6KzPV7LyqhkeSQbDrmXManZ8jjkRxWIOcqxLc3zwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by SA5PPF5EA4322E1.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Mon, 8 Dec
 2025 07:55:01 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:55:00 +0000
Message-ID: <af7bfbbb-031d-4126-b03e-0dc5fd2f34cc@amd.com>
Date: Mon, 8 Dec 2025 08:54:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/ttm: Avoid NULL pointer deref for evicted BOs
To: Matthew Brost <matthew.brost@intel.com>,
 "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: Simon Richter <Simon.Richter@hogyros.de>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20251013160311.548207-1-Simon.Richter@hogyros.de>
 <20251013161241.709916-1-Simon.Richter@hogyros.de>
 <aO0oXPwaRa3RfmCU@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456F9CEB1B89BC3187E9B55EAA7A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <aTMjhaq3mJdPsHAa@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aTMjhaq3mJdPsHAa@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::14) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|SA5PPF5EA4322E1:EE_
X-MS-Office365-Filtering-Correlation-Id: 6037099a-aa5a-42ac-6b7f-08de362f1690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0JiSXl0ekJUQzhzeGxZZnhHQ2NZSks2RnFEU2REaDY0Mndaa0VadXBSZUNa?=
 =?utf-8?B?QTBWL0VoTjhYVFh4SERFZkhUVHE4WHNsa0NOTFp2bGdBYTFkVHYwaWxDbTh6?=
 =?utf-8?B?Z3ZoRSthQkljUXlSb2d5TnhuK21SMEJKN3ZKeFROcUx2Z2NlRXNZM2ozM1BK?=
 =?utf-8?B?enMzZ0pkTmpCbDdEK3JYcUxNUjJnaEp4cmFjemRLeUpBbisrVVZ5bFRJUFZW?=
 =?utf-8?B?TUZUemhCT3RBQkltaktGUG9GSkNMUkNKeHE2UlRuZ3M5cVRtUWdKZStOMDFl?=
 =?utf-8?B?cVVqdjRmT0ZmVzdCKzErRGJ0NUtnV0NxR3hrVmRuc2R0SWJFZEw2cTErUEc5?=
 =?utf-8?B?VENiY3l0WE1UM2J6NlJrc2E4eTFTR3NLUjFlb0pEbWVhS3FMNkZsVzdaZ2JS?=
 =?utf-8?B?T2N1TVo4ZGZKWkxQK3hhTmxEY1JYamppUVRQOXlER1JJTElpYU5uSTJiQ2ta?=
 =?utf-8?B?Q2JkZUNrYld6NXJKRUc4VFJnVGJjWHlxRE9sQU9qYzlhWEZuU3NVaXU5Z1p1?=
 =?utf-8?B?LzhnY2RWZ0NMU1ZIdnNKVmhKNU4rVU0xKzZGRlVlN0tCaVluNjBhbWlnT29G?=
 =?utf-8?B?VXk3dVFoNWNiMU93VTFlRU1pWXhSMlREWEJlS05PRnF4NHdhY0NSTWdTRG91?=
 =?utf-8?B?YkxkbnZJeFpid1Fzdmdyc0RNQTJ3OXBZNXNxajZTOUV5dUxtc0NsNTdmVkFD?=
 =?utf-8?B?eGRqY2x4UkxOd1F1RHY4Y2g3VHlKQ0dmb3JyUG1WZHJRdzdHRlpZVEE5Q2lH?=
 =?utf-8?B?dFRZaDQ3NmZHSVBBRVJidGFKbTVvclNmTExRS1FjZHVMbFZOMlhJY05SZTF1?=
 =?utf-8?B?c3ZDeEhybGs4WDc1c1Q4QnhBOEtKWHZsWlVzdlU4Wm1rVEUydFlKMTRHbWJo?=
 =?utf-8?B?ZHVRQW9yb3VTTlNGZmJ3RkE3emtWRktMdy9HSDJNbHA2d3JLSjB1ZWRETi9P?=
 =?utf-8?B?WjJxbEREUmRzMTZ2eTlpcjkxQWtuNDJmVEMyTURYYlJRZ3pZeExUWmJDVDRj?=
 =?utf-8?B?UlA1NmdoQ2Z0VGVGVjFxaitNNGQzSjd5Qm1PQ01IbG5NWGZDbTFROUhPYVRU?=
 =?utf-8?B?QTVEWXRiMzVaeStaRlVxNSs5Tkl1MXVic1Q2a0V1Tng2US91b3UrSHZXeFhx?=
 =?utf-8?B?cFV2MitNeFRmWFpTVEF2UkgzQXhzVlhXU0JMQnhLSTN6YzVGYTJUUmFrOCsr?=
 =?utf-8?B?NndwS0NQRHR4ODFTL0ZaVlV0dUwxUnhWYTgvdWVzNzN6Z3FiWmVnaXN2eW4y?=
 =?utf-8?B?QTJjVHdQdVZjd0x2WlFkQVhwaDJvOVc4K0gxWHRaWVJlMEQ3bURiTktmaFhj?=
 =?utf-8?B?amxDSVQzRUl2RmtzVnBpRE4vcFhueUpIUHFKSFJTS2o1TDkxaDJBS2tpRlUr?=
 =?utf-8?B?bGU1TVY4OFNOT0FjME95VGdTSHA1VFYxdmpVODZlaFNwVHhGL0hxZVJ3Mkg1?=
 =?utf-8?B?aVZvTEVHK1VFeHV1Ukw2dHE0ckJkNy84THM1SDd3NGdQbWRPb0VXUklRRU5R?=
 =?utf-8?B?SFZmWUpGQ3V5YXBrQ0ZrUWM2djFJTHdPWlI4OGRtcUZoZGQ5aklqd2JhOXFs?=
 =?utf-8?B?Sitob1RSZzZhWnhXdUVoNkdwLzk1amFMQlQzWVhjSFdIaVBLKzJ3czhkSjFV?=
 =?utf-8?B?ZWpyQ1UvcWhxa2pGSjFRSGtINWJsaGM4OTRVaXdLVTFzUW1EWEREbWhBcy9p?=
 =?utf-8?B?Ukxiay9lTmltTkxsODZMbFgrZHpBaUtjdkQ0UWpjTmIzSU1JQUpHek5YN2Nr?=
 =?utf-8?B?OHZJZTVBRm5sTXdZcDk5ZExrN2REb2xTcUlQTEppVUVJRWQ5dGR2YWt6MC9p?=
 =?utf-8?B?dFFmcUhIdWl1U3IzRlk3dEJRaTdHR1dFamVhZHYzd1BldkFSNEIyNndnZVIx?=
 =?utf-8?B?ODlxWkVlM2xLUGIxdzE1cHFZNUpLUnJ2ZVppMEJGTExBdFMvWmwzYlZIemx3?=
 =?utf-8?B?cThSYUtaNmZiTnQ4SGdpaWVzZEZHc0p2WmM5ajBQanNYdFFYNEttMzh4NVdO?=
 =?utf-8?B?Si9JRlJ5dUVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVYwbVRHRC92TVhVMWhSVnhxTmU5RVR3WXFVMk55d1RYUXFsY3pObFdNYTRr?=
 =?utf-8?B?eG1tY0tMQ3hhREhjV3pRUm5NRkNoMjE1ZG83QW45Y0cwVlBIKzhKeWwyM2M1?=
 =?utf-8?B?Y2M0T2tQYXNONGdPNE1ySG9ZU0ZiWUxTZ0krOUJ2YzU0MVIwYVVuREpybElW?=
 =?utf-8?B?SnMvU0VLZUhDM1c3aE5wK0IyOGhKQkFZd3lweTkvWVhVN3plTDF2R0MzMEdE?=
 =?utf-8?B?cjJ6cXo2Y0dsMExjUzJCWHhRdlFsRG9LenRDNWVyT1hMREZsWGlrYkdLcFcw?=
 =?utf-8?B?eVBQWHlwTEQ5MHgrcXV0cG5IL1BwUWZQeHYvaE85NzBDL2ROalF0bEx3QzlR?=
 =?utf-8?B?RmY5MWlYOXFyZDN2N3YrQ2o1bFpmYk5TbTAwYmpiQkdsbExJMXpHcGc4ajFz?=
 =?utf-8?B?d3pjSFNMSnluVlhVMW1vWEhtVThYeVppcXRhby9QeG91VHNxTVhYNUNJLys4?=
 =?utf-8?B?bklyVXFMRzNJNjBScGoxWkhhdlVCdVY0d0JOaVlhVnk1djd1eWJBVXVhd0w3?=
 =?utf-8?B?M2hsTlZBYnNlMVgrNml3SjVkVFozdlR5UjJ5Ums4NE10aGJyek9ramJrbSsy?=
 =?utf-8?B?UGxIaU0zbmtEa3psQmlpbFN0TkJUSEp2Vk9scVA1QjQyc2ZRSkt1RFduRFFr?=
 =?utf-8?B?TlNDVmE1aUt5Vm5SZ0JWcFBiWk1TMSsvUEFXSDJXK2hXb1VUYWFqY05yU01t?=
 =?utf-8?B?dEtJczZEQ05LM21XNEN0cnpYSVhsdS9icUIyckEyTWMxOUFPS1ZqVzA0ekxv?=
 =?utf-8?B?eStBV1FZYXlqaFJpVHlURGRxbENVRlJ0dFRpQW9UVlNaNU54QzY3QTErcld5?=
 =?utf-8?B?VWgvL25CdTJsMXpOQk5ZUS9MU21RWGVSS29xWThjSVpIY1VEWW5vUC84YS91?=
 =?utf-8?B?T0NUNVpzQ1o4WFpTZCtSWnd1RG5qODV3NmVNanhSVk5aNjFqTVNlSXppRWox?=
 =?utf-8?B?TEl5Q3J2WTRDV3lRNkI3aXJMdFlQSmpkWnFXY01OMFVESHdxZTA2YytPUjlC?=
 =?utf-8?B?MlhHUG1NWEY0OWgva3FZeWVFcldvWWlIMEFrT2ZVeDd4aHpDRERhaHJjY3hC?=
 =?utf-8?B?Rm8rL21YRnZ6U2pVMlM2NkQrUXAvNkJnb0Z3dkIxc01lc00vWjZtYzFNNUZ2?=
 =?utf-8?B?SnVQRDBHazJDd2YzZ1pTbU1vM1ExVWxCV0Flc2UxdnlKWGU4Z0h0czJETHh4?=
 =?utf-8?B?djFpNDZ3ODVoNzk1MVpUVTJIdkZFNWhrSHlPZzBTQmVDVjExcnBsMUpkcUdW?=
 =?utf-8?B?TFB6ZDRMTGFOSUtPYVZsTUZQY1UzbmJCNTR6TWo3eDh6c0k5cVZPZVdzS3JF?=
 =?utf-8?B?ZEJ1QUtUV3FTSkw5MWtLeWxkUzZTcC9HaEs0MFozcnVROWhqaEMvVmdGZ2hS?=
 =?utf-8?B?d1R6QnFjN2FsZHpKNEU4ckozNkxHZkgwL0QvNmp4d256dWR6bU1Oa0lPS2VS?=
 =?utf-8?B?cnh3Q3ExdHEzeXNxRm4zQzB0VU9hYTdXT2NuSHdPMEhwRXpxcHRpQlBRZ0Vw?=
 =?utf-8?B?aTc0RjV6Qm4vZ3ZXaUhCbktEZ1lRa1AwVFgyTUh3U3dYWU9NZ2NLaTFoV0Na?=
 =?utf-8?B?WUkrVThVMHRmbDdVODlva2pnSEkyYUJaWnFVSHM2ampYbGVlNmxEUkpHRE9l?=
 =?utf-8?B?SHd4NjBDQjdJWUN1UnBRYXVkTHVzTFViaWs2N1VnNEE5VU5HbDZJVVFtdHVI?=
 =?utf-8?B?d29qVXA3MkxKeHFRWTlpRU43Yk5rT3dDMmM0RVZlTFQ1aE5nM2dLbE9USG1Q?=
 =?utf-8?B?ZEhxYU1sNlRhWjBSaWNxMU9scFZwbkpwSjcwY2ticmY3ME13S3pqV0ZEQVRX?=
 =?utf-8?B?MzBTUmQyaGN2YWpiRTdqSkxqSDNGMnp0UlZyWUxsSkhwMlgvNHQxZUpPSCt5?=
 =?utf-8?B?NHQ0N2Rub0I1VGhXZ3JHbFN4eksxUmhkalpXKzJRcE1KTDVaYkJwZFR4ZFhP?=
 =?utf-8?B?T2tiNVJoenNCSURxVVNCb28zM0ZKVlM5dVMzblArREtDQmthSTJ1Vmw4ZTFr?=
 =?utf-8?B?cGxoUVFQamZpZEgveFFjaFVPaFN2WFZhWWxQdkdZNTVSM1FZU3YvaE83NHJZ?=
 =?utf-8?B?djFKNFd3WWgvcWFTV0JjMUxPWWVtRWtvcWNUZ1kyOEZIL0NwQVRqNlRNZERJ?=
 =?utf-8?Q?cC1d4QEBDEXIwp/fgo2hgm+e5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6037099a-aa5a-42ac-6b7f-08de362f1690
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 07:55:00.6212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uodna6yC2AvbAYWK1ipyBTQRqSYsx27jBLpqydNsp9iUfhOnn9NK7sO62P3Qfpzd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF5EA4322E1
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

On 12/5/25 19:25, Matthew Brost wrote:
> On Fri, Dec 05, 2025 at 10:46:34AM -0700, Lin, Shuicheng wrote:
>> On Mon, Oct 13, 2025 9:27 AM Matthew Brost wrote:
>>> On Tue, Oct 14, 2025 at 01:11:33AM +0900, Simon Richter wrote:
>>>> It is possible for a BO to exist that is not currently associated with
>>>> a resource, e.g. because it has been evicted.
>>>>
>>>> When devcoredump tries to read the contents of all BOs for dumping, we
>>>> need to expect this as well -- in this case, ENODATA is recorded
>>>> instead of the buffer contents.
>>>>
>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6271
>>>
>>> I think we need a fixes / cc stable but I can add that for you when merging.
>>>
>>> Anyways patch LGTM:
>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>
>>>> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
>>
> 
> Christian - any objection to me pushing this patch drm-misc-next or
> would it be drm-misc-fixes? I forget the flow here.

Good catch! I somehow totally missed that patch.

Reviewed-by: Christian König <christian.koenig@amd.com>

And with the CC stable tag that should go to drm-misc-fixes.

Regards,
Christian.

> 
> Matt 
> 
>> It seems this patch is not merged yet.
>>
>> LGTM.
>> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>
>>>> ---
>>>>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c index b47020fca199..a101ff95b234
>>>> 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> @@ -434,6 +434,11 @@ int ttm_bo_access(struct ttm_buffer_object *bo,
>>> unsigned long offset,
>>>>  	if (ret)
>>>>  		return ret;
>>>>
>>>> +	if (!bo->resource) {
>>>> +		ret = -ENODATA;
>>>> +		goto unlock;
>>>> +	}
>>>> +
>>>>  	switch (bo->resource->mem_type) {
>>>>  	case TTM_PL_SYSTEM:
>>>>  		fallthrough;
>>>> @@ -448,6 +453,7 @@ int ttm_bo_access(struct ttm_buffer_object *bo,
>>> unsigned long offset,
>>>>  			ret = -EIO;
>>>>  	}
>>>>
>>>> +unlock:
>>>>  	ttm_bo_unreserve(bo);
>>>>
>>>>  	return ret;
>>>> --
>>>> 2.47.3
>>>>

