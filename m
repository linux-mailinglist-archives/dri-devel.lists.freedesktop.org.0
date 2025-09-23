Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A914B960AC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 15:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED0110E617;
	Tue, 23 Sep 2025 13:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JeXajR+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010029.outbound.protection.outlook.com
 [52.101.193.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51EE10E190;
 Tue, 23 Sep 2025 13:38:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBt/B45ZUXKFoM8wQtF1YyGtPWb41W3YcwwWqV8BlEMv20RCWqcxCrPbaR6sJGvErWlzoCTPOpFSVIdH5nNcO7wRcF+k90zf8M4CIPSi7WCA26Lvfh7FKOHKRsBTZE+0vC61p4717now5Y0dqvCOT5c043z1ULyvZ7oQAeyamZH91razt25E30Dpdw/z1uaLm1KFXXvKX6zewn/thKsnUy55ci1s7wSuAsXNpVLHNXiF26dllgfOXNYUNkgJ37OpAzpkwjA8RrIIGEaAciNWLG9jLMqTTca8ibnAYwuEHJO+o7XRUdbS2nLgzzA7ZH64LOmnQMY8rWBGh+iKhOKjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGFP4lg31HoOj72Divzn/cPPjQPlYAKhTt+Wy9vt96k=;
 b=iKj1ey6D/TPBBpFalCUeAJtSN75Yp7yTE9HCLKz/RWUKUuKT6M3PXwJ8Xq53TeFtH8xjf1UEfgWK10zQCvzs9kgJsyKiQEs6u1cf3PwG56+Bx74wlJw62OwL4O9w1G+iFN6JMMN0+qNQLjrBNJbCttcV2tbt1lckKFknEKsHeyVR8b8xYcTWyRPFWo0I3Vrc5yybsNMSKcnLMyXmyf609aCT5meMtx3KKlq5fnsfE96N9R8Y19ddqEpPaaEUm14ToxmU9/eudPHWJDMZIlhIQll0abtntaYbElh6fix22xtWEYPaQ4WcnkL62rJWlGvYf2jGYOAWer2sP5+DRVn9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGFP4lg31HoOj72Divzn/cPPjQPlYAKhTt+Wy9vt96k=;
 b=JeXajR+tPycQR8MchA88leFk9hkgg/VmbDFP499uoCpj4C9QuaZ21WGLuWTBC1dAiOe4ijnMPKBD35m7vHvPThhTcO5Ib1KjLNI3sq4QKytXlad8HQK2frQiI+hW3D7vctrYB3wRlAK1oqv9Fzx5EemZJXKiL2XcGYmWPrC86e8sDsqWQ5D1/3i6awflR6xZq72Iw0v+5XWycyljC6VebF6kCaPCD1jrBVvnyjd3PIdDLAjRSK0W016LmbI4DDHCmIVD+4/dEpqhp4uGg1pbK5JGBR7lm5k1K6GSMMrGUNMl52QUa8gylvMpseui+zPV+gKt3eDNio10PcLVGx39Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by DS2PR12MB9590.namprd12.prod.outlook.com (2603:10b6:8:279::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 13:38:41 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 13:38:41 +0000
Date: Tue, 23 Sep 2025 10:38:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250923133839.GL1391379@nvidia.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8da25244-be1e-4d88-86bc-5a6f377bdbc1@amd.com>
X-ClientProxiedBy: BY3PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:217::15) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|DS2PR12MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: a7167d5c-6bac-4096-25af-08ddfaa68201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2dVRC95NURvYXc5SkRUb0xuUTAyeHo1KzVBV1pMUFY5RTZ1bzlVeEtMdW12?=
 =?utf-8?B?NzVhakYyekh5bFIvVFlKUUd0amZOWnM0VGdSTWpyYVBaWTlDNUd5NHhhMzc5?=
 =?utf-8?B?bjA2cjBiMmdBOW1jNEppakJWQzJNT2NmVVV1RVRYWTFMblIrbjVSdnIzVjVP?=
 =?utf-8?B?ZkluenlUYnErbkt0ZUpNenIwc0prMjUxM1hYVlF3RlpWbEJOVERIT2grZkNT?=
 =?utf-8?B?QWo4R0J0UGpJSDNXUFU0SjdpMmNiSXZwZHlpOWRqYzRZMmFEa2xqNTY1WHpv?=
 =?utf-8?B?d1VIRG92YnJRRHJGVEJRR1N3MGhSZmNUTDFheXRHY0FNdXg2UjdZVzhEdnRv?=
 =?utf-8?B?dUR6Z21QWlZhdmdYZEwvVmxEZkhJM1ErYk1YcXFsL3RTR1c0OXI3Y2JsVzNH?=
 =?utf-8?B?SmltWVoxdEZ4YkxUdlo2emRqMGpFai93WkZ6TjNCQmJpczhIUElDMnBySVU3?=
 =?utf-8?B?b1o1ZGRiaHgyK3haa1Y0RCtUSUJSdHNPYU9EQlphU1drQkdscG4wL1loN3ZD?=
 =?utf-8?B?UnVDREZUR0NQR20rWXhIQTVQRnhlOE9wMHpCZmpiZVkyYXNYQzA2RDd6Wmha?=
 =?utf-8?B?eHl0MEo4d1o3NVhFNFcyL3lidCtLV2dkQWJiR0d3WVhoeXlhUm0vR1NESnRs?=
 =?utf-8?B?YitFbzV2L0RwYVVPRk5lc3RnV2FqTE92MlRLZDU4bmNnRzd6RTBnczZpdXNK?=
 =?utf-8?B?QTdpV2FWdHpDT0U5bGNuNzAza0VIVUFFaEZibnJnWTRtV21zcThVSFNzM3NI?=
 =?utf-8?B?d0l5NERQRjhMYUphN2psY2JuMmxnSXZRWW12T2RHQ3h3L3Y2K3lsMzkySTEz?=
 =?utf-8?B?bVd1aGJWaTRHRlhLV2ppZ0lTOUpySUY1dUVpMDN0WmJiQ1JyYUU5Nk5yM3Q3?=
 =?utf-8?B?T3ZVZWdWOFFIdXJuV1RucGFxay84TmtJb25CZHJ6aU9STTVRaCsvbE41ckd5?=
 =?utf-8?B?YzBaVjVUVDNJR1hMMXVQUGJuaFd3VWoxYnk0OUdRcCtkM3c1SDczbDVKSWNJ?=
 =?utf-8?B?eEE1cmExMEt6TjVsVWZNaUUzcEZnVGx0eGdSczdBWTBRSlBzZ1c3OFhRaFJQ?=
 =?utf-8?B?N01CZm5vU00vcm5wTEFFYm90K3NSOXRJbEU1eGdUUlZPVmJDK1pLRjF2Zjdl?=
 =?utf-8?B?U085R0VyeVM1R0JKNStsS0hpWkI0RUdENGZGNmsxMmhweksxNzlqblM2MWln?=
 =?utf-8?B?UVd4d1NrTzA2RGlacjdSc3dpcVdQdTk1WVBaRXk3WC9LZVVLRWpSekRTSmdK?=
 =?utf-8?B?eDNBSWlmcEhiOGdOUG1IUXE2WVl4MGkrRXkyaTRJODdDQnY0a3V6YnFyNlp0?=
 =?utf-8?B?MUdKa0QxZUJFMEpmYlJPRlRwZ0xCTWpmK0IrR0J1cmUyeWUzSHIyMGQ5d2FT?=
 =?utf-8?B?WnVUKzhrTjZvOEVDT1lENk1FK2cyaE9TaWFJemxycFlYSStOZ2oxYVNzRTdl?=
 =?utf-8?B?WFQ1NHQwQlpGakNEMVByOEp5K01YRGNUeUFPTUt2dGRsZWpXWXU4N25mMkZ6?=
 =?utf-8?B?cklsOGVVVlpvWUVFK3Q2cG1FNnhNZ0xQd2laMkIrYTJja1J3R1RKOVRzandz?=
 =?utf-8?B?Z1ZMOGV3NTAzeG5ocnJ2ZDlRcTdmOVR1WHdZS29HWThDVGpCV01HeTh5NUVx?=
 =?utf-8?B?NnRiRjh3Tm1wQjdwQUN0azlwMEs5cWR6cFVFRG83SHAvc2Y3K1U2TTVreDQ4?=
 =?utf-8?B?MWt3YTRRdkZyekRZMEp4bjkrK0VtNmRWRTQvdVdrTkkvWEtGQTJFS044dkoy?=
 =?utf-8?B?WEQrWDZiNmZpcENrTEdOZWJnMlMvRzNHdkcrZHVOZ3NkQmlwdVA3N0VhcTNl?=
 =?utf-8?B?b1JhSFdVWGRhNnJCOGhTZEMrY2orS3FJcUdDazBUMkYwb3MwOUlIME03bDdq?=
 =?utf-8?B?SDhwSndjMVVXdlF2UmVHa0F3Q3NicTd2SDIyQ1NWUlNhbEc0K01tWVI0QmNi?=
 =?utf-8?Q?hB/0YZvBGqU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTN2R09sNFN5SHl6OHVhcE5lSDRLOTg5YTlBd1ptY2p6b0g4M0QyNVZhMXln?=
 =?utf-8?B?bnhrNUZuaEU0cDRoRzFKWVJaY2R2bzVXeDN4MnZCakd4RWUzTFQxQ29UbG9a?=
 =?utf-8?B?WE5OTTBZMXNZY3p3ZnV1NUdReW1MSjJaWkRBcUh2WG1PdzZmQ3VZN0N4aHk4?=
 =?utf-8?B?VHZuWEU5K3NNRkxtTTFnSlVYR3diVzh4VU1sS2NkQkJ3UnNWT2N4cEV5ZnB0?=
 =?utf-8?B?cVZ6ZitzSHV1QzRtNnhrR1pqWGJ4QnpUeThMT1FDR0pEUjJBQ2JQcDVRVE1B?=
 =?utf-8?B?S0diYklXd1pUT0dJcDhoS3REMkhIcnl6a0N5SWZ6ZVQvMzZBY21OOGpjQmZW?=
 =?utf-8?B?NVFQS3JlZmN0MWErb1RabnE4Wi9ReHQzYmVXV1EzQ3poZ21qVXhkS2NsVTRJ?=
 =?utf-8?B?SDhKV0tZM1ZMcThka2ZuNG9FallSSEpraVJkVkdRRjBrNjVtcFpheGFzbEp1?=
 =?utf-8?B?b0pzUDNDakZxYTdTZS8zL3IyTGxJdlBjTXRBYVhQZXNwclVIZmd6YkU1cjRP?=
 =?utf-8?B?ck13R0xmaFBYdU5OQmg1eFkxcXpkcVpyNHY5QU5ScDZsNEdodGl2SmZDbFZt?=
 =?utf-8?B?RnJmUjFzYWxKdFNEanpVZ0VXR1JKMUNhZzRsU0tuRVVpYnI5UmlUN0FYY1hn?=
 =?utf-8?B?bERZOEpZNUt0TDJlR0pPSmhFQUhjdW8wTVRibUNJQStBVmNEYlZUc2VCNWs2?=
 =?utf-8?B?MG5NYW1DYzhFenc3VFMvbCsrb09sMEVHaTVLcUpGZE9nWGZoUW5rWHZZaCsz?=
 =?utf-8?B?Y3ZjM3JVU2tscXJ1M0k5SldLcFJ3cEU1K0YyWDNudTBWeFRWR3lzUzZFOXpl?=
 =?utf-8?B?WHZBTURJbkdoTW80d1FYTTBIUVNZcXgzdDBzZk9BY2c3b3ViWGxzaUJYLzdX?=
 =?utf-8?B?dXp4SnVycU5xYVRWUlZVUnRaQ1dUSk9OeUMrOERjTENDOElDNk1zQlVGcjlS?=
 =?utf-8?B?YmxqMzV2SVEzVWxOLzZVR0txOWRTSW1oSkZWRmw4WGdvSlB3SGVET3ZjSG1G?=
 =?utf-8?B?ZTVadVVYa0pCMUpFZWZ6QTd3d0t2czVZMVhNMWQxencyMkZpcmlZdjR2OUZ3?=
 =?utf-8?B?SnpabmgxZ0dPTy9VbmRFTWJ1SFlraU5wcm10L2cwdjJJYlZGOS9PQUlucllk?=
 =?utf-8?B?VG81cDFJdGN0NTMydEVLYzBDTlZsZEJTdnRWelgyMW9mYjNBTXdLRE8vUXY2?=
 =?utf-8?B?aWpJbFhjN3FwOVdVSytPTlc3bXJ5Tisvb3hOZGRyL0FpS0NMN2c4S2xsd1NH?=
 =?utf-8?B?RkV3Ky9xa2tVd1AzVjE3MDlhTDA0c24wYS9sM3YxTDUrR1dNQjBIaEJnTEc5?=
 =?utf-8?B?WUs3cDhVd1pPV3FFNlU2NnVheWUvTE9FYVFobWJPK2ovcVNnUGU5Qnk2K1lT?=
 =?utf-8?B?cnZHWDA3NEFNU0EwdFZDOEZnRy9GL29lUVppaHdSb1Z0VlpQK0NQUExXYjBW?=
 =?utf-8?B?ZHh2OFBiOVJWRTlRNlhaeW0yRzRwTDZyQVc1MFg4Z1BnNkQ5Zmw4bFVTcURy?=
 =?utf-8?B?V1lWMkFWanBYWW1zakUwUGF3eVRTYmcvRnFtY1NjcFJ1VnRwNWo3ZlhJRk9r?=
 =?utf-8?B?c2JUc05iNUR5Z29IT21PaEIzUmVqdnpMNkYxSDF6RE8rNFh0Ymh0d0RBSVFI?=
 =?utf-8?B?ekpoanJ3MU9CQXl0SVNmb0Z5YlFLeDZBMHZad3ZvSnhac1dtKzc1MXpXd0lV?=
 =?utf-8?B?dTBjcVVFRktYekJNZVRrcTczbUdKbUZhcTk1Um9nc2NTR2hiTHRxMzRoYUFM?=
 =?utf-8?B?cm5oSDlZeVZlOThFcmxPTUw5M092TzZVR1luMXp5RkRva1RzblZBMzVUcWp4?=
 =?utf-8?B?NTZiZDhpZFQ4UjB3QUFib0MxcE1kL3QxOVN5SWhxS3N4YSt2YWdDRWxRdW9z?=
 =?utf-8?B?aG15NEp5a2s2QmRXRlI1ck9BTS9BZVNReDNodThYd0JIM254a2phNWlVL0JP?=
 =?utf-8?B?c3kyWGZpd2Jub0huSWhTUGpqZHAySnZFQkFIdU1XUlIxSkY2a1l2QmhNZWVn?=
 =?utf-8?B?QzlNQ3JXQXNIc1ZMTXhtc2J4VzBPZmtnQTJkdWE1MEU1REtsb3lDSllIY0NV?=
 =?utf-8?B?NWp5V2lqNW9SQmdZaUY1UEZMNGZKTngvUGcyeWc0MmRRTXJzc0lySXg3d1pn?=
 =?utf-8?Q?Fy5rsRnQE+qNHOUMM9fyJXTi8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7167d5c-6bac-4096-25af-08ddfaa68201
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 13:38:41.0805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lr0nbj9wi1snKj8bNzAtgsY4grr7VA673hYNxymNo2liOuGFq+VPv3XHLksetO91
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9590
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

On Tue, Sep 23, 2025 at 03:28:53PM +0200, Christian König wrote:
> On 23.09.25 15:12, Jason Gunthorpe wrote:
> >> When you want to communicate addresses in a device specific address
> >> space you need a device specific type for that and not abuse
> >> phys_addr_t.
> > 
> > I'm not talking about abusing phys_addr_t, I'm talking about putting a
> > legitimate CPU address in there.
> > 
> > You can argue it is hack in Xe to reverse engineer the VRAM offset
> > from a CPU physical, and I would be sympathetic, but it does allow
> > VFIO to be general not specialized to Xe.
> 
> No, exactly that doesn't work for all use cases. That's why I'm
> pushing back so hard on using phys_addr_t or CPU addresses.
> 
> See the CPU address is only valid temporary because the VF BAR is
> only a window into the device memory.

I know, generally yes.

But there should be no way that a VFIO VF driver in the hypervisor
knows what is currently mapped to the VF's BAR. The only way I can
make sense of what Xe is doing here is if the VF BAR is a static
aperture of the VRAM..

Would be nice to know the details.
 
> What Simona agreed on is exactly what I proposed as well, that you
> get a private interface for exactly that use case.

A "private" interface to exchange phys_addr_t between at least
VFIO/KVM/iommufd - sure no complaint with that.

Jason
