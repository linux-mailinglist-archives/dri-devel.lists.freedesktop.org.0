Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2253AE204F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 18:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABF110E117;
	Fri, 20 Jun 2025 16:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESdruGJ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F3810E117
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750437864; x=1781973864;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Y1ZxuM8LhtJB9ZwIl1A6m6KtkNAIZd8c+lo9jyXVLhA=;
 b=ESdruGJ0iioM0V6yhsPLMG8A8I8TM8PTRnfneAj60ZYAV1bI5/UI8FXE
 r4CoZ3ks0VBKkjV6CJpfuNS4FqJHq9Mv8KQcrxRHqzi0JLCTgYqeBHcbG
 WYLqFDIzPV3Vca960YKvZRDFE+DQmfV+nPDrdRt8XFXbqdUBugqzS6cfA
 OHzu7Q1cXWZVlbRnIowRV0vjP6tuTFSRTfGLfYb9bm5Z7oVkPms+TYjWn
 KTxifjom+L8Pa61BzErtbv1VSUGQ8zAn8PPd3jWuybLNvdVlcWtkuYUQx
 00rw1PD4nv4D/urQMVX90V8vtdAP+oD7/JcY2iAjjoy3KUSplGFcO8Qfu Q==;
X-CSE-ConnectionGUID: 0yquhXqCS4aHPSchQ60OYA==
X-CSE-MsgGUID: zGWGdmlMQb2aStxKbM7b3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70276346"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="70276346"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 09:44:23 -0700
X-CSE-ConnectionGUID: KIjrSnsnSCOqCWhNSvdhSA==
X-CSE-MsgGUID: shbrI7HQR8eOcRI2A0jNlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="151643845"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 09:44:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 09:44:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 09:44:22 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.75)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 09:44:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgJWKWfb/YNpVZ6SedJJ1Hm2TEjX/6Bn+2OLoDPh4Pd4n4d59Q9CZFhGwnRJov9XqoUPNtuVUAS/1BaX3oNsxRrR/CR8XBaZ8unYgkMoudmS6Aau90I7l5o5F/A4qcF+octlvpKYY46KUtDU+COCazUXDU+Me+8TaMlYMO29Cw4JHT5kQQPPd8KC1ZLaRQohXURKREOdXYgxetjZUVODtc98rXbuoLlw1eb6BDViPhxNeLSyqqTSh7qmISEBc4HszL4CD1T57zZi8N9Mf2cDossejPogRQ+/fDY1LN7LMeHu54YdFBIBpgnXkQoCpNhBeBsJh4u1KMsjYhVJowru3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6A25DJUSOrY12hUoSne1Yhiy+c7YWN4Li/j7R6dXGc=;
 b=V/zXFdr0dFhLT9ZhVNcIH24rG6LS5Ov3HwA8uSReTv8J4aQ1PK0Q7EDbw680YJh9uR6mQXFaZ31Bqh2s0ZpFO83pf/np/eL9v9aaikajk6rcd5Ld8IBlXog1OuXPC0DboAlkZfoyCR3OdTlwLTqhMNIJ7qTkK+zPsCx/GIRtbp8onbufz6w4Z9mDjqNrHYjQrJ2UiNIY0jPZ7Ll3e8BrD/N6AlXJ9PdN6RGvRztqtDWf2w50wmXlXc4AD5Mh38FOyPAVch2p6kGu+xBdGYLSndN9PTAQvWpl1p2ZgSW4HQ/rgxsUrWxtc01U2zNuRkQMeH8QxF6tCkPUGKUzI6oH6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 20 Jun
 2025 16:44:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Fri, 20 Jun 2025
 16:44:06 +0000
