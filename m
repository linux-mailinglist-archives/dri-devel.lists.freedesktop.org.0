Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B25BAAFD84
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 16:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C90410E91C;
	Thu,  8 May 2025 14:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ShvRVVI5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C2610E91C;
 Thu,  8 May 2025 14:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8HWDQ0Mzp5jVjirKv1qV6w3+o8maBRKSygalufevvBxPf0AeRRKLZaEGjM8dL2elWCDZyBtnXDNsUSNlaz5nIzxQ7/G/dsqW6JxjVdZs3h+pF0lVN68bVi4eUrH380WPerTY0QWFeygPDswqP0z9VbILtKvKb7IwX3YVBKd+sAWX9TotwN5bLLhy+SjDUkok8VkbCKR9OUhaOy7rUSwS3Zc4VRuKj15TYtt9wCbelIt+Q6bUfsCKvXP7pnNlXm4C3RB+T32g65TCgFXBI4ZyniPL/zg1p8JIesP4pbKrISOtUr347RcYs5v9U+urV41WpATDUgP50NY2JlGyjXNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MGz146OmrQISH+uiHppL1822ahHoEQ90UydZA7a8oE=;
 b=kmYByMjcC1DaKU8aW8eQ2cckbtpmEIiTmKJjRcM/lMUMNeZUxLMswWrjNG2TP2/C0YdZBpITUyYNnXA4Hv7lXonOijZx5NnOiA8XLLfaVcdb5+DYvw86lSCRZaAbGmGzDhCqVJ7A+9W3xsLB0HiQTPJvD2MU6zC98owKj3Pl1E9TDIcSptuZ4Ld1u0HSd2EoOtj3BHfB1Fa4/QckslF/12opvdANKzMErlBraKJ4m5zH7VZNRsvdqMqXU760UdPC+nvT7FDf+EwmahqDBJzL5CsFK5nOi5uGIWAFjU1LS2PjV/dQ0LcBDf2PdZhR4N8SqBtvX9Ilc1ypuq7RJNNt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MGz146OmrQISH+uiHppL1822ahHoEQ90UydZA7a8oE=;
 b=ShvRVVI5CPGxm4Q2LQpQfsEpxpxvGRu/Q9BkEny6bHbC7iaYopeI9hf2U2Ags6wdlyU5QFeY0RwveDDO1iefnUe6jZMbmEDVkbQON5rtqYQiBAAQbnpcxTleE3zLBEtpOCods9gC7rqjxnYIctxB0M2/8tkm37cfuhcVkQduT6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS7PR12MB6191.namprd12.prod.outlook.com (2603:10b6:8:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 14:43:56 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%6]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 14:43:56 +0000
