Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3C8A49130
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 06:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B5D10EC0A;
	Fri, 28 Feb 2025 05:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UoGPYHvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70F210EC0A;
 Fri, 28 Feb 2025 05:53:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4G+ztzRcW4BhqZaHu5mT1MWXnWFLE5MLXGr3qy/GCXWoasEMBbomW+v3SRu8bi1zePd155x/N+VkVnSIxwbfJiqFINVXHRl6x6SDjf3hVaWVYM1use+l2o7NIv03cCGhk/NedjsOpNuExdO0qxDQuYlZf7sX+r3ZIxrJgmYExj420t58vog3ZhZ2BdjgHzU674bN+hcAalJ6JTKmRb2GVvqBwF+PIw/z28Fqyl3boaKe6ud4YLuqoSzh9DYRiwI4ZnLJGb9vK+SwJnceofPhnwEKTZy4gNNntnl6ATscAVKFKDKti0O6p2s3rGaeeapXM0oqEgvpmfOLxhKjqQK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5Zd+kswfVNIa1a77GpdFaGNUmI0IHfcrjCuUiUOtI4=;
 b=PARv5imqzi0gcmyPXBKE/zFwuF8SkCSUJYqJFUk4iVVOQ4iLcljX5ntLtsIXFNiL48htJuOtJUl1w9PDeYwUAjOOn0KkSmkc6BWToF41Rab3oxr0OTjqm9Hn/ju/LNgbFoVeMdFXYbgE3z3WM2RfSKMcUn97QKbou5VdYuDs7OaA4sw0FuwkP4Bvn5TOBa8gRL6jifH1ibAhXo/PsGPF6u4fMt4Eja5qzlaUZ0VPr9OrxsReSOEErYZdTHvkN15erF+aHnBqn9YdcTtdJ0nhT04Bxmab4HEU8ErbuALpNFSyZptV4lHk0nkloSHOjqF4ZI6/1N2VevDZQiM60+r+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5Zd+kswfVNIa1a77GpdFaGNUmI0IHfcrjCuUiUOtI4=;
 b=UoGPYHvcqYvP7Op7cglDr+5x+3yHvEPaYOF+FnhhVNqCbxmm5M6PZkrYhp3WTatTVgQAPUJ1op0cHcHBzPfqDT8+xYcRB4OzIUA4sPwsnm9lSPmCfkNjnprWYxT33nloBTJDkuw36KgYh/synql4VdeUHGZGio7yXzjN8nACNFuG19fwWc9OXyuWZ9riY5JE9MonAa/iKv7XD+VSrUeYVHK5Cf3IyA7VQJga/8VSj17Bi40MRxL0VR3JQumocm15D29fjraKwitJzuseYBscDUXY2dC7McdwN0wJuJV2pN7/zsV7Uz/SSHSX5i9ABZHC6DzZiFZuIkl5Z1q1iG0gAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ0PR12MB6734.namprd12.prod.outlook.com (2603:10b6:a03:478::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 05:53:15 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 05:53:15 +0000
Date: Fri, 28 Feb 2025 16:53:11 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v6 32/32] drm/doc: gpusvm: Add GPU SVM documentation
Message-ID: <7vzwp4ouidxfoyu2qehkezy56tt52e4vjbthr6cc4ezr5iaw7b@plxyy7hf46dm>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-33-matthew.brost@intel.com>
 <cnt7o3wvgv37cfxsdothxv6agwi7nkqfqn37mafsyhl64h4lnv@rw7rbaha3au4>
 <Z8E9U7u8uV8rOlTO@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8E9U7u8uV8rOlTO@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SY5P282CA0028.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ0PR12MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da15dae-23e1-4d90-bb35-08dd57bc316a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXFFdFZPcktna1gxLzhSS1pLN0dFeW9TQzd3S0VXRy83YWwzNm1zNFd2ZHF6?=
 =?utf-8?B?R0laZ3lFV2MrcGh0YTBQdHd3SmcybEo2eVdtYmZRL1lCMWZzVC85TVMrSGV1?=
 =?utf-8?B?aU9STWhwU2hFbjFLMVhDYUEwRzVEVDVKZWdKYnBFY0VWbDhUN3ZUUWNmeTJ1?=
 =?utf-8?B?RWF6Y0Z2aFJmQUtjdlJZTWdVN3BiMXZ0cUJ0SGUzWmlJMmxkbU45TUQza2pr?=
 =?utf-8?B?bS9TMVMzU085VDlOOEcwTEZCOFQ4VVZWY2QxOWxWVXFQMzVPNmo2bVlEMkl0?=
 =?utf-8?B?M2NsbHZQUEZFNXBGeTB1U0xrb2FoUDEzNDdGYldkVXJzcDlYU0cwT0RGWTR3?=
 =?utf-8?B?dmo3YmtYWDI1Zm9aYnc3alhOTVJubyt3QjhXSGlQWGZ2NzFBUytUekJqYXdU?=
 =?utf-8?B?MW13bmxuOGdpQXQrbElyR25XN1V2V2NLbm9OZitzWkJJeERhSjlMQ01iYnlp?=
 =?utf-8?B?WnZNQTZUMFBEL2pSWnNjbzVSakFXQm80cWZsbFZKRzNHQ3FBdkRrS0loNTF6?=
 =?utf-8?B?VDI1VkV3Y1BHb1lRcXB1OE9jcFQzc1JOSEJEcU1keitiTENKdUZXL0J3TERU?=
 =?utf-8?B?cDdMVk8wSzVzUEt6UTdqclN6T08wQ2wrWCtIM1d3M3gxeGlidWRVRlJoakFs?=
 =?utf-8?B?dkhDb3oyc0tKY0tGbWNJNHRRZVdldFdUM1AxZGtvdGc0N3RDNjZ4U2x1Nm5U?=
 =?utf-8?B?RzI1Q21aSHhNZW9HeTNEWTIvZTYrOUV3V25jbkF1bnFWdjVPY2RIZjZ0UHpJ?=
 =?utf-8?B?WU9WQUpiTkZCbzY1L3pjL21xOW92VEhVcTU0SHo3emwwUDg5clJsSHhqcWd6?=
 =?utf-8?B?OUNFeHBnZ2ZKYUNYK01JL1plMVpBK05SM0NIaEhBdU1DQzZUZkZXU0c0TFEw?=
 =?utf-8?B?WDh3M1gzSzNFTlNveE5OMXlyQmp2RDBNNndqUmsybmVOQ1BNeFdiS2kxUy96?=
 =?utf-8?B?T2U2a05oQlhMeHY1RUFUVFNPMGNYeVAwNXRRN2o5TVZLU2MwUFdSZkVxQWRU?=
 =?utf-8?B?YTE1UnlkK0FyYTloL2NETEpWS0RjNElWY3VlMDlzTlpJOTQvdGhiWmRzSnBL?=
 =?utf-8?B?aW5MbS9TUS95VDNtbm5CaVdUdFU0RndDWE1nU0psdUhQS3hoaDZWUENaR3o2?=
 =?utf-8?B?Vk15d1g5VGxJK09VakhobDUyZFZnRXdqYnFSbTRFM0huZksyd1FRNDcvRmZX?=
 =?utf-8?B?WnJ6d3RRUldQSWJGZnRUUmxMc0lyNFhCMEdYNXpSQkNBMEtIM084ODd2Q2tN?=
 =?utf-8?B?Z0Jmbnd1eTUyQXREclJZUHp1S2VLRU5zV3VQc0doUGhpd2RMa1ZYZjdvMVRU?=
 =?utf-8?B?VHBMNmhSaCtYWkxZTUpOMVZLdk5aRXN4cDFHWm1NWHNwbXcvNURrUWJZeEV1?=
 =?utf-8?B?MXI5M2FBUGFQREhJTXEyWnlRSnE4V0dVUlBNNFQ2OWxycEdFMkNmVnlJc2tS?=
 =?utf-8?B?N0pyaTNwREY5QVYxNGdvMkFzMFk5M2Fyd0RsRUFjL3d3Y2p2R1UxcFFsV2pY?=
 =?utf-8?B?U3VjSU5JU0Npb3J4ejlmK2lXTnlTdyt2R2FWOGxWb3U4RE0wblVkMGpneVdV?=
 =?utf-8?B?WWdkV1hlcThNTzU3M3BBREZMOUNyeTJYc1ROWnljNnV1dXlqSVZHSWppWTUx?=
 =?utf-8?B?dENYemRCYTNoUzdyalpWaTFBcnlaWW0xZzloWTd1OG1HalhzbDduQjd6d3B5?=
 =?utf-8?B?b0Rsa3V0RmpTUGVFeWJIRzF2V0R5UWdaSlBod0hhaitmT1R5MnRQUWJYaGlY?=
 =?utf-8?B?ZnAzRjg3c2dQVnZrYXFISHQ0ZFA2cVErVXZkd25iWnVlWU4rVE9zQ1pQWXZJ?=
 =?utf-8?B?cXI1M3d1d0ptMm10elF0UzdwWUpUU0hFd0VUZnh2Uy9sekpLMC8rTGVKSGN1?=
 =?utf-8?Q?UJQecvHKGNo3o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG1jUEMwRWt3VXprZzNjbTN2d3ZITjl4dm82d0g0V3dIYVNRZGpFdU14Wlln?=
 =?utf-8?B?eHR0ZlFvMEJ5c1RPK3I2UDdaOTMwWldQT082Y2ExR1NuVWpJU1FQblE1Yk1C?=
 =?utf-8?B?WmUwOWJJeURvd1JvWFhwNnFRT3RuRUdDRERIZVhFV3BMcitOMG9rUlZadm1I?=
 =?utf-8?B?R1kyWDB0ampORWc1OUxuS21KdFNxSTVsR0pPWGtQRkZXbnVpWU0wSVc0eWJP?=
 =?utf-8?B?WkFJV0FoTGRnVXFHaXhjZHZldjhFb05ieVpNb25lMVdOZldrZGl0QjBuUllx?=
 =?utf-8?B?QTFDTE9wRHUzcWJJbWx3SjFBcTNvRk11d09GamRnQ1lRNTFodllSYTNVVnYr?=
 =?utf-8?B?QnBORVRqd3BhaDR4SFY1ZUdGdnAwVGw5dUREM3ViSEtKTUEyMVpVa1RDM2hS?=
 =?utf-8?B?VG54SFU3WFRuVGx1RlRaQ2VPb013dXUydktkQitvSmRGRzdsclpnV3oyb3Rw?=
 =?utf-8?B?OTNnSnppazZGZVFQNjFwcTloakR1WGZISTZXLzFRL3VDb3Z2dnYzMWxtMWNh?=
 =?utf-8?B?d0FlSnhFQm4zbWZTQTdUS0hwK09uUllRbkUvRXMybEJ1TWZIeXEwOGkxVDFr?=
 =?utf-8?B?Y2VwNzhnMmY2Q3Y5UUJacm42MGEvWW5TQjNOcDU2cCtXeWl3bnErYS94NFhl?=
 =?utf-8?B?bUVsNDJVUWhGVzNjNUlmV2dIZEJIelc4N1lMSXFCRjA4VGtzRDJKTzVjUkNk?=
 =?utf-8?B?eFQ0ekx4NWYrRU55b3FFQWZOVEd4cDlGS01hc0NvUytPcjk2SGtBaUFtL25q?=
 =?utf-8?B?TmR6aHhlZ09icjFBaWN2VXIxR2diMlp3TWdHbHU4SWhmc3orM3VoU2xJUkk1?=
 =?utf-8?B?alVSWS9xZldMVFloSmQ4UjJsTHdTWDh3K1VOQWRVYWFsc2FBa28vUm1Ia0cx?=
 =?utf-8?B?SWgwUTdqUG5MeEZub0hSS3ROVDJVcnllczYySjFwSmtDcmpSNWU2QU41eFov?=
 =?utf-8?B?blpCV1owQTVvYVVTVGlGM3BySFlyd3pIWEpFYTVsdElUdXFzMGpQZjBoNWwz?=
 =?utf-8?B?WXcxTTBscXcvQTBGU0NHL0ttdUJJN25IN1Z4MGkyaTVseitKM2hKY00wOW55?=
 =?utf-8?B?M2FvZnJWbVhlVnBmTFVXUDJGaGdVRGdUYllyNGFPejRham50czNrNUd5aEZ6?=
 =?utf-8?B?WkpwU2I0cXZvYkZkYVJpekNpOFN3a21zQTRlRzdHL1pGdkRBdWxqZDNOMEFO?=
 =?utf-8?B?MmliaTFUUEIvTFN6ZVVRK0RsUDA4RHN0SmdNaHZwcXU5OGdjYlVHeng1NW9k?=
 =?utf-8?B?eVZENWJhOEhxaDNweWJaQkMxdlZPQnNYWjdWRXFtWnBBYnBXanpPbFNNci9U?=
 =?utf-8?B?NXRzVSt2T1lsYWJpTzEwMDFvQ1VTdGprL1RiZDRNMU9acVVzSnJtdXRTbkpC?=
 =?utf-8?B?NU5iVHgycGZTUHBLNVlURmdWYnlnek9rN1FiRkovYnYxdnhvNnVqNWRZVExv?=
 =?utf-8?B?R1JodHo0aUJvZ1AwQ1NmaUhtQnF2UDU1YXVrN2x5cm5aQ2dkS2lpMVdrZDU1?=
 =?utf-8?B?SmgrUG0yWHZpZHZaM2hsREEyNnJTdVFlWWc0TTVScTVjWndQck1YbEZvNm8y?=
 =?utf-8?B?Y3VrYjlkbmY3SERzb09lQlQ3S25YNnp0am50UnhmcXRtMGVBdEtML3pZRDdP?=
 =?utf-8?B?Yk02V1NMaWtXeUdoaG43VlduMjRhQldOQnpQQ2dqS29UYUJPMHFoblpWYngw?=
 =?utf-8?B?OXR3b2w5OFFqVFBOblRSaVlKQmVjMUYxMlVsdVdnMmkyWm9WQ0ZBaytrbGtM?=
 =?utf-8?B?MlR2aDJBdlMvd285L21WTjgrRUt3OWVtVlRPKzVLZUJRclM1L1A3OWp1YXMy?=
 =?utf-8?B?MWJMbTc3S2pzdWNDS2REbC81cFFiL3p2aWk1SGJmL1F4dEI2RjRmQVJzNjRL?=
 =?utf-8?B?YWVzM3FDSzVqS0E2QkpMaWdjL1VpWS9EVEpGMFR0dnBnYnQwQlpZUTUzZEt3?=
 =?utf-8?B?dm11Tk9PYVJOdjNFMUlVLzl0UTBJVFkrcTlhdnVCSnFINzVQSXl0elV0SDJ3?=
 =?utf-8?B?TDBmV1BUaUJhdE01NGM0VjZ0TmNkc3p2MDJNNzNWQjBNaWFnWDhwV3dtbnRQ?=
 =?utf-8?B?UlNXaGZiUWZESWZaVmxJRG5ZS05SdDZzU2R6eFZnMmZyMXJ3VVNIa3JPci9Y?=
 =?utf-8?Q?A5XLo9vYMhsft7YL/+VML5ssb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da15dae-23e1-4d90-bb35-08dd57bc316a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 05:53:15.2717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VJHwRy63dLU5Hb1+62P3uqwMsMvxeVLO3wdQ4UPGZOq0Icdb+Rt3r8o1O3N9TkP6NPya1tmXxOzJqhajvvYJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6734
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