Date: Fri, 20 Jun 2025 09:45:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <dakr@kernel.org>, <pstanner@redhat.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: DRM scheduler issue with spsc_queue
Message-ID: <aFWQOC+DlY7NTXAi@lstrano-desk.jf.intel.com>
References: <aExZdkcnBVvX1DCa@lstrano-desk.jf.intel.com>
 <0b0b8367-abd4-4982-aeec-08f8b95a286a@amd.com>
 <aEx3zmQ4T1n5wdKO@lstrano-desk.jf.intel.com>
 <7636678c-d5fe-439f-a86a-4f038e7cf692@amd.com>
 <aE_1LTJoszaYK49i@phenom.ffwll.local>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aE_1LTJoszaYK49i@phenom.ffwll.local>
X-ClientProxiedBy: MW4PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:303:b9::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fd5eca-8682-4351-5f26-08ddb019ac0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmZoQTBJOHNWUTkwMzZZMnlPZWFoOUdndHloUEQvVHdxUTlZcERCZ1pNZVNC?=
 =?utf-8?B?Sys4a2o5MG5oOSt2Y3AveFVCMi9sQ2t1aXRpV2FLWDJIUGszbi93Tm56Q3JW?=
 =?utf-8?B?ZVBhdXpkRFlYWkZGa1gvUHVsYkZWekkrOExoQzhSbUJTclFrRzJMZ0xWQXBl?=
 =?utf-8?B?MHMrdE1ObHljaEZjVU44MFdiejdMV0pNaUpNNWZ1OWJUYlpEWXA0d0Z1UmxU?=
 =?utf-8?B?VXdOTmxqZXhqN2RwaWVBbE41Tjl6eFF3ZnFuaUNRSVFibXlia09vV3RNNW5E?=
 =?utf-8?B?S2hZSDRTdWhCUDV5NE9BaDRvWFdBa043NnFiMGp0dENXY05YdTI1cHg4VC9S?=
 =?utf-8?B?RGEwTEUwUXZsWjBIOGJCdkJsdmE4RlNVK2RHaVAvZXlHbDY3d3g3bzRjbEFQ?=
 =?utf-8?B?NndEb2dRaXpldURqdFA1aFo1U1U5U0V6Uk9TdEp5TTEzL3hja051OURMNkZh?=
 =?utf-8?B?ei9kMVJ4aGpkcXg0QmhJbDE4WFoxV3JCdjBLaDd2bDNYV01jTnd3dUNLUTJD?=
 =?utf-8?B?NWsxOXErbDJHT2I1VmN4NkcybEZMb0NPV3c0akp5c3ZmZ2hBUHhPSisvWmJY?=
 =?utf-8?B?bUR2Sm8xZXN3Snhld2NLNlFTejZBZmlqQW9tYlNBb0NKU3NVQS85djU0UmFn?=
 =?utf-8?B?OEJ4K1hFZFlNbHhpTWwwdjBMRE42V3lOa2xpSVVOOTFvWVBkT1RhRHdXR2Ux?=
 =?utf-8?B?MnFOYzVBRVFxUHpOWDVhcGMvdXQvZlhxNTVvdUVtOVlsaEcrM3cyQjNwQ1VS?=
 =?utf-8?B?bnZ1cmZ5aTh1WjBLWk1Yb281cXpESnNiWHZHY0FlUWRSQXhqN2hYWkZ4YkNa?=
 =?utf-8?B?N2J5MTZGRmgzQ3FBQnE1c2xPWkR0ZDRLWjBHYkhGdnA1d25nSmNTY2pUM0NP?=
 =?utf-8?B?SmxtWXB5L05VaTFQa05VaWZPTmxWQWlsbEp0QUZlNTZtbkdHYURhZHRxQkdt?=
 =?utf-8?B?eTM4QzlwV3o3akZ0RkZDNlo4RVRCNnJvRDZQRWNhRkVsLzg0UC95TDhJOVdI?=
 =?utf-8?B?UDA2empMSmtDZXd0bWEzd1ZCcVRHSWpXRDhqa0xHMDZJaWR4L0x3OW5CNXIz?=
 =?utf-8?B?VGVtUHR5Zi9ya1VhbEUzWmhtNk5nTFlMajRSTHlCeStVb3VMbEhnY1lGQ3lv?=
 =?utf-8?B?STRsN3JRYzA3VEF0L25PVkdPdU5oQ295eFpFbnBheUh5UjVIUGZ1TmJ2N0Nv?=
 =?utf-8?B?a1VVeWJkN1AzMlVrL3daakZMMWJBQ0ZCbWNubUxGeGVQK21vTEZDbUhqVHI0?=
 =?utf-8?B?eEZ3ZVV6UVNodUxHeTlEVVVvNVJaU3ZIaVpPNzMwTktIeFNJUDg3cmN3cFBC?=
 =?utf-8?B?SkZBeHE5K2FlZWhYYWRRR0xUazkrdmdTOVVMRlVzMkt0QUtXTThudGJmMTNk?=
 =?utf-8?B?VGFtYmVTVllYTnpBZmdTRmJETXZnN1c4cktFdTRwVmdEK1ZjQ1ROU3pDdkpQ?=
 =?utf-8?B?SnZGMGNrN1JvZ1pRQmdpNzBucE45WnE4OWVhSTJKR0pnV2NMcmRVMjgzNk9y?=
 =?utf-8?B?NXVXMjRKUUl0Nkl0VGgwYkgzelNwL05jOWxFN2FBLzZmSEhxbXk4RnJoTUVy?=
 =?utf-8?B?VjVZQVhzY1lCNFNuZWdrWUpnVEZoQVFNNnhyQTFqV0QzS1pLNHNlZWtOamR0?=
 =?utf-8?B?ZTFKU2hNenNQcTU3eHE4UEZGcGNmcVdGOWNZWTZFSHk2eHFUTDNzRmd3Y3pj?=
 =?utf-8?B?eWpKVzd2MDgwK2Zud0JZUGZodUlPd09vV2QrVEFqSGsydTU4NENjbmQwS3hH?=
 =?utf-8?B?MGlUTFhvSjY4YTFwWnpuanNSTXVSVVZuczROTEJrQW1nZWRpZlZSRE5VLzFY?=
 =?utf-8?Q?U5Y0RXRLEIcLPG4q2dUfEjHTlMQ09o8AiFYHg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXpTS1dTZ0lnaVpNZW1lMnNobUJoWGRVdU93RFVoRGhTMmlRWWpNU09kOTFh?=
 =?utf-8?B?cWxRUXp0c2h1VFc4bFFvcVR5ZGxxVnBmRzl2U2ZaNDc5MEc3WC93NTdHaXo2?=
 =?utf-8?B?TnllZi9jVmViVHZrckU0YjczakMyT2tVbG5iSzM5NHZ2SWZNMWxxbGxBa2py?=
 =?utf-8?B?OXZzSWFzZUgvMlhXYVNzdVExQkNPM1VhenRZMUgrRWVTeEhxb1ZLVHYwTU9E?=
 =?utf-8?B?OXhoVzIyMHJNRHVkaWE2U3E2OTE2SjJ4TnlwRnlvdVJERFZiVFJhcnp3dytI?=
 =?utf-8?B?K1NhelJheTZUSG9FQkJXV28vZExkMlhMN040aFp5cEh6Y2FGVU9IbzJLMEgz?=
 =?utf-8?B?cjlSVlUzSGFvVkhDeVNLRFlrSXpxZHVHRGxHM3RCQjg1WU10ZTQ3WDNUMzBk?=
 =?utf-8?B?ckV6Q3NaMElJb2RIZG9kcTNYTXNEcitNdlRFZUIyWGFPaWsya01CalhvSHFl?=
 =?utf-8?B?QmhFckRDU05SM3pKQ0NuZFVWdlNrZVBnak94dVJNWXBYWUo0a3l5M014Zlor?=
 =?utf-8?B?NExDcEtHb3FVc2dKTlUvdk5kMjBSRTRMY2ZUNkNLRUlGOU05Yll5blZmblZC?=
 =?utf-8?B?UDJRN3hGK0NUbWxaek9pZkVFRDUzaCtYcytCYTZKZEM4dnlvaEVEeHJRRmFo?=
 =?utf-8?B?RVBIWC9EcDgxbFlka0d1Mzd3VXY4TWNwRzlSUGpqQzNuMEVrcGc2czZzanA5?=
 =?utf-8?B?WDcrZk9ZVllPSFlsUTBzMWl0bXE3K1dBUmdHODJ4OUpKbi8yWFNyMEtFbWhi?=
 =?utf-8?B?MzdTZjNnTGlka2tvaTNXSEcyTGsyN2N3aWVTTXRjNW1CSGlQSWo3bnRBdGJS?=
 =?utf-8?B?WkNHbTl1M2FjWFQ3MWNGZlV0eS9ROUtjeU55WjhybkZ4NExFQlE0Q0o3dFlk?=
 =?utf-8?B?QXFjYTBhZHEzVWQ3eTBZWDBqc2hnekxGSDFFSEJCNm93bU5SNnBNSHdPYVBX?=
 =?utf-8?B?Q0RKd0hUd3ZrN0xTVmx5TzFHZ2dibXRTaTAvTTZ2THEreitodmR1S1NHejMv?=
 =?utf-8?B?UFJxR05RT1NkdnNzMkZTMHYycVNYNWQ5ZEYxQXcyL1JhbkVQUERkb0oyL0pj?=
 =?utf-8?B?S3h3c2Nvdm4zOXJIeTBYd3Fhc09hbU1aY0ZPdzZjTHk5UjVsMUpWSXJaRitm?=
 =?utf-8?B?UWE5amVwakN1Ylp2V3R4cHg2UFVmdGUrQ0xJWVl1UlA5aTk1elRtOG9ZQkQy?=
 =?utf-8?B?TWtaNkxaZmVzNGg3enBiTG1VbUxDdmtZbjl3NWlVODIrcHNPSzFYL1JNOEZS?=
 =?utf-8?B?cEhqeU53VmQ4d0poVFBYc0ZWSWZSUGlRM1JqWlhpUVdVSThsbGVnVnA5UVgz?=
 =?utf-8?B?TUk4TGNTc1pPUkIwUzFEaEtZcm9BTDFOTGFibW14ZVVoU0tsVTBQTWlzTTBk?=
 =?utf-8?B?OHpVaElENFZrTlR6aGpQKzF4akhCQ28xZHJGMWNUWnR2WmZJc1drUmZLSG11?=
 =?utf-8?B?a09oQ095aU9taW1wa0l1NkpqRkhqUDczcTZVNngvWUJ2YURtcVpuYU82Wmpn?=
 =?utf-8?B?U3I4ZmdMT1dmMWI1L3dPK0pYQndFNjR3ZnVzdDdNV05YNzVYT2VhYzFKUzNT?=
 =?utf-8?B?dUU2aE9FeHJoSFNheURJZm0zeDFhNGdzbGhlYnNEcVBRaXAwSU5jYnlkUFF2?=
 =?utf-8?B?U2x5aVowaGE2RXhRMDA2c0I1dTI2UjRtZVcyVGZ0ZW04Z0ZLMzAvayt6WUxv?=
 =?utf-8?B?ZXZYdzA1YW1BY3k3UUxINTBIcVB1UzhmdXhwcS92MXZqRVVidi8zWFhYMmVY?=
 =?utf-8?B?SnYzM20rS2pKWWxrN2RiQUlqZk8vWnNTNFN1Tkg1K1ViSjd4YTRKK3lGT3Zk?=
 =?utf-8?B?dmFiL1VhbkF5L3pjb2NCZU5aZzh6UzZ5cEZnaHhad2JCM0hmNmdiTmdlQTZx?=
 =?utf-8?B?RHd5R2FFNmV0eFZ0T2ZFTHU0QVZEVE1vazBDWFluY3RCUHdBNXhZeCtLdGdX?=
 =?utf-8?B?M0NKRTFPU1ZpUGFXSnUzUzJINXV3WFB3YVlyVmcxNmdhaWhaVjU2SGlnd05n?=
 =?utf-8?B?YWNIZ3NzQWtpNWxZZ1o4aW1PbzNWZy9RTjNnNU5VOEN5TXRlRDM5ejlwcU4r?=
 =?utf-8?B?akR5VlFlOENRL3JNK0Z5MU5HNDE0RVhCYVJ3bXNmNnIwM24rN3VKd2hhNHRR?=
 =?utf-8?B?WFBxQ3liRkRNa2h5UGFIUFFMSTc5NEc2VXhJTG0xYkVyeDlNUFllY3MwVHAw?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fd5eca-8682-4351-5f26-08ddb019ac0c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 16:44:06.5094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKI+xuRH9QKZH7VyEUIGA3V2BrPmln2QhqlLmDi7n4yBM0DnEXnDxQugFeyCa+r6gmc7Edy1fgyeN/GnvILnfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