Message-ID: <d4fc7e44-c92b-4d4f-b92a-497890e9a379@amd.com>
Date: Thu, 8 May 2025 10:43:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
 async flips
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Syrjala, Ville" <ville.syrjala@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "Kumar, Naveen1" <naveen1.kumar@intel.com>
References: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
 <SJ1PR11MB6129BDF34CF14847EEE77168B9BD2@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <CADnq5_P3_usd9RDdLfjshz-o+nzkVSBrHmrqRUQThtX4X3jP9g@mail.gmail.com>
 <IA0PR11MB7307ED8EBF70B88CE33A1AB6BA8BA@IA0PR11MB7307.namprd11.prod.outlook.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <IA0PR11MB7307ED8EBF70B88CE33A1AB6BA8BA@IA0PR11MB7307.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: QB1P288CA0019.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::32) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS7PR12MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: db7f2642-283a-4f0f-dce7-08dd8e3ec2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|13003099007|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3V1RE9iR2oyQUdqU3dvejR2RzAwVzNqZGptRUI4Yjc3VFlaMGJMa1F1RUF5?=
 =?utf-8?B?V1AvK2V0RGJlL3Z2ZTErY3pJN0tpV0xpMFlYcG04YnJwN0hKK0xNSWtXbzVu?=
 =?utf-8?B?bFhNNVlvQWxpeENpcll0RWVOcXVjYXBUVGNTYUJGc2xXOENCZ2oxYVZBTkQw?=
 =?utf-8?B?cUFqc0JrWU1zTEthdU51eWJGRndVMkIzMVEzSHhBRWRuMmRJdVJxR3N6UzVN?=
 =?utf-8?B?azJUL1V6MTJwTFZ3UGQyclAyZGUwWVlEWFZ1UWFodC9IRSt5ZHBQQVB5RW8x?=
 =?utf-8?B?a0YwRi9mL0d5Zzh4T0Y4VVBkRlhsZUw0bVlaalloMWtxQ0NBWHFqR2RtWXRG?=
 =?utf-8?B?UmhHdTVUUndHZlFGbEVTU3pVRFcwMTl3T0hIV3V4cXFkREpXY25HbDFMZ29N?=
 =?utf-8?B?L0pJV0FKbWpyenhzWlJNL3ZjOXVnd01QMHEyUC9GdHlWMUY3UzUxSFhIYW12?=
 =?utf-8?B?ZWVWTHJZWDlzbkpMdlVqby9URk9SN1JySytvOUt1a3RkOC9vb0pCK2kyYncy?=
 =?utf-8?B?NzE5dWdQOFpGbk1iYkZGZnVnZEZ5NE1RSnJiOHcvL3BJcG0vSEpNUEVJVWpt?=
 =?utf-8?B?eFRwRENaOStLOVBCSGRyaGx6clRmWTBaT1FCOWpXOVBvTTBTL1BQZW51SVpr?=
 =?utf-8?B?aWdhMEdRTi9zZ0Fnamd2VC9oaFFXN3RIdS9vY0lkdzVZTnpPR1UrL2dDekVn?=
 =?utf-8?B?bk1DTnY3RkVxaGhkT0lBV2NxYmZHYlFTNG5LKytKNU8zbUIrckdFb0p1MlNr?=
 =?utf-8?B?R1k4MElLQ1AzbjA2dmRjdVhsQ29TeXdQYms3MHhuL0FwYlVBTXFBYVVQZHE4?=
 =?utf-8?B?U2FpRmFvQmlKZm54WXFVMkZCU3JXa1owMmRKZ1g1Q0ZsdllKdnVXbDN2VjRP?=
 =?utf-8?B?akdoNmUvSncxS1MyMFRxTlYvbzlleHpibUtZN00zSkJoKzdabE5NWVVIMEJW?=
 =?utf-8?B?OHdkN3pYZDB5TWcva29yQW1XNXdjekRldHZVdVE1UkN3ejBaTHdlbU9EdDdX?=
 =?utf-8?B?aVZnQ1pVdWNqMWp1TVo2Z01LUlpJV1VqVXZTa3p3S2txb0FlcDBtV3RkSmxr?=
 =?utf-8?B?VHhwNFlXd3BXZTRBdkpEMjZBUis5TkI4dVNqU2FGRUYxQytrU014QXlMc05H?=
 =?utf-8?B?UHVnUHhMKzlaUklQaWs0by9ERThyUDlYS3RDVVcvQWp6ZUpoRVpURGFkbGdL?=
 =?utf-8?B?NTdKMlU2R1pSSldYWklSWEhETFM4SGt5UEhQa1EzVS9aUVBJNFN0NUpCd3Nh?=
 =?utf-8?B?LzRpcEVMTGJ0eHB2dE91dWN2cXZpL1VMT3Jxalo3NENtalFFTVpkYVJhL0J3?=
 =?utf-8?B?YWVnQkxVby9GZHRvZTlUNnNHWm9vemQwUmFLY1pKTi9vT3ozZXFrOFpRVDJ3?=
 =?utf-8?B?a1IrNGVZN2xtckNPNSs0MWVkSTRUM09qRVlUOEkrQ2ppSnR1bWNuUENmSG14?=
 =?utf-8?B?MTljbjZFcXhsQVdwUmdWSy9KWnVBT3dqekhpdDQvUG12K2IybXBIN2ZMVVJJ?=
 =?utf-8?B?empDVXp1TXkvdXdyTGxYekkrTDNaM1A0NUhjbXo5UGxSaldocURxbTEvakJG?=
 =?utf-8?B?S3JzQnVEVmtaVTQzSys3aGJ2OTA0cXlJRUw1dnV5WXpDSXhkRXpSeHNEYlBC?=
 =?utf-8?B?eWZPTmMyQ2FHbmFXQzVDc1ZObC8xYW9mZ3lYV3E1c0tYbTFQRzNkTmZwVDNC?=
 =?utf-8?B?TzBpTTdOSzQzUmxwanJCT0o4dzdNNjJaMnQ3ekE5dHk2NVI3MUpuSzNOeXg2?=
 =?utf-8?B?bVhaeFJlb1FSWkFXdFRyejZPM3VRY3lUVENJR2ZHRnhnQjZZQjhHNTlWRlBI?=
 =?utf-8?Q?kamaaDuzkv7r+eEw25uzem0zTMIr275eH8b74=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUhVdFVWeExJUmxUVGNMY21VamMrYVBxemFobjJxRzRQd2dZQnBwT1U4c1dn?=
 =?utf-8?B?cEJVNG9LMFNZWWVuQ3lYTURyam43TVMvc0FJQUJ5Wm9ZZmJ1U3h3c1FwVXVB?=
 =?utf-8?B?NXBlaWFHbGhQNG5hZzRzRDVMeVlqWGE5UlZCMHJNTnNFVXBITzNYN29LZUM1?=
 =?utf-8?B?ZUdRRzRlSXV1S2xkWXRDNUx2bHhleG9ob05JdjIwOHFDb3Zvd2RrQ1lQVWVl?=
 =?utf-8?B?OXFWbFM0QTU3SExyVitYTkN4cmFMbUswUlN5YWtJVUtZdW42VDFLQlJZRXF5?=
 =?utf-8?B?TDF2ckJYa1B5VGpVUTZFaG5zdjhoUW12OWVpQUl4NVllakIvbU1YZkluTmU4?=
 =?utf-8?B?d3AwWlpqWGY2TXcwQ0JyYnE3bmMyL0FybEtSbndsNVY2ZGFWOE4rZG1PcHl5?=
 =?utf-8?B?Z2VWRXJKWnN4SDNRUDI4dmhZRlcrNDg2Z0RXb2dGWHA4ZGVPdE16OTgyanl2?=
 =?utf-8?B?aTN4QmhFaXRua2ovWnp0eldDY3N4TWdEazk0WkhXb0hEUWlxdXVPZ1hwMVVF?=
 =?utf-8?B?ZWdRZjNCdkFBWHZ6SjJUL01zWUUxNGNhMVo4b3hqUE8xUkF3VG9FdlZoWmFm?=
 =?utf-8?B?N0Ezd3NZNlZ4VDJuV1FCa0hIcGpOQkx6bEZHcmRCaHlTeTdBaUhWZlVqUW5X?=
 =?utf-8?B?NW9SV3I0d21kTjdPeUgwZXFrS0FuVmRaNGdNNUhHOTdMMHVhcVlKUnpjNWR3?=
 =?utf-8?B?UzVLSGNWZm51aDdBMzRoUS82M3pmbFV2am10UGNUL080RmZLOWVxblN4Vlhj?=
 =?utf-8?B?T0JNQUhIV0ZPU0VZcitGQlZkNkpJZ0pJYWFHUk1mdEpLdUltVURLSmJoWFdE?=
 =?utf-8?B?SkNuVFBwK2xXdi9RWUdmTDl4T3JrbzBtK2t4OGlNaUtoZlJXQkNNeHQveU1T?=
 =?utf-8?B?RUtwNjZlSDkyc3UxL0lwVGNhdE5SV2tibEs3L3N2UWNFTWk0VldMNXhJbVF6?=
 =?utf-8?B?Y1Z1a1ZydkkvczVLUWdQZUUwSW04OTBKQWsyYUJhNDRHTXpxWDFLaDlmYlh2?=
 =?utf-8?B?Nk9DdkFFR3g1WVBWdVFwNzFKdnJ2UndQK3hsNXhMWm13UXJ5U0N2dUk2QnV3?=
 =?utf-8?B?bmI0WGtZY0NMRTErUm9qOFFNVzArc3dVOGFUaFl3Q3NtblBUeWNDUEZQOVg1?=
 =?utf-8?B?NkNvOG9QT0VJQzhKbWc5QnJNZGZpTFFoeGR1dFE3bVJscVN4Rzk0UGltdWtQ?=
 =?utf-8?B?VmxGMzJmaWFRUzNlUUJtUy9SbHIrZkh1VXlwbENwRXoybTFFWFBnMjZJamhs?=
 =?utf-8?B?ckZScUViV0dyYW9tRFU1SmpGcis3VDhKWDl2U3JmdFZYYVZjdk02U1NPMjA2?=
 =?utf-8?B?ZitqQ0hERnV4OUN1TGZIa1NwZmdvekNjR3kvZ3VmeWw1OG1qNTcwVEp6R3p2?=
 =?utf-8?B?SUJnSk9McHRMRVQ2UUdjczRDeEFKcTdzc044b3R1THBneFB2ZXNZVFVTRnNh?=
 =?utf-8?B?K0p6aVRLeHRQcG8wVklTdWxZb2hVL0NMMHd4bzE4aG5JSzl4NndFeENyYVg2?=
 =?utf-8?B?cDZTaStwZ0lUaGw0WmNDS09iZ2hxZGtncGY4cnVhRXVWb3VPOHZRTWQ0Q3FZ?=
 =?utf-8?B?bmJuU1RTYzdNT05QbWJHN2lFeFZpNWhUV0h0RnlCWjhkeDZUUys4aW9HekZL?=
 =?utf-8?B?YWZ3dXpVTS9zWnhvZytHK1ZvRlhEVTg1Wmo4eUhMRkgzSFVYRU9qeW81OVh0?=
 =?utf-8?B?eU4vQ21WWG0vSHZvdzYza1pJRG9aMFh3V1NYaU42UjgxSnhlVUo0N0lTZXB2?=
 =?utf-8?B?TDgyY0E1ZzR2TzFza0V1enI3d21BN1hOSUc4dXFZcE1RNG9qLzFOMjAyNGZP?=
 =?utf-8?B?VlU1YkRKclYzc0o5NzlKMWN3ZlcwbUY2M2FYUG5rdXBwSm5QZ3E1VncvS1pO?=
 =?utf-8?B?cG04NWI1MFlYbVZaUTk5aldKMko4Q3NreGhFNnF6MDVrN2oyR3RZRTNBdU16?=
 =?utf-8?B?b2FCRjJPZXZPZzBac0hTUlBDQ0ZlbDVZeXVBOGE3SzhwSGk5NlJsR043L2RE?=
 =?utf-8?B?THBJMmJ2U2FhSjZCSEVxMVl2MVlKd09aMVVLSUswQnltdUdjWFVobEFTMUNB?=
 =?utf-8?B?b1M0anoxWWlnUWtyaWZXKzVVRHlxQmEzSDliSGJtTGZsSHFtV0RPb2txY0ZP?=
 =?utf-8?Q?0ndlnJkiHyID/irBsgpaCyDco?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7f2642-283a-4f0f-dce7-08dd8e3ec2a6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 14:43:56.4762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2N7Kd/y1++0rmj/oqatb9MNiOJCfVkb6HJZj6g+kqCzTJbjedrMh0ZY9GuJ7Fl2ynPCnU7Vy+ymr+LJ7cp8CWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6191
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

