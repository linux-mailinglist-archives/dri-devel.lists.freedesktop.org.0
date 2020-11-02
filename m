Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB03F2A3537
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 21:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E236E2ED;
	Mon,  2 Nov 2020 20:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B01A6E2ED
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 20:36:58 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id g19so4461704otp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 12:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o49aI9WHH7NAbNkzIi0ty0+QOTQw851+/7lSKbsX7Fg=;
 b=oeijeXEKXhV5xtRE9j55yv+gNG2W2k6jyPXkUVtaTFDRhS5kZhTH6Aqw0c8SwZdpd2
 XN9KibCixnfM5J1qLFBFqWFI4fdvQExD18gOgP7XA4GslAt+1qVSDx8qeItuwZc4Lu2Y
 7Gmsx+KiCEd7ZNH5zzJNklPetDB7qgFb7dm2lM/3p8HSHc++eVI6d6dv/KVAP0CowTIQ
 0x6Vt8cs1wIMxc2HdABxQfLEsPawcbuVhA9WA6r52XM3PFt8KdoQFZBu4XW0cULBJD9W
 jffr90QUH+I/sP07B8WL4CyqfGhHp7rNtkRyEB7fBewTWYzoT/TOO2tuqkFqrnDFbFiw
 CDFg==
X-Gm-Message-State: AOAM530m5igKoDDhe0qtOvWZbvfxGlK/ASdqaQDtIasliBx3XKtpsk9I
 1wPuWWr5KjOmP1aDOwHWuSUr/IT8jg==
X-Google-Smtp-Source: ABdhPJzhJo64kJT3Sj2tCRef01F4L5IxDAbzuwCEDkm1GRBRbzYhoif+TuGiltccSnRWvZArs6aYVQ==
X-Received: by 2002:a9d:731a:: with SMTP id e26mr3164822otk.53.1604349417756; 
 Mon, 02 Nov 2020 12:36:57 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id z8sm3839151otm.45.2020.11.02.12.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 12:36:56 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 0/3] dt-bindings: Convert graph bindings to json-schema
Date: Mon,  2 Nov 2020 14:36:53 -0600
Message-Id: <20201102203656.220187-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sameer, I wanted to experiment with what the interface for graph users
looks like, so I've tweaked your patch a bit and converted 2 users.

This series converts the DT graph binding to a schema. Users of the graph
binding should reference the schema from 'ports' or 'port' node. Users
will still need to define what each port node is and any additional
properties that appear in port or endpoint nodes.

I'm still considering whether to apply graph.yaml to the dtschema repo
instead. Then I can sync adding it with a meta-schema update to check
for a reference.

Rob

Rob Herring (2):
  dt-bindings: usb-connector: Add reference to graph schema
  dt-bindings: panel: common: Add reference to graph schema

Sameer Pujar (1):
  dt-bindings: Convert graph bindings to json-schema

 .../bindings/connector/usb-connector.yaml     |  10 +-
 .../bindings/display/panel/panel-common.yaml  |   7 +-
 Documentation/devicetree/bindings/graph.txt   | 129 +-----------
 Documentation/devicetree/bindings/graph.yaml  | 199 ++++++++++++++++++
 4 files changed, 209 insertions(+), 136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/graph.yaml

--
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