X-OriginatorOrg: intel.com
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

On Mon, Jun 16, 2025 at 12:42:53PM +0200, Simona Vetter wrote:
> On Mon, Jun 16, 2025 at 09:24:38AM +0200, Christian König wrote:
> > On 6/13/25 21:11, Matthew Brost wrote:
> > > On Fri, Jun 13, 2025 at 07:26:22PM +0200, Christian König wrote:
> > >> On 6/13/25 19:01, Matthew Brost wrote:
> > >>> All,
> > >>>
> > >>> After about six hours of debugging, I found an issue in a fairly
> > >>> aggressive test case involving the DRM scheduler function
> > >>> drm_sched_entity_push_job. The problem is that spsc_queue_push does not
> > >>> correctly return first on a job push, causing the queue to fail to run
> > >>> even though it is ready.
> > >>>
> > >>> I know this sounds a bit insane, but I assure you it’s happening and is
> > >>> quite reproducible. I'm working off a pull of drm-tip from a few days
> > >>> ago + some local change to Xe's memory management, with a Kconfig that
> > >>> has no debug options enabled. I’m not sure if there’s a bug somewhere in
> > >>> the kernel related to barriers or atomics in the recent drm-tip. That
> > >>> seems unlikely—but just as unlikely is that this bug has existed for a
> > >>> while without being triggered until now.
> > >>>
> > >>> I've verified the hang in several ways: using printks, adding a debugfs
> > >>> entry to manually kick the DRM scheduler queue when it's stuck (which
> > >>> gets it unstuck), and replacing the SPSC queue with one guarded by a
> > >>> spinlock (which completely fixes the issue).
> > >>>
> > >>> That last point raises a big question: why are we using a convoluted
> > >>> lockless algorithm here instead of a simple spinlock? This isn't a
> > >>> critical path—and even if it were, how much performance benefit are we
> > >>> actually getting from the lockless design? Probably very little.
> > >>>
> > >>> Any objections to me rewriting this around a spinlock-based design? My
> > >>> head hurts from chasing this bug, and I feel like this is the best way
> > >>> forward rather than wasting more time here.
> > >>
> > >> Well the spsc queue is some standard code I used in previous projects and we have never experienced any issue with that.
> > >>
> > > 
> > > I can quite clearly see this not working on my test setup. I can (kinda)
> > > explain it a bit more.
> > > 
> > > Look at this code:
> > > 
> > >  65 static inline bool spsc_queue_push(struct spsc_queue *queue, struct spsc_node *node)
> > >  66 {
> > >  67         struct spsc_node **tail;
> > >  68
> > >  69         node->next = NULL;
> > >  70
> > >  71         preempt_disable();
> > >  72
> > >  73         tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, (long)&node->next);
> > >  74         WRITE_ONCE(*tail, node);
> > >  75         atomic_inc(&queue->job_count);
> > >  76
> > >  77         /*
> > >  78          * In case of first element verify new node will be visible to the consumer
> > >  79          * thread when we ping the kernel thread that there is new work to do.
> > >  80          */
> > >  81         smp_wmb();
> > >  82
> > >  83         preempt_enable();
> > >  84
> > >  85         return tail == &queue->head;
> > >  86 }
> > > 
> > > Between the execution of atomic_long_xchg and atomic_inc, the submission
> > > worker could dequeue the previous last job, reducing job_count to zero,
> > > run the job, observe that job_count == 0 (drm_sched_entity_is_ready),
> > > and then go to sleep. This function has swapped for the previous tail,
> > > so it returns false (i.e., not the first, and does not requeue the
> > > submit worker at caller).
> > > 
> > > The race window here is tiny, and I would think preempt_disable would
> > > make it impossible (or preempt_disable is broken drm-tip a few days
> > > ago), so I’m still a bit perplexed by it. But again, I assure you this
> > > is, in fact, happening on my test setup. My test case is an SVM one,
> > > which involves all sorts of CPU/GPU faults, migrations, etc. Not sure if
> > > that contributes. I can show this race occurring in dmesg if you need
> > > proof.
> > > 
> > > The change below fixes the problem. I'm going to post it to unblock
> > > myself.
> > > 
> > > diff --git a/include/drm/spsc_queue.h b/include/drm/spsc_queue.h
> > > index 125f096c88cb..ee9df8cc67b7 100644
> > > --- a/include/drm/spsc_queue.h
> > > +++ b/include/drm/spsc_queue.h
> > > @@ -70,9 +70,11 @@ static inline bool spsc_queue_push(struct spsc_queue
> > > *queue, struct spsc_node *n
> > > 
> > >         preempt_disable();
> > > 
> > > +       atomic_inc(&queue->job_count);
> > > +       smp_mb__after_atomic();
> > > +
> > >         tail = (struct spsc_node **)atomic_long_xchg(&queue->tail,
> > > (long)&node->next);
> > >         WRITE_ONCE(*tail, node);
> > > -       atomic_inc(&queue->job_count);
> > > 
> > >         /*
> > >          * In case of first element verify new node will be visible to
> > >          * the consumer
> > 
> > I need to double check the code path once more, but that we got this wrong while could certainly be.
> > 
> > The code originated in userspace and atomics are also memory barriers
> > there. Sima had to point out that we have to manually add smp_mb()s here
> > to make it work. 
> 
> Yeah last time I looked (which I think was years ago) spsc lacked the
> needed barriers, and lacked even more the comments to explain how the
> barriers match up (since some are there as implied ones). I kinda decided
> that it's above my skill level to really dig into the entire thing and do
> a formal proof and all that, which is imo what we need for lockless code
> in the kernel or it's just going to be busted in strange ways.
> 

Yea it took me a while to figure out what the SPSC was doing too. I
can't confirm it is correct after my change either.

> Note that thanks to compilers becoming real good you need barriers even on
> x86.

Ping on this patch [1]. Any objection to me merging?

Matt

[1] https://patchwork.freedesktop.org/series/150260/

> -Sima
> 
> > 
> > >> This is a massively performance critical code path and we need to make sure that we move as few cache lines as possible between the producer and consumer side.
> > >>
> > > 
> > > Well, I can't say I buy this argument. If you can show me any real
> > > workload where using a spinlock here vs. going lockless makes a
> > > measurable impact, I'd eat my hat. Also, FWIW, this code seemingly
> > > violates the DRM locking guidelines we're all supposed to follow… But
> > > anyway, I'll go ahead with the fix above.
> > 
> > I probably have to take that back, see another comment below.
> > 
> > > 
> > > Matt
> > > 
> > >> That was the reason why we replaced the spinlock with the spsc queue before.
> > 
> > Well we replaced spinlock+kfifo with spsc the for round robing peeking implementation.
> > 
> > Background is that because of the spinlock even a "peek" transfers the cache line as write to the sheduler thread, and when you do the "peek" even on the idle entities then that starts to not scale at all.
> > 
> > Since we now have the FIFO implementation and avoiding peeking all the time into the job queue of idle entities that might as well not suck that badly any more.
> > 
> > Regards,
> > Christian. 
> > 
> > >>
> > >> Regards,
> > >> Christian.
> > >>
> > >>>
> > >>> Matt
> > >>
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
