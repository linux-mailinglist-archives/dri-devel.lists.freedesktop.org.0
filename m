Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CADD8C5CCB
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 23:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5DC10E086;
	Tue, 14 May 2024 21:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFMC8A1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3398510E086
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 21:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715722178; x=1747258178;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UGndcnuoCBgT+yGLrqJeZ2xD7Z/IRnd8LhplbxYG2Ug=;
 b=bFMC8A1Aq7WWHQhvlShAvJyWrkRQeA8clZMGVnanYUosOjmZ7UEUtWFr
 u090Mkh345JtOgxqCfkP7uvOCqZ4dpY7NyquDd1PTduTaBye3s6e1n2SY
 YUO0il7DSOrR0OlGUI1JOe5DVth5lOcijam7guI+l3zcM3fAQzro6AXQY
 sWivW6lNym0yB1IkahsyF+IaaP+L38pnwF6wbanG4melSztF8grdBoUK/
 Im9X3syzQwHBYClcivu+TbBVdBD9boL2yWOehG9IHx3zR4ZkfU8eIUPwT
 GOpABYF4Q8Pm3rLllRbmGkwldjxm1zENv3BKQzdgxd28rVeTH96QmgtdU w==;
X-CSE-ConnectionGUID: 0xxYHjn6S/Gz6Lz3sStNWw==
X-CSE-MsgGUID: /sdnerxlROyN2FblDaNmVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23133826"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="23133826"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 14:29:37 -0700
X-CSE-ConnectionGUID: qJGjNqnpSeWXK/9570tWtw==
X-CSE-MsgGUID: NoVim0hfT9OImXgXjhbLag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="31405900"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 14:29:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 14:29:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 14:29:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 14:29:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 14:29:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWo4nMaERRO/T1fGoQBXMVG9DmLPz9GEL9vtuKNAEVI9oApwB1AFbMLXz001/PWoCX1oc4CuBNBoN6Q3mCWsdinAFfLqvjh2tbWfFzb0esNviT18LpNmaYyLshB/9wr6V6vD6bkWyr65hP8lYEgy6OJSnWFPsa/MLacGuwK1ULs7o2jsoFo7WIAhqJPZaRgxnM5BUmwq+76rsO+9KhQkeOQnNittyQHcsm+KW5cBWMxcn0jh62AuRDaWebjo3jYbIaLVmyZc4kYYWUel0jGCyfSxx07yaL5JQf5JlOuVsCEH9cdLQtwXAW0/z9QHKi8SHrW3RMyDjhRzlnLGJF85nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGndcnuoCBgT+yGLrqJeZ2xD7Z/IRnd8LhplbxYG2Ug=;
 b=lvJmq1cTfpnOyHkyDFbOebVwe3JzIIkDEh617TMGJaYW0+xXJkGJqaIcgZPnA1HtKb+GTSve2nFGI1EmzRYnebl6AOAtLSbplaHesxFH/tkwtsW/Z6/VpPorlqeHqjQ3H72iDPSBWAlJYedhgW6+IMXHzIvu/CGJLfwzE/LOZh0/Ngu9E6G9Vq2c+WV+eTy8kSVjjfizN8XtOP4KhrZyrbKIaWn0AkNF7D6GnHh7uEO6RdWBavUDlgl4RC6vXYNqvBxS9gUUzgOUd6nMXIxMrwrnm/3KFCLfdjblDv+oJiBiWTN0cnPJlzFXV6Msx4ADN3RMC35y7fq/OQDMCvd1zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CY8PR11MB7747.namprd11.prod.outlook.com (2603:10b6:930:91::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 21:29:32 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 21:29:32 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Rob Clark <robdclark@gmail.com>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>
CC: Zack Rusin <zack.rusin@broadcom.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Rob
 Clark" <robdclark@chromium.org>
Subject: RE: dma-buf sg mangling
Thread-Topic: dma-buf sg mangling
Thread-Index: AQHaovgOQ95GS7P8202/HDSiD4BT4bGVaqgAgABSdACAAYLF8A==
Date: Tue, 14 May 2024 21:29:32 +0000
Message-ID: <IA0PR11MB7185F377D7F7CA905A6C4108F8E32@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <CABQX2QMVfsZZrHLktZ=MhJ5gG1ATRuSGa+E-CKfXATgU5BwMwQ@mail.gmail.com>
 <973b5119-0fca-4420-b5d2-b5b4862c77cc@amd.com>
 <CAF6AEGvm2VVQR7h2S5eM212q+AvrkdhsphAetp0ebM=t7PvN0Q@mail.gmail.com>
In-Reply-To: <CAF6AEGvm2VVQR7h2S5eM212q+AvrkdhsphAetp0ebM=t7PvN0Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CY8PR11MB7747:EE_
x-ms-office365-filtering-correlation-id: 0a968d22-9014-46f9-85d6-08dc745cf1ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?UGd5REdYVnpRVUgxLzU1ajBRb3k4L1Z5bmNTeDFuWVFXOGxKZ0tZT3lTZTFP?=
 =?utf-8?B?Wmsvb01HdERjc2hualFOYkx2dE5GTjdUall3NHEzNitYcWhDM25LM1JZeVl4?=
 =?utf-8?B?VXJtQVk2RWZOelBORlBqNWNWTWZuZUJNRGZRSmRWYUNVQXA0WWRlYndnTk10?=
 =?utf-8?B?ME03UkptT0ZKZnpSNnpJOEExa0VYWEhacVhtUTVSeFcwNytRblBaN0FBVGUy?=
 =?utf-8?B?YVZ6cXJTOFJCeE1TeEhtVE11YjZHRWhjQkpNNU9YWi95VWNDTzRocDh4YTRD?=
 =?utf-8?B?OHFlcDZ0QUZzL3AyeG5qODltQXAzZ2VVQk9iZlYwb05RWjhTZW1IRHh3R0Jw?=
 =?utf-8?B?VDE0SXdlZlFhd3BmNlhhMHJ6RXgxYmxUY3hYanFUNGlRMFRHK0FKSXNHK1lE?=
 =?utf-8?B?dHAwb0s0VFRkc3NFWWpSNHlxK0JtNjJMR2VsSEp0VE1JT2FXbG5CNDZLZGEx?=
 =?utf-8?B?dzNBV3RvWGJFNkdRUlFPQWRsTU9XcXRkWmwySllNVEF0Y1BJa2t5K1VvcStt?=
 =?utf-8?B?ZkJ1NVJsaC9GTFV5V0pRRTk4UjlYYTMvZG5XNjNmOWlJT0JxRCt2ZFNuQU5L?=
 =?utf-8?B?NVFQNjlwNTc0SmFabWNQRjRRWkhaS2p4N29waFNJVnYzUlNORWhTOW9hZ2p1?=
 =?utf-8?B?a0FyNUVPSjFlcEZhcjlLZXJBYU1PeEtaSXZ0K2lpVm9PUWlQa3U3NXBYR0ho?=
 =?utf-8?B?aXhMMkp0cTY1ZHJTOG5RUzNmQVdoK0NrOUNJTkRnaW1qNmlocWx4d245RzF4?=
 =?utf-8?B?S2FQUFFITlk3TlJGQU9uR2FITWZYbmJmWS9kVEdubkNNektQbnZMR1hISzZE?=
 =?utf-8?B?aDRYeU5OMnE3aGdXMUN2U2lRbmtXVi9ZLytOS2liWUFXeFkzUHgwc0d3bjM5?=
 =?utf-8?B?TmdDVkJ1b28yNHNva1B0ckRoV2NNYmZjQlVSeEU1Sld0c29GeVZKSjFidXpH?=
 =?utf-8?B?SG5DdklTNjZvV1VkUFZYUEZ6aHoxZ0N2QWpLbURDM2s2MGZXVEk5TkdLMFZW?=
 =?utf-8?B?Ym83RE4xdVlsd3pNR0ZlbUh0bjhiR05kR1VPR2VWRVVGcmZLSEZ1MHAwQyt1?=
 =?utf-8?B?OFJDcksrdVJKTW43Q2dRVTI3blJYZFZ0R3orbm1RMnptQVZFQnI0VnVMS2VB?=
 =?utf-8?B?K3lveUJ4VjV3b05IbWhvRDJRM3hJcTdQams5Nk5VM0plQ216WGtJblUzeU5L?=
 =?utf-8?B?NUFwK3M1ZjJpMTZMR01oK0RYWkJ1UkozL29IaTZXUncxZENQOXozWW5hbVh4?=
 =?utf-8?B?ZFFZQnRyNGhnSE9wZkt4QTU4bVkrbHY0ckNBZThBdlhXd3RwdEFMYm5wVWc0?=
 =?utf-8?B?RmFlb1EyS1k4ellRZHVTczlQNDBiaXVaMC9JenJGMkpiOG9SSld3Tlp2YWJr?=
 =?utf-8?B?UkpUR2RsTmJLeTBPenVvM1NNbHFnL054OTNSOEVTa2JwQThhUUxDbCtkQjZ0?=
 =?utf-8?B?UHAxaTF3OWRiYzdmU3pkR05LSWFtbzZpdG9KUCtId1loYnE0SWdoQ0dGTDdl?=
 =?utf-8?B?NlN2d3JWc0w4aWpuS2RtMUU2STljZ3dCbVB0MWg5Z0ZraW9YaG14bnpkSWVh?=
 =?utf-8?B?SU9MbFlqNEhSemppd3hlT2Q5NVVHU0Z5dGJ2MVRCMlc5RHhGbmZnbUNEUzJj?=
 =?utf-8?B?eWpCZEN3MURIQWp6ZHRhVUJUVlBiQ0dES2tuViswallvTnVFcjZHSkVMRGk0?=
 =?utf-8?B?SEVvZEV5SEdZajFEOE9oczFNenN1UmxDVjliQUJsQzI3emwrQ29nVnR3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTVxRmNGWmF2WHdUSUltV3EzanNLejZvaGJTekJGdVppNXlVbXNIanFIaTJ4?=
 =?utf-8?B?TndDRnY3dUlaRFJYemNOVVZGamNCY3lLZHV5aU9NajFnQVlHYlpuN09wMDNt?=
 =?utf-8?B?NE5HQW04K2Z5OFUybmszWlhsV0x4UjZEY29WWEV5RGxFbU5sanQrMVpMTUFR?=
 =?utf-8?B?Tk5ZeTlDWS9oMXlPZWRWbk93bkdkb3A0aThERmxSWjdza3NuU2RnOHFSc1Jt?=
 =?utf-8?B?ZlpQOWk3dzJheGdzbFdpeHd5dXU0RUc4cGJ6VVg2TXNhajc4WG8zL2RndlVZ?=
 =?utf-8?B?UVIxNnBDYU44SmNWU3VzM1RPcWhCR21KblVQVkdRS3psMHVoNjI5TG5wZERq?=
 =?utf-8?B?UVErRGxwZGdnWkJoSkFmdHlTbEZnWVBPWm9aTDZhdmVuTzFDUnkyMjhldHZH?=
 =?utf-8?B?Zk9xWFJGeS9iZHR1SmRmQnRDRWZzOUgxTWd4cmpTOUlpcnFhWGc0Skc2TzhD?=
 =?utf-8?B?M09MaGhwWEduYjQvSTRablkzRytPVVFEUE9kSFBsNFN3SE1yY05KNmxrRDlh?=
 =?utf-8?B?UWtQK0N0Z29zQlpsdXk1TlV2TkV1aG9ialBiNkYydEJPcUtqZmxCc2gweGJ0?=
 =?utf-8?B?anArU0xDci9aMC9Vb2JEd1UxQjZTWkdGMmw4SlFxUDg3RkV4WlByREZ0V05J?=
 =?utf-8?B?NDhENGdtSkI2K2FsSVRCc2VZMXQ0SUYrcTJYR3M4cERqWE9CRzNhK2V2YmRH?=
 =?utf-8?B?d2JJQkxiaUpwU1RuQi9wRjdLN1VkRy96YnZwWW1rb2lCNFgwcmx2MUpGNlZa?=
 =?utf-8?B?UkJBemhUbSttSTA5RVVOaEdTRW1vdXRDNUFVSVdJUkhNazcrbWNleEpWOFdZ?=
 =?utf-8?B?NmFWa0p2b29sZHE2YXhRdTdOVXdEbXU2SFc1cGpUUlY5NnFFSFg0dmJPMlcy?=
 =?utf-8?B?M1BFN0V3aVBJb1hUa2RNbFE2djc0N0pORFVYdWYza1dTMVRHMmphZ2Z5dVhP?=
 =?utf-8?B?YTRMVlF6cEhVdmVkRnY4ZEIrY0FqRHJaUHAyUkhnZmlKQUhBa1ZNU2QzNkVl?=
 =?utf-8?B?MC9jRDhpVzVkMWZkS1o2K1lGN3ltVmE0VzIwM2tDcUZOYStaeEZ0Zy9oWUVD?=
 =?utf-8?B?RHhndmozdWYyQ0xTTjZId1dLVCt0eFlkWFJYN1ZLcXBPNC9yeXR2YVZjWm10?=
 =?utf-8?B?WnhOS2JKUlRsdnZ2Q3pXZ09oV3AyVFZzNDJ4YnFsUm92eUR3MHMvaTdMZzNy?=
 =?utf-8?B?S1k1YkRSTURqOVJ2TkNUNHR6V1BYazhXQXZlYk0xd3JBYmdKVjVoM3FtT1NG?=
 =?utf-8?B?dER4ZTZJdVJmNSs5TEZXaUJiV1IyOW5LbnJBVVlJOTVXYWt3dytYZDMyZGFn?=
 =?utf-8?B?Y2pJUk51QVhCQkllblpZaUZLZ2xYUTFscTFLMVlmSUE3U29sSHVMZlNZbm10?=
 =?utf-8?B?S09xUEtpUVNhNkl6K09NbTkxTU5SdE5jaTV4RW9pYlFpSXdITmFMVVZsdW9J?=
 =?utf-8?B?ek5pempaTGpkYnlqS2VBNmxVU2Z5Mk5pSDdQQ1JFU1QwNzB3WDJLeFJxRGZU?=
 =?utf-8?B?VG5vYWd2cmlKWEZXR3JndWw0R2VLRzBlL1ladk9hSGFCZ3V6Q3diV2ZlL0xH?=
 =?utf-8?B?TzNMMDc2TEVJUVdaVlZjSnJhWlFEaXg2NTZRV1ZOUTV3UmNNamIyRVpEdUNG?=
 =?utf-8?B?VUJwV0hTVnRoeDRONC9haCtYRytGRElQOUZuSkR5TFcyYnVoSUUxT1JGbXZL?=
 =?utf-8?B?UnZENDRKT21yYzdtaCtxa0JORUhkU0ZiS0V2eU1jYmNHYThWRTAxK0pwRUFP?=
 =?utf-8?B?QmFJOUtEdkFjM01Ob2JBZEM2eWF6b3hJdkNkazc0dE1BNE4zRDAwdTU1MlFr?=
 =?utf-8?B?WVYwZEZuQTljd1pMQWhXamRKam1OZGpXUUZTUlBBV1NZV01vd2p1R1hXSjVI?=
 =?utf-8?B?VWRvTHZucURYemZoT3c1cm84d2NhOGxaUFhRb1FsVyt1eHIxaW5PMjF5b3dO?=
 =?utf-8?B?NnJra3FielNZVHZTcnlrSmxFbTlZNTJITkFrWUxxaXVWMlI4c2F3L2RUUnQ4?=
 =?utf-8?B?bExGV2xwdWhQQXI5bWRTVzNyMFNCdENPUGtUbFhsNlhLM3VWMmVVTUZQa1pP?=
 =?utf-8?B?ZXFOSnlQTm5SNmEyNThmSmNQcWY0enZuOHkwVUhGMjdPRCtjTThFTmd2OWNt?=
 =?utf-8?Q?3JN6PyizspG5MbmmagYoWSYVj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a968d22-9014-46f9-85d6-08dc745cf1ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 21:29:32.3699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/giwx41HDCwwFv3fhHKnrNVbCAASFZbXz1cqVcmMBBtWQjkFg9A1FP78+/SXVxf7xeneHb1juun4gj6y0QdVyXa3foC4fcdxU0L9EZ471U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7747
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

SGkgUm9iLA0KDQo+IA0KPiBPbiBNb24sIE1heSAxMywgMjAyNCBhdCAxMToyN+KAr0FNIENocmlz
dGlhbiBLw7ZuaWcNCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6DQo+ID4NCj4g
PiBBbSAxMC4wNS4yNCB1bSAxODozNCBzY2hyaWViIFphY2sgUnVzaW46DQo+ID4gPiBIZXksDQo+
ID4gPg0KPiA+ID4gc28gdGhpcyBpcyBhIGJpdCBvZiBhIHNpbGx5IHByb2JsZW0gYnV0IEknZCBz
dGlsbCBsaWtlIHRvIHNvbHZlIGl0DQo+ID4gPiBwcm9wZXJseS4gVGhlIHRsZHIgaXMgdGhhdCB2
aXJ0dWFsaXplZCBkcml2ZXJzIGFidXNlDQo+ID4gPiBkcm1fZHJpdmVyOjpnZW1fcHJpbWVfaW1w
b3J0X3NnX3RhYmxlIChhdCBsZWFzdCB2bXdnZnggYW5kIHhlbiBkbywNCj4gPiA+IHZpcnRncHUg
YW5kIHhlbiBwdW50IG9uIGl0KSBiZWNhdXNlIHRoZXJlIGRvZXNuJ3Qgc2VlbSB0byBiZSBhDQo+
ID4gPiB1bml2ZXJzYWxseSBzdXBwb3J0ZWQgd2F5IG9mIGNvbnZlcnRpbmcgdGhlIHNnX3RhYmxl
IGJhY2sgdG8gYSBsaXN0IG9mDQo+ID4gPiBwYWdlcyB3aXRob3V0IHNvbWUgZm9ybSBvZiBnYXJ0
IHRvIGRvIGl0Lg0KPiA+DQo+ID4gV2VsbCB0aGUgd2hvbGUgcG9pbnQgaXMgdGhhdCB5b3Ugc2hv
dWxkIG5ldmVyIHRvdWNoIHRoZSBwYWdlcyBpbiB0aGUNCj4gPiBzZ190YWJsZSBpbiB0aGUgZmly
c3QgcGxhY2UuDQo+ID4NCj4gPiBUaGUgbG9uZyB0ZXJtIHBsYW4gaXMgYWN0dWFsbHkgdG8gY29t
cGxldGVseSByZW1vdmUgdGhlIHBhZ2VzIGZyb20gdGhhdA0KPiA+IGludGVyZmFjZS4NCj4gPg0K
PiA+ID4gZHJtX3ByaW1lX3NnX3RvX3BhZ2VfYXJyYXkgaXMgZGVwcmVjYXRlZCAoZm9yIGFsbCB0
aGUgcmlnaHQgcmVhc29ucyBvbg0KPiA+ID4gYWN0dWFsIGhhcmR3YXJlKSBidXQgaW4gb3VyIGNv
b2t5IHZpcnR1YWxpemVkIHdvcmxkIHdlIGRvbid0IGhhdmUNCj4gPiA+IGdhcnQncyBzbyB3aGF0
IGFyZSB3ZSBzdXBwb3NlZCB0byBkbyB3aXRoIHRoZSBkbWFfYWRkcl90IGZyb20gdGhlDQo+ID4g
PiBpbXBvcnRlZCBzZ190YWJsZT8gV2hhdCBtYWtlcyBpdCB3b3JzZSAoYW5kIGRlZmluaXRlbHkg
YnJlYWtzIHhlbikgaXMNCj4gPiA+IHRoYXQgd2l0aCBDT05GSUdfRE1BQlVGX0RFQlVHIHRoZSBz
ZyBwYWdlX2xpbmsgaXMgbWFuZ2xlZCB2aWENCj4gPiA+IG1hbmdsZV9zZ190YWJsZSBzbyBkcm1f
cHJpbWVfc2dfdG9fcGFnZV9hcnJheSB3b24ndCBldmVuIHdvcmsuDQo+ID4NCj4gPiBYRU4gYW5k
IEtWTSB3ZXJlIGFjdHVhbGx5IGFkanVzdGVkIHRvIG5vdCB0b3VjaCB0aGUgc3RydWN0IHBhZ2Vz
IGFueQ0KPiBtb3JlLg0KPiA+DQo+ID4gSSdtIG5vdCBzdXJlIGlmIHRoYXQgd29yayBpcyBhbHJl
YWR5IHVwc3RyZWFtIG9yIG5vdCBidXQgSSBoYWQgdG8NCj4gPiBleHBsYWluIGl0IG92ZXIgYW5k
IG92ZXIgYWdhaW4gd2h5IHRoZWlyIGFwcHJvYWNoIGRvZXNuJ3Qgd29yay4NCj4gPg0KPiA+ID4g
VGhlIHJlYXNvbiB3aHkgSSdtIHNheWluZyBpdCdzIGEgYml0IG9mIGEgc2lsbHkgcHJvYmxlbSBp
cyB0aGF0IGFmYWlrDQo+ID4gPiBjdXJyZW50bHkgaXQgb25seSBhZmZlY3RzIElHVCB0ZXN0aW5n
IHdpdGggdmdlbSAoYmVjYXVzZSB0aGUgcmVzdCBvZg0KPiA+ID4gZXh0ZXJuYWwgZ2VtIG9iamVj
dHMgd2lsbCBiZSBmcm9tIHRoZSB2aXJ0dWFsaXplZCBncHUgaXRzZWxmIHdoaWNoIGlzDQo+ID4g
PiBkaWZmZXJlbnQpLiBCdXQgZG8geW91IGhhdmUgYW55IGlkZWFzIG9uIHdoYXQgd2UnZCBsaWtl
IHRvIGRvIHdpdGgNCj4gPiA+IHRoaXMgbG9uZyB0ZXJtPyBpLmUuIHdlIGhhdmUgYSB2aXJ0dWFs
aXplZCBncHVzIHdpdGhvdXQgaW9tbXUsIHdlIGhhdmUNCj4gPiA+IHNnX3RhYmxlIHdpdGggc29t
ZSBtZW1vcnkgYW5kIHdlJ2QgbGlrZSB0byBpbXBvcnQgaXQuIERvIHdlIGp1c3QNCj4gPiA+IGFz
c3VtZSB0aGF0IHRoZSBzZ190YWJsZSBvbiB0aG9zZSBjb25maWdzIHdpbGwgYWx3YXlzIHJlZmVy
ZW5jZSBjcHUNCj4gPiA+IGFjY2Vzc2libGUgbWVtb3J5IChpLmUuIGlmIGl0J3MgZXh0ZXJuYWwg
aXQgb25seSBjb21lcyB0aHJvdWdoDQo+ID4gPiBkcm1fZ2VtX3NobWVtX29iamVjdCkgYW5kIGp1
c3QgZG8gc29tZSBob3JyaWZpYyBhYm9taW5hdGlvbiBsaWtlOg0KPiA+ID4gZm9yIChpID0gMDsg
aSA8IGJvLT50dG0tPm51bV9wYWdlczsgKytpKSB7DQo+ID4gPiAgICAgIHBoeXNfYWRkcl90IHBh
ID0gZG1hX3RvX3BoeXModm13LT5kcm0uZGV2LCBiby0+dHRtLQ0KPiA+ZG1hX2FkZHJlc3NbaV0p
Ow0KPiA+ID4gICAgICBwYWdlc1tpXSA9IHBmbl90b19wYWdlKFBIWVNfUEZOKHBhKSk7DQo+ID4g
PiB9DQo+ID4gPiBvciBhZGQgYSAiaSBrbm93IHRoaXMgaXMgY3B1IGFjY2Vzc2libGUsIHBsZWFz
ZSBkZW1hbmdsZSIgZmxhZyB0bw0KPiA+ID4gZHJtX3ByaW1lX3NnX3RvX3BhZ2VfYXJyYXkgb3Ig
dHJ5IHRvIGhhdmUgc29tZSBraW5kIG9mIG1vcmUNCj4gcGVybWFuZW50DQo+ID4gPiBzb2x1dGlv
bj8NCj4gPg0KPiA+IFdlbGwgdGhlcmUgaXMgbm8gc29sdXRpb24gZm9yIHRoYXQuIEFjY2Vzc2lu
ZyB0aGUgdW5kZXJseWluZyBzdHJ1Y3QgcGFnZQ0KPiA+IHRocm91Z2ggdGhlIHNnX3RhYmxlIGlz
IGlsbGVnYWwgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPiA+DQo+ID4gU28gdGhlIHF1ZXN0aW9uIGlz
IG5vdCBob3cgdG8gYWNjZXNzIHRoZSBzdHJ1Y3QgcGFnZSwgYnV0IHJhdGhlciB3aHkgZG8NCj4g
PiB5b3Ugd2FudCB0byBkbyB0aGlzPw0KPiANCj4gSXQgX3RoaW5rXyBaYWNrIGlzIHRyeWluZyB0
byBtYXAgZ3Vlc3QgcGFnZWQgYmFjayBidWZmZXJzIHRvIHRoZSBob3N0DQo+IEdQVT8gIFdoaWNo
IHdvdWxkIHJlcXVpcmUgc2VuZGluZyB0aGUgcGZuJ3MgaW4gc29tZSBmb3JtIHRvIHRoZSBob3N0
DQo+IHZtbS4uDQo+IA0KPiB2aXJ0Z3B1IGdvZXMgdGhlIG90aGVyIGRpcmVjdGlvbiB3aXRoIG1h
cHBpbmcgaG9zdCBwYWdlIGJhY2tlZCBHRU0NCj4gYnVmZmVycyB0byBndWVzdCBhcyAidnJhbSIg
KGFsdGhvdWdoIGZvciB2YXJpb3VzIHJlYXNvbnMgSSBraW5kYSB3YW50DQo+IHRvIGdvIGluIHRo
ZSBvdGhlciBkaXJlY3Rpb24pDQpJIGp1c3Qgd2FudCB0byBtZW50aW9uIHRoYXQgSSBwcm9wb3Nl
ZCBhIHdheSBmb3IgdmlydGlvLWdwdSB0byBpbXBvcnQgYnVmZmVycw0KZnJvbSBvdGhlciBHUFUg
ZHJpdmVycyBoZXJlOg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjQwMzI4
MDgzNjE1LjI2NjI1MTYtMS12aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tLw0KDQpGb3Igbm93LCB0
aGlzIGlzIG9ubHkgYmVpbmcgdXNlZCBmb3IgaW1wb3J0aW5nIHNjYW5vdXQgYnVmZmVycywgY29u
c2lkZXJpbmcgdGhlDQpNdXR0ZXIgYW5kIFdlc3RvbiAoYWRkaXRpb25hbF9kZXZpY2VzIGZlYXR1
cmUpIHVzZS1jYXNlcy4NCg0KVGhhbmtzLA0KVml2ZWsNCg0KPiANCj4gQlIsDQo+IC1SDQo+IA0K
PiA+IFJlZ2FyZHMsDQo+ID4gQ2hyaXN0aWFuLg0KPiA+DQo+ID4gPg0KPiA+ID4geg0KPiA+DQo=