On Thu, Feb 27, 2025 at 08:36:35PM -0800, Matthew Brost wrote:
> On Fri, Feb 28, 2025 at 01:34:42PM +1100, Alistair Popple wrote:
> > On Mon, Feb 24, 2025 at 08:43:11PM -0800, Matthew Brost wrote:
> > > Add documentation for agree upon GPU SVM design principles, current
> > > status, and future plans.
> > 
> > Thanks for writing this up. In general I didn't see anything too controversial
> > but added a couple of comments below.
> > 
> > > 
> > > v4:
> > >  - Address Thomas's feedback
> > > v5:
> > >  - s/Current/Basline (Thomas)
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  Documentation/gpu/rfc/gpusvm.rst | 84 ++++++++++++++++++++++++++++++++
> > >  Documentation/gpu/rfc/index.rst  |  4 ++
> > >  2 files changed, 88 insertions(+)
> > >  create mode 100644 Documentation/gpu/rfc/gpusvm.rst
> > > 
> > > diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
> > > new file mode 100644
> > > index 000000000000..063412160685
> > > --- /dev/null
> > > +++ b/Documentation/gpu/rfc/gpusvm.rst
> > > @@ -0,0 +1,84 @@
> > > +===============
> > > +GPU SVM Section
> > > +===============
> > > +
> > > +Agreed upon design principles
> > > +=============================
> > 
> > As a general comment I think it would be nice if we could add some rational/
> > reasons for these design principals. Things inevitably change and if/when
> > we need to violate or update these principals it would be good to have some
> > documented rational for why we decided on them in the first place because the
> > reasoning may have become invalid by then.
> > 
> 
> Let me try to add somethings to the various cases.

