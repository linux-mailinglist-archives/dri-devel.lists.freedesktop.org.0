Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94E5CF802E
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4927D10E4F0;
	Tue,  6 Jan 2026 11:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJELMQw9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4EB10E4E5;
 Tue,  6 Jan 2026 11:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767698411; x=1799234411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=upizmV2lNIQaTQ881wcULQjWKqv5hvMO3VZDKJ2Rx0k=;
 b=gJELMQw9YtFKWyei9U4+SzT3yWKl3250yYKAcQcvx4MZz8w0HvqSOkzJ
 cnalgBy+Z+qU/yU8JFeXXD5b4Qdb1C1bGWVeyUwErWVz/S6d90s/jzPp5
 aEUa+M5U5sdWAmLyMZUValITu7oRLjn8m4p7xBP0ScCpVlBzYkkdup5qI
 2UZl4S55sBVPFLTb0xH+jraqJkTQ1+SvoOoSS4eG5CtRdqK7vVzXP7xPR
 Hi06L8/WL+vOPBaiPPeDY2jcLfl18KG4k+YD2EuNh8UG/H/5gKJJP/f+c
 7NK8ATHfKkIZY0YMkrI8iLRMPUeY8VbrRy/sPczWg+XqwlYnY2VCnoWip w==;
X-CSE-ConnectionGUID: F3pnG0QfSQKaG+51y5PZbA==
X-CSE-MsgGUID: mOsE5hiZTc6s+Vwx6gDUsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69224036"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69224036"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:20:10 -0800
X-CSE-ConnectionGUID: Dy52ohzES+iMiknSgf4W9Q==
X-CSE-MsgGUID: guJcj63eQUWQN647SM3ATA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207188308"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:20:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:20:09 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 03:20:09 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:20:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaCtk5ZnSa7xiTxqTScPhq2WGREHHLyBeXngHHioiRMF/pwh/lDFU3SZYkKY6Ej2diNjdlDgI0RhRZoTh7XtKDkRB66cYPcUAxYrpG0/zOBpzYdMkcCjJdOM2jE0jSbUTP7rcXUgefL+JMb4ZHLbUA95xOjFzQrQ6jUBmiqhsSGJohFeza5WJ5s1LCpDA3+JGSPUiXII6vR86VuzLLM4WFT+9JC78DM0xEpGGPd2g1+d5pzN8atUZJONgsKxeXCcTp4n2v5e3ICjKue/7abNGH97VpPQvOVXN7yBbK68ubIva16Q7tOuZ7vJeomHGjc/nrqgfpTMnjCCA3wTzD47VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYcVL/xl3/eN7I3DdZwjRlrlzpTmocPQ7wTC35nkcqM=;
 b=wllpfAWdhZrV6521PyRcJtnNAWivI0Vc8CGDRuLhsEVPTS8lVtAtUbTDZDFeZ+2REU6LXXQBy61V+SsWUPGTrSrGZLiMnLH9+BAl96XHLwGHJ2UApvAASaY9g6iTBGD6myhQcop2nC6yV9zd3vausJaLuQav/4d/f6ippOfIZ5G1u3HmQTnR34hVSJ6MQ6QyCHbHYs6Ri1L8sinojYlwJcLHRfer/EN53w5QVipD0iyUxsBq6HKKJyp3vUorLUGAcH9yIrLc+lKmE17V8OLFpP0SWcwg96vpT4/6gYYu2JGisXzMnMW0om9h6WryBE0qlFdIKo4IuMcsvzG9t91PtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 LV3PR11MB8676.namprd11.prod.outlook.com (2603:10b6:408:20f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:20:02 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 11:20:02 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 10/13] drm: Clean up colorop objects during mode_config
 cleanup
Thread-Topic: [PATCH 10/13] drm: Clean up colorop objects during mode_config
 cleanup
