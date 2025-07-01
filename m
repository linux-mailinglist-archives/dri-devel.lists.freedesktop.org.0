Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB60AF01F2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 19:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94AC10E2E8;
	Tue,  1 Jul 2025 17:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ka/YKNiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2909110E2BB;
 Tue,  1 Jul 2025 17:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751391305; x=1782927305;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WgJ79Eegaj5Q7Re+1drlxfIDedsO/idu8C+ZEWUEXbg=;
 b=ka/YKNiA8PyK1SXcQHPkboz1gpqzHUjq+sy2mTXAO6xGSzsymxgdTqJm
 TZnxTaUrikYQ65qCWKmDAO6kKLjwZK6yVrxH9+9lYzpus0uff+D5YV95N
 uIAJpgFiuR7+dPcGb4Sckg2wLMIeGj/K5lsRUUJbhUNHBnFN5dsKn5Xt0
 rZIvhlSWFbV3JwL3dfvq7saOaHTQ8aoGxx2WTLZAxCMNg5x+JelRWMRTR
 n3zqpUwb0W0lu/C6mqrZ8KjfWy88/NhAWIJtJuFNqgLU8D2xuLzaPJWk/
 b+10zW57ABo3OVdyHtzobpePJjNtcV1/2iZxUZB389jigs7lz4l5u7dSD A==;
X-CSE-ConnectionGUID: 94i4tSYSQXus1ir0M8U9uA==
X-CSE-MsgGUID: JqQXlrycSP2ploAJ8S6L/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53812948"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53812948"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 10:35:05 -0700
X-CSE-ConnectionGUID: PBrQ/mpOSqub/1HoEijRtw==
X-CSE-MsgGUID: o25a6tDHSKaW3tO5Yd1elQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159548223"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 10:35:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 10:35:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 10:35:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 10:35:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoL3VaOzoUSpN5OFYCzbO2D/Oy4Fe9cS5RNL2XlfaqivUgonibwSilOCsxvc4qQ4lQdqR3pgX7+B+33TQY1BXuIsWTBL0qCzbF94q4raAwnYRP4AOyRkVWKY3pHuXnrarUJE8tG9vIUPIr2sZyHLaDg7AKpS8TxJNHSHNijnNnLYlk15we76OycDcSAjV1hP/sJSPqf9KwDJVUC4BFiZaal/FUI0+frMEsX9fKTzolIDRm3SKjjX3oR5kjm5H1o2Qsm6N/UEdh5Q/k1Q/SykEWMfwab9hWvfkFNIT298CuynT8GgfNQt2ke8uBQfaouuayFhBwa6roAZXogs/AU2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFaOhKEnPyiBZsI8QsJX9LB0fZCcszqligshbHfa0uo=;
 b=T+shsnQdC+9P7IgZyN26FNNMZgEXwwgrdSjUolhZ0NNLE+19RkGMikoYxIfF62jlJYN4IVpmMgst02/JxezNB8PTDdiGjQ0wlBjdQ8GhLiZ5okDknRkSSyHaENzPZ4OqNa6iI0Dvi8h19Gmmm4CE7lVXpx91SMj8ZF5d+koAM7w0hogF9BJ8iDk/Zg8f3FLmONerwo5ntsRiWXEQ/ho6ZTZemblrIc2EutlDOr7ohxSM9McR1oNozrjB9UFMaGdmTD7MAh1o/3/jAXo3tvpwRBIkz9ID+Nk2vAcjkeZFdsz5O+SmNBEnIzMb+7ktDPgAO7WgTgRSy4Qyvd2FNJEwSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Tue, 1 Jul
 2025 17:35:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Tue, 1 Jul 2025
 17:35:02 +0000
Date: Tue, 1 Jul 2025 13:34:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Greg KH <gregkh@linuxfoundation.org>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <anshuman.gupta@intel.com>, <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component driver
Message-ID: <aGQcQbiqDxKplFZO@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062834-scraggly-barracuda-7ea6@gregkh>
 <205cc43a-4254-4d27-9b4f-139006e871e4@intel.com>
 <2025070140-dad-jaywalker-0774@gregkh>
 <eab7307a-d6a2-402b-945b-674e9c5f608b@intel.com>
 <c48b565e-73c9-4222-83b6-dc3597427db6@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c48b565e-73c9-4222-83b6-dc3597427db6@intel.com>