Thanks!

> > > +* migrate_to_ram path
> > > +	* Rely only on core MM concepts (migration PTEs, page references, and
> > > +	  page locking).
> > > +	* No driver specific locks other than locks for hardware interaction in
> > > +	  this path. These are not required and generally a bad idea to
> > > +	  invent driver defined locks to seal core MM races.
> > 
> > In principal I agree. The problem I think you will run into is the analogue of
> > what adding a trylock_page() to do_swap_page() fixes. Which is that a concurrent
> > GPU fault (which is higly likely after handling a CPU fault due to the GPU PTEs
> > becoming invalid) may, depending on your design, kick off a migration of the
> > page to the GPU via migrate_vma_setup().
> > 
> > The problem with that is migrate_vma_setup() will temprarily raise the folio
> > refcount, which can cause the migrate_to_ram() callback to fail but the elevated
> > refcount from migrate_to_ram() can also cause the GPU migration to fail thus
> > leading to a live-lock when both CPU and GPU fault handlers just keep retrying.
> > 
> > This was particularly problematic for us on multi-GPU setups, and our solution
> > was to introduce a migration critical section in the form of a mutex to ensure
> > only one thread was calling migrate_vma_setup() at a time.
> > 
> > And now that I've looked at UVM development history, and remembered more
> > context, this is why I had a vague recollection that adding a migration entry
> > in do_swap_page() would be better than taking a page lock. Doing so fixes the
> > issue with concurrent GPU faults blocking migrate_to_ram() because it makes
> > migrate_vma_setup() ignore the page.
> > 
> 
> Ok, this is something to keep an eye on. In the current Xe code, we try
> to migrate a chunk of memory from the CPU to the GPU in our GPU fault
> handler once per fault. If it fails due to racing CPU access, we simply
> leave it in CPU memory and move on. We don't have any real migration
> policies in Xe yet—that is being worked on as a follow-up to my series.
> However, if we had a policy requiring a memory region to 'must be in
> GPU,' this could conceivably lead to a livelock with concurrent CPU and
> GPU access. I'm still not fully convinced that a driver-side lock is the
> solution here, but without encountering the issue on our side, I can't
> be completely certain what the solution is.