Thread-Index: AQHccLcHRz9ZUO2Of0++1d4NmC/Fp7VFGyhg
Date: Tue, 6 Jan 2026 11:20:02 +0000
Message-ID: <DM4PR11MB6360C1B3ADA68D900F4F4D52F487A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-11-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-11-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|LV3PR11MB8676:EE_
x-ms-office365-filtering-correlation-id: 6c692530-ef9c-4a27-3278-08de4d158926
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hWlpDjEQI40Z/M0By54nP8Wymy3wE/7RyL1kzfuKP1Lnm6/rD+kzgzyduCAg?=
 =?us-ascii?Q?j5YxLQu3FBnheU2Pnd7J2aVlJz3xsZAatbFE9vBWwIRmIorxLrHESqFvQuF/?=
 =?us-ascii?Q?c5WjZs/B9RcoC420zaFdYMGwtbVCw4nXSqLKu6xIekwky7svS7YMxf3RGcLd?=
 =?us-ascii?Q?Hj6C1LiQeSTMhK9wZuiNWwtLjYrVttQn2UU9AjYMqGfRGoBBqpCqjxN4TALM?=
 =?us-ascii?Q?MvFZt8U2vlj9nTOL7vZJhSEFnRqyDoxoGyf/ek0K1QbC51U52gk81Ndrqa44?=
 =?us-ascii?Q?nmX9FRy5Kz5cSjFJuZ61DuJqYjxHdRuS8CSQew4sY23EMdNy2SxtABsJUfVl?=
 =?us-ascii?Q?8sBd8JoyEne+uaBTRHlYDeU7R9PTQcZiUHVgrixfBU+anm+1+idyLGICYFY0?=
 =?us-ascii?Q?KYL83m4DcX4VM8fMoZ2PtFC9vIY25c+P4pRvnv+cLcixsXL8qGJtO3CbWybK?=
 =?us-ascii?Q?0ELRZKHUTI7vvdIusvtdhiWnvwaqsRYu5f0PsLi4CKfJorRncQgb/b7KU2dc?=
 =?us-ascii?Q?ESlBTXJfdE8mB6iwPHQk1JzSit4ppTjlRJ9hCgADTnfFZfeyKCnfjLaQBim2?=
 =?us-ascii?Q?TrLGlRFX8umKuWW2HZuyHMMcl30OHyyoFdmviN+sG72i7F/6Alm+0CUtcE9/?=
 =?us-ascii?Q?hnQTzZTxnwzLkFmyIZeTYvXJNlCViLfLCRIpW8unpz2VVHjiRSnwjsnWpv0M?=
 =?us-ascii?Q?/L944tHtAREXIoi1KJMrjfibxAg+pehobb248Jc+RCOzK2RiiMRUCrqqIbUQ?=
 =?us-ascii?Q?tOzj9sf6CslNmgcjuYrdf1hJpWgyjYjqQ2qs0LC2aYNPR3zv58HYaZTwbMN5?=
 =?us-ascii?Q?k/WZy16K/FpwITOcJdnPCxjWxJg+se7cqz56tVV9kohRTgCYJZTQ3q5f4OvZ?=
 =?us-ascii?Q?jN5mKBpl+p8kZ0nUGfY23/rZ6yJvtUjObfHNJNuLGX99EoMpDEwEsAEijO4W?=
 =?us-ascii?Q?bbfRj35EpGWlGMNBwCvZnNzM4nBpzqmaYl0530DeWsBiMpQhweKN8G4wVsPn?=
 =?us-ascii?Q?c1kHi8RVFR5pe6bEqQhiqlDZb8yDfOz8L30GqvGQ1Gke1NkZcypi0FH/24wS?=
 =?us-ascii?Q?e0eqCbUE0eH2IYEhqAe2P9LJZ8griXaSARTNnyl5W1PAC8Fe/ra/FkmcUyrL?=
 =?us-ascii?Q?PcWVUa8/tFYbgHWbwvxHsudgMCYTy5+c5OxNdwT1VNQywCOAUHK8sFQ03i+x?=
 =?us-ascii?Q?u6dEnfiMZjm374u6+AiCcZI0jGuwL7B6ux1z8Hzqe+N9gmPjwSMzbPxrSCyk?=
 =?us-ascii?Q?Kc9s63Z9cnUCC/vJFCO6sCsm0FM/5pnmN/i6R2pOOFs9Nti71ppZBcrvMdiQ?=
 =?us-ascii?Q?PqGvoX+ONi7KsvQBimnxlTqaHXIGo9X2BCt8UDCb0dbQ8H36LV3t46ioyOHO?=
 =?us-ascii?Q?1aOiVJIHRYf2tOLLdxe8YoXgImMovBdO7IQqlWpN0IRXxTP9uY2E6fDCHQsQ?=
 =?us-ascii?Q?PCOe4+4jo4eNdO75cnDpn86p2hCN8R6dFTGQLkhvPFso3m7jcZWyuyfEUzPT?=
 =?us-ascii?Q?H6bEkjEYv5BEPiwC4hvGf1nEhlQZA3He4tXU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+sZJ5XdfjtxXX+4IzPN/r9iRag4kWU0mKpFI9u0exJcT6t2TgbxnNgfBcyt/?=
 =?us-ascii?Q?ie7SWrknn4xufz2pdCoaUXl2TiBggm6zwMP9oETWKqf6ZCPKWRplLWqivybM?=
 =?us-ascii?Q?mZ0qwbgCqEF/JRf6jaq0j0pLx/yUkYWkr8McHAffvPtrWIl8uiuKdN7++PNu?=
 =?us-ascii?Q?WQ0XObQbKVrZP95vgYN/KUTRwc74rH+3dwk6ZN2u2H+TY1on1RWn/4nwzTV/?=
 =?us-ascii?Q?MQLQi/vp4oMeVM4tnaxKnENMFOyxXvf9XPbSqMPtkW49CqFVS57K1lHprUYL?=
 =?us-ascii?Q?oDYp5wPMm84BXHXyKNG7iIrDffSlEfIf6Mry1IY5234U2O/C8oyyhTNKLdCn?=
 =?us-ascii?Q?8uNKovj8CwIWA2fFt8iCNr6+/Yq2ECTnV3pEy0DLw3vA/zMzZFIWDarj/l5X?=
 =?us-ascii?Q?JlbOWgMPSuQl80yOcjrb7cu4/6OwKSLzvByTBsRj6WZRbRofd9cxoD8CMuRV?=
 =?us-ascii?Q?ktbmZVrMOBJcf2RkE89CSCvY99kH3bc+UXdJYRY0/lIFyf+th3xQs6hU4lr7?=
 =?us-ascii?Q?SQY8mKZV/vPYUt28IZ2LzOXAXVfGgmpTNyLU0tFlW9jm3wbPzhddlX50Kp5K?=
 =?us-ascii?Q?gtpzu7TJU7talc3KvEpRl3BPuLdSg3FlMilGyRDlEo0kbBLLSRZMvJADQ/wr?=
 =?us-ascii?Q?Gkdcpth6LT3j3sVY4nBKlQIfIbG3rZMlkrGt290glWyo/Dq69Fo7w5h2apJW?=
 =?us-ascii?Q?8QwAgcfrPXE4ynpNqYqiCoBY6UyWRtBFuMhdWuD54i77evufF26REf/YD0mr?=
 =?us-ascii?Q?CcQs5cW7QJ+SL3sL8tsFuGFiQSxHTfrfWb4trql/TYCNGJlSnKK/NbO7OLIn?=
 =?us-ascii?Q?i8XTElpLvQthQYPsDMwhEiriuHh0SRAHPVWpmijWJeia8+QXE/gfIe4Rgw9h?=
 =?us-ascii?Q?bpQiZA2uJ1uhWRBnlfgQTzY+HItd/FZInXoexrXuGVW0xLSSgM3vUlokC71+?=
 =?us-ascii?Q?3hI0Y+jmnn4Y0OeA9AgNBKeusvDNc/TfGWsJqVbxN3iph/1kFawKgjOYLnbk?=
 =?us-ascii?Q?I6LMWgXy/dPJnmYKy+Jr9KSl7eEVzmYbfueqTR2TthFXQMmHJEWHcTBIRw9O?=
 =?us-ascii?Q?9MJNH9MCSU2G+87k0LIAm1Qqf0PFPrpuLDregk+nAx7a/PHHbBd1CIaysLWx?=
 =?us-ascii?Q?Ih2NlxA4iCVvV2jiFtl21tz7/2OLk93WsevlfjRR8JY0FBcUwzPNTm35MXmF?=
 =?us-ascii?Q?/U8vLY4FRJ0vLRboAy8IIclYW1RUNhD5cN/p2P+acBXvLGmJPnvug0X9bYSd?=
 =?us-ascii?Q?8bpNMbHUzMv50O+gJiuhRzyd5cWWBUKn3rIyPV3gJfUVQBeJEV2HUz/hBt5L?=
 =?us-ascii?Q?RFHJVISYkD5RtKTaIqMQHZg8ZK8KR7WFapUFS0CnaCQzRxL/bDHVmzy31677?=
 =?us-ascii?Q?u0b8/XAUu3MzzsCaWYBxrCno/GXPlo5VYtpsd+W77x5ayUuzq/dVU1kNxUbz?=
 =?us-ascii?Q?A8wz+JcZnHE0mfnsXKqxlCVcW/NNmg/1VkdkyBM5x5Ohipd1pVQ1y8pgyPWW?=
 =?us-ascii?Q?UtWhHeazmXneKQg4gBztuEuAexQIwGbkYApy0PgSdGfYnTOG+Cj0JoiiQ1XD?=
 =?us-ascii?Q?qKF9LaDypN+XFeijHw+juE+NX74Ah9L89za7CF0W9nI2dCAA9FK6/NiK/idb?=
 =?us-ascii?Q?iCQgDl+Esk/tX9GqkoXiLGjqrH5RBnxCFzpexFjHlDcnFpZARxiCwpYwy9q2?=
 =?us-ascii?Q?MGWPfF2glF+CudACjE7FykrkdMmYHnNE27rj4K3Tals4B41pz5qPMW7huzp8?=
 =?us-ascii?Q?fhDJlRp6sg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c692530-ef9c-4a27-3278-08de4d158926
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 11:20:02.3644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T30UsIGKh2iokwQoySp+NTze/4KS9peNuGHa+s/GZDXsptHT7UkWt281+1JUd/FnvJLo4Xio8LdGKm9ZEGJJSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8676
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