X-ClientProxiedBy: BYAPR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::30) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fbf011-c546-4ec7-b0e5-08ddb8c59bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?K0kUrKykv3/83M2jImgDMSonnwBm4rvSq6rOS0QDy1PlzeWZ6PQo4tW+xc?=
 =?iso-8859-1?Q?Ln5SyMeOQg1U/BU62oBidrCutcy5DhIHjNPbeLtMjnCo5WXm/+bxyWu7Av?=
 =?iso-8859-1?Q?FvZeILevjORopb2WbjfnkvXwr3RbDHxeqIIXBZFSomjHa8bQO/nEGAiF6F?=
 =?iso-8859-1?Q?I7hLFyFn3xb4ba1CzdYJMOWVkx3MDeiDtAhF4QZKReWD5wBsnfLSMbYMh2?=
 =?iso-8859-1?Q?7m4XPA/SGC6PEkwxl0opuIZfbCdu5qnqw6iHNG4XykN97+QCFGl8He9+f1?=
 =?iso-8859-1?Q?d//6OXBXQoRA8pH5oAevkC2y1Oit2UKTI5ssj07TX1s383WRqp/TSpCiYs?=
 =?iso-8859-1?Q?HwzfSgOk3DT73MMgo4g2jzUFHPxCx7iumV6FiwAkoeFmX/Ok9f2PzhaGHV?=
 =?iso-8859-1?Q?kwThUMEGEw6IJMNRxpLZNBu/td2dGH68BtLRIBNDPrN4sndvV6/MiGQFlB?=
 =?iso-8859-1?Q?wDFXM7bXDzd9HC9asr707bBnO25l5VKP/8IPOV2rprFSHr+pjGfJjOIOfl?=
 =?iso-8859-1?Q?BApjf5Vj9Mhs9zpPb1kxqgQMHAgl0MOtfnVYLm4mVCKGLq/dovvApNfw9C?=
 =?iso-8859-1?Q?WAVt87imgWdLQnWvIUM6pKhCieR+ZF41pKAUJG4STtlWzHqdi3pxKH5IfC?=
 =?iso-8859-1?Q?AuG31MHksH5uBLpkUR/mM3BEKf7iS4IBDdzkUbNyG6WI3kNcw96bn2Yq5v?=
 =?iso-8859-1?Q?PgUuBv975JhwXGipMOxkT3cF/H7DrZDWH625i8fCzlKMBFr1u6tMqgp/OC?=
 =?iso-8859-1?Q?Us/SpCORcaXLbQwUiSAG5+hBgcLk9B+FvPdIxfOjh50uUXQ455YR1HMXMq?=
 =?iso-8859-1?Q?Gt++89mCpZv+5xjBkkMgT5llmVD0/LaInOBtnw5xXMwUq+FV35MzgEidSY?=
 =?iso-8859-1?Q?WW6QtEEcIYip7dpLVlxxKkXjfWTF5JwMINOFiW5DnOj1NCsgkL/A/l81JV?=
 =?iso-8859-1?Q?0X9xP4Zk4FAGdIZSQ5yTCpH6G1v1t3hZtU2wCiw5CG8JzIrSRURThzi4VD?=
 =?iso-8859-1?Q?ft2iJ7EYh7UaH3JdoWBpF8yB/Xz3UuxenLns6vaNTs2UHgZwka6KycKRS/?=
 =?iso-8859-1?Q?pNVYd09wvy7MPpe7atv+pqAyxoh1NUI6y3Nu8DnPwX1ph5NnsNMBDPehnH?=
 =?iso-8859-1?Q?NBGJHuwKB+NK0KLXSpcb7NDhnMOGcKmK06IBPHDA8c3G52RIAbPhr/6mYS?=
 =?iso-8859-1?Q?IY1CeCQEiw6whwQm3oa7u2rytzd07izQY+aLTFTc6AOJ7HFgV+CjWAmDtc?=
 =?iso-8859-1?Q?ct0mDJ9xAplP2cy0AHVTqBue0SjAsat13EFo0Bp4OV4mhpb/ZHItkvp3wo?=
 =?iso-8859-1?Q?Hg7mxZrwM+gAlguIYeRUULDZqfOrTLALnq+hMW2wYKTHSK78/WPfL7J9oR?=
 =?iso-8859-1?Q?ZqznIiL9A04gOgaEWJ7z0R50KLpw5gyLiuqJUutci1tIgMXeBS9jwzYzBW?=
 =?iso-8859-1?Q?Amyb9LkodQub4aq15huG3TwbYgK5gJmYUqHHthNZi9M6c7ezYcbV7tbOpm?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZJIM9MicyZEYX/whNvRzGxOpEGenelduSfaQSIskOSLRDZa47hLuCW4ID8?=
 =?iso-8859-1?Q?N+mr6YdV03z8ERPBaeufA7T1gBblAxf1cT2EoCDOhFlTRwb4RloSMZVnGs?=
 =?iso-8859-1?Q?IqhN+OzA6twLoK47gq1k1Bn184ZXIO54xVEJA9vH1stwL9JiOZqy0lTO4/?=
 =?iso-8859-1?Q?dV1499WhfAaUk2UXIUK3x1krPDYFEBKhBcuhN4B+bOcvll9y1qAPwqYVx+?=
 =?iso-8859-1?Q?0bAgGEdbkfywVzLQPN4DB9CEXg1vhcPwYB68KrOb9RFPv9ys7dqpvsEcXU?=
 =?iso-8859-1?Q?Fj6Ai9UAHZLS3DDmSChFBxDf7PnflkImW9kYb+uV7Pg4uIRawBlt1Kuyup?=
 =?iso-8859-1?Q?OlucNqtuhdhEky7Kr5XxNGz3HOsObKSpDURac3pxKCHt1ON4+wK3J3kG44?=
 =?iso-8859-1?Q?M+DmFVjn3pwL6jRr42FFS/HkQOn0/RMVvipSiEkDKKKyM5zL5nrJETnOZh?=
 =?iso-8859-1?Q?jk4Jd8uqXBFuoBNKzsjYVi7Ua9GafWuw0hFUFNhTIfsO3pJlAKyfOHJ0oX?=
 =?iso-8859-1?Q?M8M2ui8HYKfL/Pmb0GwDckqzBNtUfhuFszLFoCWKwUCgbIGXjEClkS0mI9?=
 =?iso-8859-1?Q?jBw0c+cpGNkpwejzzKYNZWsd+V7gA5+t+//3OYsQJWqJU27Tucb68qfLqw?=
 =?iso-8859-1?Q?wmDY4fOZqwck04GteVXqMeADjhYYw+7ZRt+5tVSlEBlWxZmb2fIjXTyjxU?=
 =?iso-8859-1?Q?3d2+G5d/3qTWs1jUqyMMYq8kr3kSOF0Cj5K0QD6KrkaFuV0rVTtvtBo3Fl?=
 =?iso-8859-1?Q?l5x3u/5/AsbO8IrkEMK+YHzOtIpseJHvQW0gU75C7nYl4eNboH/wcQQsyb?=
 =?iso-8859-1?Q?qVAq9QzNS0YoPCypLdY7SfUagIH7HB3NcCplEFi0mHENM7svKrZ/9U4KID?=
 =?iso-8859-1?Q?j59bK/tMWD9PDsrvt+3HcpcwM51PxJP0II0Vd5qtgCJJONRA5iVKgDZ+aH?=
 =?iso-8859-1?Q?qZ4NbPGUSLG56k76c6N4GkDxI525FMLYiUTrqdkCyK6muSa4m1ZnN4cpj0?=
 =?iso-8859-1?Q?RhJqaXfJxvtDxz7FwiOf42OqOLzYS1UFcjjeS747U6+xGmuJ4g7g2fkVBE?=
 =?iso-8859-1?Q?WpTawVWLMpI/hvJM2Qq2LFARY4B3itumHY3Hi4j1mopuwffuj6aoTr/v/R?=
 =?iso-8859-1?Q?iY+Q87b0Ficqy+quERaxXMAJvXMMqPUENFgEW7swP633LyW3J4OOb+/+Pq?=
 =?iso-8859-1?Q?G7+MwyzL+rQIEM7912YzLxk6GWmzqjpaXEwARsHoVSm3DBh/X9kb1aC6h5?=
 =?iso-8859-1?Q?lNLFyGe4jI7c29xWydNjoBf9eP1ml54r+q4rThjUUkjoUw/rMe8x6C5JXN?=
 =?iso-8859-1?Q?20hfgnxIGEkxtSmvswsj1RTf8Rw+uhDq86YF+JMWO0iCPKY1CdXW0huDmR?=
 =?iso-8859-1?Q?WlDLaz84Fe6Aw0MEPtHiH/zBHlicL/NF/ARHaTEsocEOuJDOB2GqI3d67Y?=
 =?iso-8859-1?Q?58rEDZIukPXN3r7rU2iKv5Y6G3WNEsjy4MSQD0ODVV+oEhFooARaQ1Yaf9?=
 =?iso-8859-1?Q?8xy9lTusrIndCg36FAKL2oH3iFFY1U80s1QIfyIevcPozS+iGe9WZO+Sqz?=
 =?iso-8859-1?Q?vgaPNK2mwWR/GElwB7kbbEsNZFMr2k1m8DjScshDYTHJIPvU0RM/yrD1wo?=
 =?iso-8859-1?Q?XSLLHdY2EIsB3zArq7UTCUB5+LeczrtOW25F+JY0C9W8FZSwM02Qbw9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fbf011-c546-4ec7-b0e5-08ddb8c59bc0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 17:35:02.0095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFze8NhRtX+aflaf3aXhXx4zviEFs0P7jxbQN9Awer1HsCBdt7asUSYl/QLvNjj7x6YEDSA3OeXXPwzJAOngug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
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