Right - we have migration policies that can cause us to try harder to migrate.
Also I agree with you that a driver-side lock might not be the best solution
here. It's what we did due to various limiations we have, but they are
unimportant for this discussion.

I agree the ideal solution wouldn't involve locks and would instead be to fix
the migration interfaces up such that one thread attempting to migrate doesn't
cause another thread which has started a migration to fail. The solution to that
isn't obvious, but I don't think it would be impossible either.

> > > +	* Partial migration is supported (i.e., a subset of pages attempting to
> > > +	  migrate can actually migrate, with only the faulting page guaranteed
> > > +	  to migrate).
> > > +	* Driver handles mixed migrations via retry loops rather than locking.
> > >
> > > +* Eviction
> > 
> > This is a term that seems be somewhat overloaded depending on context so a
> > definition would be nice. Is your view of eviction migrating data from GPU back
> > to CPU without a virtual address to free up GPU memory? (that's what I think of,
> > but would be good to make sure we're in sync).
> > 
> 
> Yes. When GPU memory is oversubscribed, we find the physical backing in
> an LRU list to evict. In Xe, this is a TTM BO.

Sounds good. So eviction is just migration of physical memory. 

> > > +	* Only looking at physical memory data structures and locks as opposed to
> > > +	  looking at virtual memory data structures and locks.

Except of course whatever virtual memory data structures the core-MM needs to
touch in order to do the migration right? Agree that the driver shouldn't be
touching any driver data structures that concern themselves with virtual memory
addresses though. Except what about any data structures that are required as
part of GPU PTE/TLB invalidation?

> > > +	* No looking at mm/vma structs or relying on those being locked.
> > 
> > Agree with the above points.
> > 
> > > +* GPU fault side
> > > +	* mmap_read only used around core MM functions which require this lock
> > > +	  and should strive to take mmap_read lock only in GPU SVM layer.
> > > +	* Big retry loop to handle all races with the mmu notifier under the gpu
> > > +	  pagetable locks/mmu notifier range lock/whatever we end up calling
> > > +          those.
> > 
> > Again, one of the issues here (particularly with multi-GPU setups) is that it's
> > very easy to live-lock with rety loops because even attempting a migration that
> > fails can cause migration/fault handling in other threads to fail, either by
> > calling mmu_notifiers or taking a page reference.
> > 
> > Those are probably things that we should fix on the MM side, but for now UVM at
> > least uses a lock to ensure forward progress.
> >
> 
> Again, see above. Right now, migration in Xe is more of a best-case
> scenario rather than a mandatory process, and perhaps this is masking an
> issue.
> 
> Maybe I should add a comment here stating your possible concerns and that
> Xe will be implementing real migration policies and multi-GPU support
> soon. If this issue arises, we can revisit the locking guidelines or
> perhaps help contribute to the necessary core changes to make this work
> properly.

Yeah, that could be good. Something along the lines of core-MM code may need
fixing in the way I described above (one thread attempting a migration shouldn't
cause another thread that's already started one to fail).

> > > +	* Races (especially against concurrent eviction or migrate_to_ram)
> > > +	  should not be handled on the fault side by trying to hold locks;
> > > +	  rather, they should be handled using retry loops. One possible
> > > +	  exception is holding a BO's dma-resv lock during the initial migration
> > > +	  to VRAM, as this is a well-defined lock that can be taken underneath
> > > +	  the mmap_read lock.
> > 
> > See my earlier comments. Although note I agree with this in principal, and we do
> > just retry if taking the lock fails.
> > 
> > > +* Physical memory to virtual backpointer
> > > +	* Does not work, no pointers from physical memory to virtual should
> > > +	  exist.
> > 
> > Agree. And my rational is because core-MM can update the virtual address for a
> > page without notifying a driver of the new address. For example with mremap().
> > So it's impossible to keep any backpointer to a virtual address up to date.
> > 
> 
> Yep, this is good example and will include this in my next rev.
> 
> > > +	* Physical memory backpointer (page->zone_device_data) should be stable
> > > +	  from allocation to page free.
> > 
> > Agree. And presumably the rational is because it is very difficult to safely
> > update page->zone_device_data and ensure there aren't concurrent users of it
> > unless the page is free (ie. has a 0 refcount)?
> > 
> 
> Yes, exactly.
> 
> > > +* GPU pagetable locking
> > > +	* Notifier lock only protects range tree, pages valid state for a range
> > > +	  (rather than seqno due to wider notifiers), pagetable entries, and
> > > +	  mmu notifier seqno tracking, it is not a global lock to protect
> > > +          against races.
> > > +	* All races handled with big retry as mentioned above.
> > 
> > Sounds reasonable.
> > 
> > > +Overview of current design
> > > +==========================
> > > +
> > > +Baseline design is simple as possible to get a working basline in which can be
> > > +built upon.
> > > +
> > > +.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
> > > +   :doc: Overview
> > > +   :doc: Locking
> > > +   :doc: Migrataion
> > > +   :doc: Partial Unmapping of Ranges
> > > +   :doc: Examples
> > > +
> > > +Possible future design features
> > > +===============================
> > > +
> > > +* Concurrent GPU faults
> > > +	* CPU faults are concurrent so makes sense to have concurrent GPU
> > > +	  faults.
> > > +	* Should be possible with fined grained locking in the driver GPU
> > > +	  fault handler.
> > > +	* No expected GPU SVM changes required.
> > > +* Ranges with mixed system and device pages
> > > +	* Can be added if required to drm_gpusvm_get_pages fairly easily.
> > 
> > I don't see much of a need, but also don't see any barriers on the MM side for
> > doing that.
> >
> 
> I don't see any barriers either, I think it would work in Xe with slight
> tweak to our VM bind code.
> 
> I'm unsure the use case though too.
> 
> > > +* Multi-GPU support
> > > +	* Work in progress and patches expected after initially landing on GPU
> > > +	  SVM.
> > > +	* Ideally can be done with little to no changes to GPU SVM.
> > 
> > See above, but I mostly agree.
> > 
> > > +* Drop ranges in favor of radix tree
> > > +	* May be desirable for faster notifiers.
> > > +* Compound device pages
> > > +	* Nvidia, AMD, and Intel all have agreed expensive core MM functions in
> > > +	  migrate device layer are a performance bottleneck, having compound
> > > +	  device pages should help increase performance by reducing the number
> > > +	  of these expensive calls.
> > 
> > I'm hoping my patch series[1] to allow for compound device pages will land in v6.15
> 
> Cool! I was not aware of this ongoing series. Let me look.

There's probably not much of direct interest to you there at the moment. It's a
prerequisite in that it allows current (and therefore future) users of compound
ZONE_DEVICE pages to have them ref-counted normally, instead of the funky scheme
DAX uses at the moment. Our changes will build on top of that.

> > as well. The next steps are extending that to DEVICE_PRIVATE pages with
> > migrate_vma_setup() and migrate_to_ram() and we have been making some good
> > progress on this internally. I hope to have something posted before LSFMM.
> > 
> 
> Also cool. If you think you have something working, let me know and will
> pull in changes to test out.

Will do!

> > The other thing we have been looking at here is being able to migrate
> > file-backed pages to GPU memory.
> 
> Also can test this one out too.

Thanks.

 - Alistair

> Matt
> 
> > 
> > [1] - https://lore.kernel.org/linux-mm/cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com/
> > 
> > > +* Higher order dma mapping for migration
> > > +	* 4k dma mapping adversely affects migration performance on Intel
> > > +	  hardware, higher order (2M) dma mapping should help here.
> > > +* Build common userptr implementation on top of GPU SVM
> > > diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> > > index 476719771eef..396e535377fb 100644
> > > --- a/Documentation/gpu/rfc/index.rst
> > > +++ b/Documentation/gpu/rfc/index.rst
> > > @@ -16,6 +16,10 @@ host such documentation:
> > >  * Once the code has landed move all the documentation to the right places in
> > >    the main core, helper or driver sections.
> > >  
> > > +.. toctree::
> > > +
> > > +    gpusvm.rst
> > > +
> > >  .. toctree::
> > >  
> > >      i915_gem_lmem.rst
> > > -- 
> > > 2.34.1
> > > 
