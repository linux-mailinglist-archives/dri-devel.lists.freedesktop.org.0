Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA569FF57C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 02:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6626510E382;
	Thu,  2 Jan 2025 01:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB8910E2FF;
 Thu,  2 Jan 2025 01:50:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F19F25C5F33;
 Thu,  2 Jan 2025 01:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED26C4CECE;
 Thu,  2 Jan 2025 01:50:00 +0000 (UTC)
Date: Wed, 1 Jan 2025 20:49:59 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Cc: Genes Lists <lists@sapience.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 lucas.demarchi@intel.com, stable@vger.kernel.org,
 regressions@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [REGRESSION][BISECTED] Re: 6.12.7 stable new error: event
 xe_bo_move has unsafe dereference of argument 4
Message-ID: <20250101204959.6e297af6@batman.local.home>
In-Reply-To: <5ca1c5b64c313108ea2aa005ae273f1ba8051e7f.camel@linux.intel.com>
References: <2e9332ab19c44918dbaacecd8c039fb0bbe6e1db.camel@sapience.com>
 <9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
 <20241230141329.5f698715@batman.local.home>
 <20241230145002.3cc11717@gandalf.local.home>
 <5f756542aaaf241d512458f306707bda3b249671.camel@sapience.com>
 <20241230160311.4eec04da@gandalf.local.home>
 <0ef755e06b8f0bf1ee4dfd7e743d6222fd795b70.camel@sapience.com>
 <5ca1c5b64c313108ea2aa005ae273f1ba8051e7f.camel@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 01 Jan 2025 21:55:26 +0100
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:

> FWIW, we actually worked around this during the holiday in the drm-xe-
> next branch in the xe driver since it was breaking our CI. Was planning
> to include it for drm-xe-fixes for tomorrow. Since xe appeared to be
> the only driver hitting this, our assumption was that it'd be better
> fixed in the driver.

The driver wasn't broken. I changed the verifier and it incorrectly
flagged that driver's trace event as unsafe. Yeah, it's the only driver
to use an array of strings, but it doesn't mean it was wrong.

-- Steve