On Tue, Jul 01, 2025 at 10:11:54PM +0530, Nilawar, Badal wrote:
> 
> On 01-07-2025 18:04, Nilawar, Badal wrote:
> > 
> > On 01-07-2025 15:15, Greg KH wrote:
> > > On Tue, Jul 01, 2025 at 02:02:15PM +0530, Nilawar, Badal wrote:
> > > > On 28-06-2025 17:48, Greg KH wrote:
> > > > > > + * @payload_size: size of the payload data in bytes
> > > > > > + * @payload: data to be sent to the firmware
> > > > > > + */
> > > > > > +struct csc_heci_late_bind_req {
> > > > > > +    struct mkhi_msg_hdr header;
> > > > > > +    u32 type;
> > > > > > +    u32 flags;
> > > > > What is the endian of these fields?  And as this crosses the
> > > > > kernel/hardware boundry, shouldn't these be __u32?
> > > > endian of these fields is little endian, all the headers are
> > > > little endian.
> > > > I will add comment at top.
> > > No, use the proper types if this is little endian.  Don't rely on a
> > > comment to catch things when it goes wrong.
> > > 
> > > > On __u32 I doubt we need to do it as csc send copy it to
> > > > internal buffer.
> > > If this crosses the kernel boundry, it needs to use the proper type.
> > 
> > Understood. I will proceed with using __le32 in this context, provided
> > that Sasha agrees.
> 
> I believe __le{32, 16} is used only when the byte order is fixed and matches
> the host system's native endianness. Since the CSC controller is
> little-endian, is it necessary to specify the endianness here?
> If it is mandatory to use the __le{32, 16} endian type, then is there need
> to convert endianness using cpu_to_le and le_to_cpu?

I honestly don't believe that specifying endianness here is **needed**.
I mean, it might be future safe to use the __le32 and
flags = cpu_to_le32(1 << 0) just in case someone decide to port all the
GPU code to run in big-endian CPU. Very unlikely I'd say, and much more cases
to resolve before we get to this gpu use case here I'm afraid.

Weel, unless this mei here can be used outside of GPU context?!

> 
> > 
> > > 
> > > > > > +{
> > > > > > +    struct mei_cl_device *cldev;
> > > > > > +    struct csc_heci_late_bind_req *req = NULL;
> > > > > > +    struct csc_heci_late_bind_rsp rsp;
> > > > > > +    size_t req_size;
> > > > > > +    ssize_t ret;
> > > > > > +
> > > > > > +    if (!dev || !payload || !payload_size)
> > > > > > +        return -EINVAL;
> > > > > How can any of these ever happen as you control the callers of this
> > > > > function?
> > > > I will add WARN here.
> > > So you will end up crashing the machine and getting a CVE assigned for
> > > it?
> > > 
> > > Please no.  If it can't happen, then don't check for it.  If it can
> > > happen, great, handle it properly.  Don't just give up and cause a
> > > system to reboot, that's a horrible way to write kernel code.

I agree here that the WARN is not a good way to handle that.
We either don't check (remove it) or handle properly (keep as is).

With the context of where this driver is used I'd say it can't happen.
Since xe is properly setting it right now and I don't believe we have
other usages of this mei driver here.

But if there's a chance of this getting used outside of xe, then
we need to keep the check...

But if you keep the check, then also use __lb32() because we need
some consistency in the reasoning, one way or the other.

> > 
> > Fine, will drop the idea of WARN here.
> > 
> > Thanks,
> > Badal
> > 
> > > 
> > > thanks,
> > > 
> > > greg k-h