> -----Original Message-----
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Friday, December 19, 2025 12:26 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: harry.wentland@amd.com; jani.nikula@linux.intel.com;
> louis.chauvet@bootlin.com; mwen@igalia.com; contact@emersion.fr;
> alex.hung@amd.com; daniels@collabora.com; Shankar, Uma
> <uma.shankar@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> nfraprado@collabora.com; ville.syrjala@linux.intel.com; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 10/13] drm: Clean up colorop objects during mode_config
> cleanup
>=20
> Tear down all registered drm_colorop objects during
> drm_mode_config_cleanup() by invoking their destroy callbacks.
>=20
> This ensures proper cleanup of color pipeline objects during DRM device r=
emoval.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_mode_config.c
> b/drivers/gpu/drm/drm_mode_config.c
> index d12db9b0bab8..84ae8a23a367 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -524,6 +524,7 @@ void drm_mode_config_cleanup(struct drm_device *dev)
>  	struct drm_property *property, *pt;
>  	struct drm_property_blob *blob, *bt;
>  	struct drm_plane *plane, *plt;
> +	struct drm_colorop *colorop, *copt;
>=20
>  	list_for_each_entry_safe(encoder, enct, &dev->mode_config.encoder_list,
>  				 head) {
> @@ -553,6 +554,11 @@ void drm_mode_config_cleanup(struct drm_device *dev)
>  		drm_property_destroy(dev, property);
>  	}
>=20
> +	list_for_each_entry_safe(colorop, copt, &dev->mode_config.colorop_list,
> +				 head) {
> +		colorop->funcs->destroy(colorop);
> +	}
> +
>  	list_for_each_entry_safe(plane, plt, &dev->mode_config.plane_list,
>  				 head) {
>  		plane->funcs->destroy(plane);
> --
> 2.25.1