On 2025-05-08 09:38, Murthy, Arun R wrote:
>> -----Original Message-----
>> From: Alex Deucher <alexdeucher@gmail.com>
>> Sent: Wednesday, April 23, 2025 8:51 PM
>> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Wentland,
>> Harry <Harry.Wentland@amd.com>; Leo (Sunpeng) Li <Sunpeng.Li@amd.com>
>> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; dri-
>> devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org; alexander.deucher@amd.com; Jani Nikula
>> <jani.nikula@linux.intel.com>; Syrjala, Ville <ville.syrjala@intel.com>; Ville
>> Syrjälä <ville.syrjala@linux.intel.com>; Kumar, Naveen1
>> <naveen1.kumar@intel.com>
>> Subject: Re: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
>> async flips
>>
>> + Harry and Leo

I didn't go through the set thoroughly but had a look at
patches 1 and 2. It looks like it's simply a copy of
IN_FORMATS for async flips, which makes sense to me.

Patches 1 and 2 are
Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

>>
>> On Wed, Apr 16, 2025 at 2:33 AM Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com> wrote:
>>>
>>> Hello Alexander,
>>>
>>>> -----Original Message-----
>>>> From: Murthy, Arun R <arun.r.murthy@intel.com>
>>>> Sent: Monday, April 7, 2025 11:14 AM
>>>> To: dri-devel@lists.freedesktop.org;
>>>> intel-gfx@lists.freedesktop.org; intel- xe@lists.freedesktop.org
>>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>; Borah, Chaitanya
>>>> Kumar <chaitanya.kumar.borah@intel.com>; Syrjala, Ville
>>>> <ville.syrjala@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>;
>>>> Ville Syrjälä <ville.syrjala@linux.intel.com>; Kumar, Naveen1
>>>> <naveen1.kumar@intel.com>
>>>> Subject: [PATCH RESEND v13 0/5] Expose modifiers/formats supported
>>>> by async flips
>>>>
>>>> All of the formats/modifiers supported by the plane during
>>>> synchronous flips are nor supported by asynchronous flips. The
>>>> formats/modifiers exposed to user by IN_FORMATS exposes all
>>>> formats/modifiers supported by plane and this list varies for async
>>>> flips. If the async flip supported formats/modifiers are exposed to
>>>> the user, user based on this list can take decision to proceed or not and
>> avoid flip failures during async flips.
>>>> Discussion around this can be located @
>>>> https://gitlab.freedesktop.org/mesa/mesa/-
>>>> /merge_requests/29618#note_2487123
>>>> Mutter implementation for IN_FORMARTS_ASYNC under review @
>>>> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063
>>>> Xorg/modesetting patch
>>>> https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1816
>>>>
>>>
>>> We have added a new drm plane property to expose the format modifier pairs
>> supported by a plane for async flip.
>>> Can you please let us know if this implementation looks good to you? If so,
>> kindly provide an Ack.
>>>
>>> IGT implementation: https://patchwork.freedesktop.org/series/146853/
>>
>> Seems reasonable to me, but I'm not as involved in the display side anymore.
>> I'd defer to Harry and Leo.  @Wentland, Harry, @Leo
>> (Sunpeng) Li can you take a look?
>>
> If no other comments on this, can we go ahead with the merge given that we have ACK from the following user space implementation also.
> Mutter implementation
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063
> Xorg Implementation
> https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1816
> KDE Kwin Implementation:
> https://invent.kde.org/plasma/kwin/-/merge_requests/7277
> IGT implementation:
> https://patchwork.freedesktop.org/series/146853/
> 
> Thanks and Regards,
> Arun R Murthy
> --------------------

